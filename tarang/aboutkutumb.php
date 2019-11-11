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

<title>Kutumb</title>
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

	
		<h1><font color='86C960' style='chiller'><u><i><center>Kutumb</center></h1></font></u></i><br><br>

<font size=5>Kutumb India is a non-profit NGO in India working with and for disadvantaged elderly for nearly 5 years. It was set up in 2010 and is registered under the Societies’ Registration Act of 1860. There are an estimated 104 million elderly in India. Kutumb advocates for their needs such as for Universal Pension, quality healthcare, action against Elder Abuse and many more at a national, state and societal level with Central and State governments. It advocates for elder friendly policies and their implementation thereof. It works hand-in-hand with Senior Citizens Associations understanding elder need working with and for them<br></font>
<br>
<font size=5>Recognizing the work being done by Kutumb ECOSOC has granted Special Consultative Status to Kutumb at United Nations since 2011. It is associated with Department of Public Information, United Nations (UN-DPI-NGO). Kutumb has also been member of various Working Groups and Steering Committees on Social Sector for three consecutive Five-Year-Plans of Planning Commission of India since 2010.</font>
