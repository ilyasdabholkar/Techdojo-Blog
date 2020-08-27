from flask import Flask,url_for,render_template,request,session,flash
from flask import redirect
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import desc
from flask_mail import Mail
from datetime import datetime
import math
import json
import os


with open('config.json','r') as json_file:
	params = json.load(json_file)['parameters']

local_server =True
app = Flask(__name__)
app.secret_key='key'
app.config['UPLOAD_FOLDER'] = params['upload_path']
app.config.update(
    MAIL_SERVER = 'smtp.gmail.com',
    MAIL_PORT = '465',
    MAIL_USE_SSL = True,
    MAIL_USERNAME =params['gmail'],
    MAIL_PASSWORD = params['gmail_pass'],
)
mail = Mail(app)

if(local_server):
	app.config['SQLALCHEMY_DATABASE_URI'] = params['local_uri']
else:
	app.config['SQLALCHEMY_DATABASE_URI'] = params['production_uri']

db = SQLAlchemy(app)

class Contacts(db.Model):
	__tablename__ = 'contacts'
	sno = db.Column(db.Integer,primary_key=True)
	name = db.Column(db.String(50),nullable=False)
	email = db.Column(db.String(50),nullable=False)
	phone = db.Column(db.Integer,nullable=False)
	msg = db.Column(db.String(120),nullable=False)
	date = db.Column(db.Integer,nullable=False)

class Posts(db.Model):
	__tablename__ = 'posts'
	post_no = db.Column(db.Integer,primary_key=True)
	post_title = db.Column(db.String(100),nullable=False)
	subheading = db.Column(db.String(60),nullable=True)
	slug = db.Column(db.String(25),nullable=False)
	post_content = db.Column(db.String(500),nullable=False)
	img_file = db.Column(db.String(50),nullable=False)
	post_author = db.Column(db.String(50),nullable=True)
	post_date = db.Column(db.DateTime,nullable=False)

@app.route("/home")
@app.route("/")
def index():
	page=request.args.get('page',1,type=int)
	posts=Posts.query.order_by(Posts.post_date.desc()).paginate(page=page,per_page=params['num_of_display_posts'])
	#posts = Posts.query.order_by(desc(Posts.post_no)).all()[0:params['num_of_display_posts']]
	#return render_template('index.html',params=params,posts=posts)
	return render_template('index.html',posts=posts,params=params)

@app.route("/all_posts")
def all_posts():
	page=request.args.get('page',1,type=int)
	posts=Posts.query.order_by(Posts.post_no.desc()).paginate(page=page,per_page=12)
	return render_template('allposts.html',params=params,posts=posts)

@app.route("/post/<string:post_slug>",methods=['GET'])
def post_route(post_slug):
	post = Posts.query.filter_by(slug=post_slug).first()
	return render_template('post.html',params=params,post=post)

@app.route("/about")
def about():
	return render_template('about.html',params=params)

@app.route("/dashboard",methods=['GET','POST'])
@app.route("/admin",methods=['GET','POST'])
def dashboard():
	page=request.args.get('page',1,type=int)
	list_posts=Posts.query.order_by(Posts.post_no.desc()).paginate(page=page,per_page=12)
	if('user' in session and session['user']==params['admin_user']):
		posts = Posts.query.all()
		return render_template('dashboard.html',params=params,posts=posts,list_posts=list_posts)
	if(request.method=='POST'):
		username=request.form.get('uname')
		password=request.form.get('pass')
		if username==params['admin_user'] and password==params['admin_pass']:
			#set session variable
			session['user'] = username
			posts = Posts.query.all()
			return render_template('dashboard.html',params=params,posts=posts,list_posts=list_posts)
	return render_template('login.html',params=params,list_posts=list_posts)

@app.route("/edit/<string:sno>",methods=["GET","POST"])
def edit(sno):
	if('user' in session and session['user']==params['admin_user']):
		if request.method == 'POST':
			box_title = request.form.get('title')
			subheading = request.form.get('subheading')
			slug = request.form.get('slug')
			content = request.form.get('content')
			img_file = request.form.get('img')
			author = request.form.get('author')
			date = datetime.now()
			if(sno =='0'):
				post = Posts(post_title=box_title,
							subheading=subheading,
							slug=slug,
							post_content=content,
							img_file=img_file,
							post_author=author,
							post_date=date)
				db.session.add(post)
				db.session.commit()
			else:
				post = Posts.query.filter_by(post_no=sno).first()
				post.post_title=box_title,
				post.subheading=subheading,
				post.slug=slug,
				post.post_content=content,
				post.img_file=img_file,
				post.post_author=author,
				post.post_date=date
				db.session.commit()
				return redirect(f'/edit/{sno}')
		post = Posts.query.filter_by(post_no=sno).first()
		return render_template('edit.html',params=params,post=post,sno=sno)

@app.route("/uploader",methods= ['GET', 'POST'])
def uploader():
	if('user' in session and session['user']==params['admin_user']):
		if request.method=='POST':
			f = request.files['uploadedfile']
			f.save(os.path.join(app.config['UPLOAD_FOLDER'],f.filename))
			return "File Uploaded"

@app.route("/delete/<string:sno>",methods=["GET","POST"])
def Delete(sno):
	if('user' in session and session['user']==params['admin_user']):
		post = Posts.query.filter_by(post_no=sno).first()
		db.session.delete(post)
		db.session.commit()
	return redirect('/dashboard')

@app.route("/logout")
def logout():
	session.pop('user')
	return redirect('/')


@app.route("/contact" ,methods = ['GET', 'POST'])
def contact():
	if(request.method=='POST'):
		'''add entries to database'''
		name = request.form.get('name')
		email = request.form.get('email')
		phone = request.form.get('phone')
		msg = request.form.get('message')
		database_entries = Contacts(name=name,phone=phone,msg=msg,date=datetime.now(),email=email)
		db.session.add(database_entries)
		db.session.commit()
		mail.send_message(subject="message from "+name,
						sender=email,
						recipients=[params['gmail']],
						body= msg + "\n phone:" + str(phone)
						)
		flash("Thanks for contacting us. We will get back to you soon","success")
	return render_template('/contact.html',params=params)
	
app.run(debug=True)
