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
<link href='//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css' rel='stylesheet' type='text/css'>
<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet">
<title>TARANG - Serving Humanity</title>
<link rel='stylesheet' id='abc_style-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/advanced-browser-check/css/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-layout-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce/assets/css/woocommerce-layout.css?ver=2.6.9' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-smallscreen-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce/assets/css/woocommerce-smallscreen.css?ver=2.6.9' type='text/css' media='only screen and (max-width: 768px)' />
<link rel='stylesheet' id='woocommerce-general-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce/assets/css/woocommerce.css?ver=2.6.9' type='text/css' media='all' />
<link rel='stylesheet' id='contact-form-7-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/contact-form-7/includes/css/styles.css?ver=5.0.1' type='text/css' media='all' />
<link rel='stylesheet' id='woocommerce-nyp-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/woocommerce-name-your-price/assets/css/name-your-price.css?ver=2.4.2' type='text/css' media='all' />
<link rel='stylesheet' id='wp-featherlight-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/wp-featherlight/css/wp-featherlight.min.css?ver=1.1.0' type='text/css' media='all' />
<link rel='stylesheet' id='main-style-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/style.css' type='text/css' media='all' />
<link rel='stylesheet' id='davidshepherd-style-css'  href='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/davidshepherd-styles.css?ver=1540921961' type='text/css' media='all' />
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-includes/js/jquery/jquery.js?ver=1.12.4'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-includes/js/jquery/jquery-migrate.min.js?ver=1.4.1'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/advanced-browser-check/js/jquery.cookie.js'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/plugins/advanced-browser-check/js/script.js'></script>
<link rel='stylesheet' href='new2.css'>
</head>

<body class="home page-template page-template-frontpage page-template-frontpage-php page page-id-2 wp-featherlight-captions group-blog" >
<noscript><iframe src="//www.googletagmanager.com/ns.html?id=GTM-TJ3FCS8"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>


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

<div id="fullpage">
	<div class="header-slider">
	
		    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1488521787991-ed7bbaae773c?ixlib=rb-0.3.5&s=101b5c6b052dd42f62f3dae634dbdea8&auto=format&fit=crop&w=1500&q=80')" data-type="background" data-speed="10">
		    	<div class="slide-content">
		    		<div class="slide-text">
		    			<h1>DON'T LET THEM FIGHT ALONE...</h1>
		    			<div class="hero-buttons">
		    				<a href="aboutparindey.php" class="button button-white">Parindey</a>
		    			</div>
		    		</div>
	    			
		    	</div>
		    </div>
			
	    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1484774374809-69b9da12d46e?ixlib=rb-0.3.5&s=7b16c4a2006a1a927d12ab6fb5515c3f&auto=format&fit=crop&w=1050&q=80')" data-type="background" data-speed="10">
	    	<div class="slide-content">
	    		<div class="slide-text">
	    			<h1> <br class="hide-on-desktop">EDUCATION IS SOUL CRAFTING</h1>
	    			  <div class="hero-buttons">
		    				<a href="aboutparindey.php" class="button button-white">Parindey</a>
					  </div>
	    		</div>
    			
	    	</div>
	    </div>

		
		    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1446161543652-83eaa65fddab?ixlib=rb-0.3.5&s=8a6868d5e23e46d1b7524b39f46d6b1e&auto=format&fit=crop&w=1500&q=80')" data-type="background" data-speed="10">
		    	<div class="slide-content">
		    		<div class="slide-text">
		    			<h1>EVERYBODY DESERVES RESPECT</h1>
		    			<div class="hero-buttons">
		    				<a href="aboutkutumb.php" class="button button-white">Kutumb</a>
			    		</div>
		    		</div>
	    			
		    	</div>
		    </div>

		
		    <div class="slide" style="background-image: url('https://images.unsplash.com/photo-1490349708435-19d432984978?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8778bf8a389014c483ed95ad9a431dd7&auto=format&fit=crop&w=1187&q=80')" data-type="background" data-speed="10">
		    	<div class="slide-content">
		    		<div class="slide-text">
		    			<h1>OLD AGE. THE CROWN OF LIFE </h1>
		    			<div class="hero-buttons">
		    				<a href="aboutkutumb.php" class="button button-white">kutumb</a>
		    			</div>
		    		</div>
		    	</div>
		    </div>
      </div>
</div>

<div class="homepage-section section-3 full-height parallax" id="section-3">
	<div class="inner-inner-container">
		<div class="left">
			<h2>TARANG</h2>
			<h2 class="bold">Serving Humanity</h2>
			<p><p>Every child has a right to an education that will give them the opportunity to reach their potential, earn a living and grow in self-esteem. Hunger, lower social status, chores, early marriage, school safety and sanitation are all barriers preventing a girl from receiving a proper education. Education improves long term environmental stability, by promoting concern, awareness and new attitudes.
				<p>Not only do we care about at the children, Here at TARANG the elderly are also taken care of. Several old age homes are being operated. All human beings are created in the image of God, and are of equal worth. Therefore the elderly have the same inherent dignity, and rights that deserve our protection when their children are too obliviant to take care of them.
