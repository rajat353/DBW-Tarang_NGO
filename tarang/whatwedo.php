<?php
session_start();
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true)
{ 
     $login=true;
	 if (isset($_SESSION['donor']) && $_SESSION['donor'] == true)
    { 
     $donor=true;
	 $member=false;
    }
else
   {
	$member=true;
	$donor=false;
	}
}
else
{
	$login=false;
}
?>
<!DOCTYPE html>
<html lang="en" style="margin-top:0px !important;">
<head>

<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="theme-color" content="#ffffff">

<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">

<title>What We Do</title>

<link rel='stylesheet' id='abc_style-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/advanced-browser-check/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-layout-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce/assets/css/woocommerce-layout.css?ver=2.6.9' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-smallscreen-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.css?ver=2.6.9' type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' id='woocommerce-general-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce/assets/css/woocommerce.css?ver=2.6.9' type='text/css' media='all' />
<link rel='stylesheet' id='contact-form-7-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.0.1' type='text/css' media='all' />
<link rel='stylesheet' id='cookie-bar-css-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/cookie-bar/css/cookie-bar.css' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-nyp-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce-name-your-price/assets/css/name-your-price.css?ver=2.4.2' type='text/css' media='all' />
<link rel='stylesheet' id='wp-featherlight-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/wp-featherlight/css/wp-featherlight.min.css?ver=1.1.0' type='text/css' media='all' />
<link rel='stylesheet' id='main-style-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='davidshepherd-style-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/davidshepherd-styles.css?ver=1540921961' type='text/css' media='all' />
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/advanced-browser-check/js/jquery.cookie.js'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/advanced-browser-check/js/script.js'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/cookie-bar/js/cookie-bar.js?ver=1540921961'></script>
<link rel='stylesheet' href='new2.css'>
</head>

<body class="home page-template page-template-frontpage page-template-frontpage-php page page-id-2 wp-featherlight-captions group-blog" >
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TJ3FCS8"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<link REL="StyleSheet" TYPE="text/css" HREF="ex.css">
	<div class="header">
		<div class="inner-inner-container">

			<div class="menu-divider"></div>
            <div class="header-left">
				<a class="logo hide-on-mobile" href="tarang.php" rel="home"><img src="logo.png" alt="David Shepherd Foundation"></a>
			</div>
			<nav class="header-right">
				<ul class="desktop-nav">
					<li> <a href="tarang.php">Home</a> </li>
					<li> <a href="aboutus.php">About Us</a> </li>
                    <li> <a href="whatwedo.php" >What We Do</a> </li>
					<li> <a href="reviewadd.php">Contact Us</a></li>
					<li> <a href="reviews.php">Testimonials</a></li>

					<?php if($login==false){?>
					<li class="bold"><a href="memberlogin.php">Member Login</a></li>
					<li class="bold"><a href="donorlogin.php">Donor Login</a></li>
					<?php }
					      elseif($donor==true){ ?>
					<li> <a href="editinfodonar.php">Change Password</a></li>
					<li class="bold"><a href="payments.php">Donate</a></li>
					<li class="bold"><a href="donorprofile.php"><?php echo $_SESSION['name'];?></a></li>
					<li class="bold"><a href="logout.php">Logout</a></li>
					<?php }
					      else{ ?>
					<li> <a href="editinfo.php">Change Password</a></li>
					<li class="bold"><a href="profile.php"><?php echo $_SESSION['name'];?></a></li>
					<li class="bold"><a href="logout.php">Logout</a></li>
					<?php }?>
				</ul>
				
			</nav>
		</div>
	</div>
  <div class="wrap">
	<h1><font color='86C960' style='chiller'><u><i><center>Parindey:</center></h1></font></u></i><br>
<h2>Vision:</h2><br>
<font size=5>It is Parindey’s motto to impart basic education to under privileged children. The emphasis is on providing education not in a typical classroom manner,
but to give a child a wider canvas of exposure in a socio-cultural environment. Literacy India envisions to keep its student’s at par with the fast 
evolving world around them. In line with this thought, Literacy India is looking at transforming the education landscape through exposing the student 
to a more innovative and non-traditional method of learning. This includes fun activities and workshops on group learning, drama, dance, role plays etc.
Eminent personalities from different walks of life come and interact with the children and prove to be a catalyst to the child’s motivation and enthusiasm
 to do well. The interest generated in these activities also helps identify talent which, with further guidance can pursue further education or vocational 
 training.<br></font>
<h2>We believe that:</h2><br>
<font size=5>– All human beings are created in the image of God, and are of equal worth. Therefore the poor have the same inherent dignity, and rights that deserve our protection.
– Every person has a right to affordable healthcare that will allow the best possible chance of living a productive and fulfilling life.
– Every child has a right to an education that will give them the opportunity to reach their potential, earn a living and grow in self-esteem.
– Shelter, safe water and sanitation should be available to all, regardless of their background or status within society..
– Communities working together are capable of achieving great change, and can influence others to also strive for change.
– The poor deserve the chance to improve their financial status and their quality of life, and to break free from the cycle of poverty.<br></font>

<h2>We are commiteed :</h2><br> 

<font size=5>
<li>
<ul>•	To provide children with vocational skills.</ul>
<ul>•	To identify children from under privileged backgrounds and help build their confidence and awareness.</ul>
<ul>•	To support children in active schooling to provide minimum levels of learning.</ul>
<ul>•	To nurture, mentor and assist children to become human resource assets in the community and future role models to many.</ul>
<ul>•	To improve the self esteem and confidence of kids from the under privileged segment.</ul><br></font></li>
<br><br><br>
</div>
<div class="wrap">

<h1><font color='86C960' style='chiller'><u><i><center>KUTUMB:</center></h1></font></u></i><br>

<h2>Vision:</h2>
<font size=5>It was set up in 2010 and is registered under the Societies’ Registration Act of 1860 with a vision to advocate for the needs of elderly such as for Universal Pension, quality healthcare, action against Elder Abuse and many more at a national, state and societal level with Central and State governments. It advocates for elder friendly policies and their implementation thereof. It works hand-in-hand with Senior Citizens Associations understanding elder need working with and for them.
</font>
<h2>We believe that:</h2>
<font size=5>– All human beings are created in the image of God, and are of equal worth. Therefore the elderly have the same inherent dignity, and rights that deserve our protection.
– Every person has a right to affordable healthcare that will allow the best possible chance of living a productive and fulfilling life.
</font>
<font size=5></font>
	
</body>
</html>
	
	
	
	
	
	
	
