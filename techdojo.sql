-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 26, 2020 at 09:27 AM
-- Server version: 10.4.13-MariaDB
-- PHP Version: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `techdojo`
--

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `sno` int(11) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone` int(15) NOT NULL,
  `msg` varchar(120) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contacts`
--

INSERT INTO `contacts` (`sno`, `name`, `email`, `phone`, `msg`, `date`) VALUES
(1, 'unknown', 'xy@gmail.com', 2112345787, 'hello first', '2020-07-10 11:50:58'),
(2, 'ilyas', 'abc@gmail.com', 2147483647, 'hello seconf', '2020-07-10 11:54:19'),
(3, 'shubham', 'shubhamkelaskar25@gmail.com', 2147483647, 'hello i am shubham', '2020-07-20 16:56:29');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `post_no` int(5) NOT NULL,
  `post_title` varchar(100) NOT NULL,
  `subheading` varchar(200) DEFAULT NULL,
  `slug` varchar(25) NOT NULL,
  `post_content` text NOT NULL,
  `img_file` varchar(50) NOT NULL,
  `post_author` text DEFAULT NULL,
  `post_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`post_no`, `post_title`, `subheading`, `slug`, `post_content`, `img_file`, `post_author`, `post_date`) VALUES
(1, 'The 5 Best Productive Mac Apps', 'Apple\'s macOS is a good operating system, but it\'s missing some key ingredients. These apps will help you to get the most out of your Mac.', 'first-post', '<p><h5><b>1)</b><u>BetterSnapTool ($3)</h5></u>Yes, you can use Split View on macOS to view two applications side by side, but it\'s nowhere near as intuitive as it is on Microsoft\'s Windows, where you can simply drag a window to a corner and have it snap into place. This app is worth the $3 if you don\'t want to mess with resizing window borders constantly. Magnet is another good option that costs the same.</P>\r\n<p><h5><b>2)</b><u>Amphetamine (Free)</h5></u>If you\'ve ever had to keep wiggling a finger on the trackpad during a movie or YouTube video to stop the screen from going to sleep over and over (or maybe during a particularly long download), you\'ll appreciate an app that lets you keep the screen on for certain tasks. It even works with external displays. Sure, you can keep going into your system preferences to change the screensaver and hard disk shutdown settings, but that can get tiresome quickly.</p>\r\n<p><h5><b>3)</b><u>Alfred (Free)</u></h5>The default search tool on macOS isn\'t bad, but there\'s room for it to go deeper. Alfred is a supercharged alternative that lets you create custom shortcuts to programs and file folders, activate system commands by typing, create automated custom workflows that begin with the push of a button or a typed phrase, and, well, a lot more. It\'s free, but you can pay 25 British pounds (around $32) for a single user license to access the full feature set or 45 British pounds (around $57) for a lifetime of free upgrades to subsequent versions of Alfred.</p>\r\n<p><h5><b>4)</b><u>AdGuard ($30 per year)</h5></u>AdGuard\'s stand-alone macOS app lets you choose from and custom-toggle a huge array of filters to block social media extensions, pop-up ads, URL redirects, and a whole lot more. It works not only on your browser but also on other apps you have installed. There\'s a free two-week trial, but you\'ll need to pay for a license to use it after the trial expires. For $2.49 per month, you get access to the service on three devices simultaneously.</p>\r\n<p><h5><b>5)</b><u>LibreOffice (Free)</h5></u>Tired of paying for Microsoft Office, unimpressed with Apple\'s default office suite, and unable or unwilling to switch entirely over to Google\'s G Suite on the cloud for everything? Download LibreOffice, a full-featured suite that includes the usual applications, such as a word processor and spreadsheet editor. It\'s completely compatible with all the usual Microsoft file types, including legacy formats such as .doc. It\'s open source and costs nothing to use, even commercially. For goodwill, donate a few bucks if you end up liking and using it a lot.</p>\r\n\r\n', 'macapps.jpg', 'ilyas Dabholkar', '2020-07-19 20:01:33'),
(2, 'How to Know If You\'ve Been Hacked-Precautions', 'EVERYONE IS VULNERABLE to the threat of cybercriminals or hackers getting access to your information, but the threats aren’t equal for everyone.', 'second-post', '<p>The average person will likely face fewer sophisticated threats than, say, a senior politician, activist or CEO. More high-profile figures may be targeted with phishing emails that are looking to steal secrets from corporate networks or initiate the transfer of large sums of money. You, your friends and your family will likely face different threats: from people you know seeking revenge, or, more likely, crime groups using automated tools to scoop up credentials en masse.</p>\r\n<p>“We all like to think that we’re not susceptible to social engineering or other kinds of cyberattacks but the truth is that even intelligent, self-aware people still get caught up in online scams that can have very damaging consequences,” says Jake Moore, a cybersecurity specialist at Eset, an internet security company. “Many people will even admit they don’t click on phishing emails but may still get caught up in online scams. A number of emails may still slip through the net without realization and can have serious effects financially or socially.”</P>\r\n<p>Understanding the threats is key. Everyone has their own threat model that includes things that matter most to them – what’s important to you may not be equally important to someone else. But there’s a value to everything you do online: from Facebook and Netflix to online banking and shopping. If one of your accounts is compromised, stolen login information or financial details can be used across the web. It’s that sort of scenario that lets people order takeaways through compromised Deliveroo accounts.</p>\r\n<p>While Facebook, Twitter, Instagram, and other social networks are less likely to contain your credit card details there are other types of risk. Hacked social media accounts can be used to post compromising messages that could embarrass or defame somebody, be used for harassment or building up a picture of who you are and everyone you know.</p>\r\n<p>“Discovering if you have been hacked can be a rather complicated task,” Moore adds. “You could wait to have it proven by losing control to your precious accounts although like anything, it is better to be proactive and stop it from happening in the future.” If you think you’ve been hacked, here’s where to start and what you can do next.</p>\r\n<h3>Spot Unusual Behavior</h3>\r\n<p>The clearest sign that you’ve been hacked is when something has changed. You might not be able to access your Google account using your regular username and password or there may have been a suspicious purchases charged to one of your bank accounts. These are fairly obvious indications that you’ve been compromised in some way—and hopefully banks will detect any suspicious payments before things spiral too far.</p>\r\n<p>However, before any of your accounts are compromised there may be warning signs. The account that someone is trying to break into may warn you about unusual attempts to log in: for instance, Facebook and Google will send notifications and emails alerting you to attempts to access your account. This will usually be if someone has tried to get in and failed but alerts can also be when someone has successfully signed-in from unfamiliar locations.</p>\r\n<h3>Take Back Control</h3>\r\n<p>First of all, you should get in touch with the company that owns your account. Every firm will have their own policies, procedures and recovery steps when it comes to compromised accounts—these can easily be found through an online search. (Facebook’s compromised account tool is here; Google’s is here; and Netflix’s is here).</p>\r\n<p>Account recovery through the company where you’ve been hacked is the first step in taking back control. You should make sure that all apps and software you use (on phone and desktop) are up to date. What other action you take is specific to what was compromised. For instance, if you can get back into a hacked email account it is worth checking the settings to make sure they’ve not been manipulated. A setting to automatically forward all your emails to another account may have been turned on, for example.\r\n\r\nYou should change the password of the compromised account and any other accounts that use the same password (more on that later) and get in touch with anyone who may have been impacted by the hack. For instance, if messages have been sent from your Instagram account or you’re forced to create a brand new social media account, you may need to let friends and family know the details of the new account or explain what the random messages were about.</p>', '2post.jpg', 'ilyas dabholkar', '2020-07-19 20:12:46');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`sno`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`post_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `post_no` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