</p>
			</p>
			
		</div>
		<div class="right">
			<div class="icons">
				<a href="https://davidshepherd.org/about">
					<span class="box">
						<span class="content">
							<img src="https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/assets/images/icons/icon-history.png" alt="">
							<h6>About us</h6>
						</span>
					</span>
				</a>
				
			</div>
			<h3><p>“WE BELIEVE EVERY PERSON DESERVES THE CHOICE TO LIVE WITH DIGNITY NOT DEPENDENCE"</p>
</h3>
			
		</div>
	</div>
</div>
<div class="homepage-section section-7 full-height" id="section-7">
	<div class="inner-inner-container">
		<h2>News</h2>
			
				<div class="article">
					<div class="image" style="background-image:url(' https://images.unsplash.com/photo-1522661067900-ab829854a57f?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=98ab998ad1c2d57dec33d1ee937fa82d&auto=format&fit=crop&w=500&q=60')"></div>
					<div class="content">
						<a href="https://davidshepherd.org/news/2019-wildlife-artist-year-opens-entries"><h5>NGO asks Government to focus on Girl Education</h5></a>
						<p class="date">16th November 2018</p>
					   <p>A Non Governmental Organisation (NGO), TARANG with the motto of Serving Humanity yesterday tasked Indian government to pay more attention to the girl-child education.</p>
                        <p>“The cultural festival is a form of exhibition amongst secondary schools in the state aiming at promoting and sensitizing the youth on issues relating to their culture,” said one of the founding members, Utsav Gupta.</p>		
					</div>
				</div>

				
				<div class="article">
					<div class="image" style="background-image:url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCDN8FmU7PY6-svwNPXKUd5AwUEDPxjbiaUokk1ugD9izPaP1c')"></div>
					<div class="content">
						<a href="https://davidshepherd.org/news/dswf-team-working-wildlife-cites"><h5>CM Yogi to donate for Old Age Homes</h5></a>
						<p class="date">17th November 2018</p>
						<p> A 74 year old man from Kanpur donated Rs 50,000 to an Old Age Home named Kutumb under the NGO Tarang. On the 8th Annual General Meeting of the Old Age Home on Tuesday, Chief Minister of Uttar Pradesh, Yogi Adityanth felicitated mendicant Sudhakar.</p>
						<p>Currently, there are more than 100 senior citizens living at the Old Age Home in Kanpur.“The state government has planned to provide Rs 5,000 to each senior citizens as allowance,” said CM Yogi. </p> 
					</div>
				</div>

				
				<div class="article">
					<div class="image" style="background-image:url('https://www.thebetterindia.com/wp-content/uploads/2018/11/menaka-f.jpg')"></div>
					<div class="content">
						<a href="https://davidshepherd.org/news/chimpanzee-rescue-guinea"><h5>The story of empowerment of Menaka</h5></a>
						<p class="date">17 November 2018</p>
						<p>Menaka was a young child when her father abandoned their family. She had to work in several homes to ensure that she could provide for her daughters and to give them a safe environment. </p>
						<p>But Menaka was a promising kid and to ensure that her learning curve wasn’t affected by their economic situation, her mother decided to enrol her into a school with the help of Tarang NGO.</p>

					</div>
				</div>

				
	+
	-
	</div>
</div>


		<div class="footer">
				<div class="footer-footer">
					<p>
						<span itemscope itemtype="//schema.org/Organization">
						   <span itemprop="name">TARANG-Serving Humanity&nbsp;&nbsp;&nbsp;&nbsp;</span>
						   <a href="https://www.google.com/maps/place/113%2F115+A,+Khalasi+Line,+Swaroop+Nagar,+Kanpur,+Uttar+Pradesh+208002/@26.4799579,80.3143777,17z/data=!3m1!4b1!4m5!3m4!1s0x399c386344fadfb7:0x22d8f08ae0712e9d!8m2!3d26.4799579!4d80.3165717">
						   <span itemscope itemtype="//schema.org/PostalAddress">
						     <span itemprop="streetAddress">113-HA, Swarup nagar, Kanpur</span>,
						     <span itemprop="addressLocality">Uttar pradesh</span>,
						     <span itemprop="postalCode">208002</span></a>&nbsp;&nbsp;&nbsp;&nbsp;
						   </span>
						   <span itemprop="telephone"><a href="callto:+91 9812651273">+91 9812651273</a> </span>

						   <span itemprop="email">&nbsp;&nbsp;&nbsp;&nbsp;Email: <a href="mailto:kanpurhq@tarang.com">kanpurhq@tarang.com</a></span>
						</span>


						<div class="lat-long" itemscope itemtype="//schema.org/GeoCoordinates">
						   <span itemprop="latitude"> 51.2133708 </span>
						   <span itemprop="longitude"> -0.5690914 </span>
						</div>
					</p>

					<p>Registered Charity No. 1106893&nbsp;&nbsp;&nbsp;&nbsp;
				</div>
		</div>

	</div> 
</div> 

</script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/assets/js/slickslider.min.js?ver=20151215'></script>
<script type='text/javascript' src='https://1wb2ok4yur8wup6e18zwc47r-wpengine.netdna-ssl.com/wp-content/themes/davidshepherd/assets/js/main.js?ver=20151273'></script>


</body>
</html>
