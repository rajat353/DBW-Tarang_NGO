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

<title>Member Profile</title>
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
					<li class="bold"><a href="payment.php">Donate</a></li>
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
<h2>Personal Profile</h2><br><br>



<table cellpadding="10" cellspacing="10s" >
<tr>
	<td>Name:
	<td><?php echo $_SESSION['name'];?>
</tr>
<tr>
	<td>Contact:
	<td><?php echo $_SESSION['contact'];?>
</tr>
<tr>
	<td> D.O.B:
	<td><?php echo $_SESSION['dob'];?>
<tr>
</tr>
	<td>Gender:
	<td><?php echo $_SESSION['gender'];?>
</tr>
<tr>
	<td>Date Of Join:
	<td><?php echo $_SESSION['datejoin'];?>
</tr>
<tr>
	<td>Blood Group:
	<td><?php echo $_SESSION['bloodgroup'];?>
</tr>
</table>

<center>

<i><h4>search for members</i></h4><br>
<?php
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 // Create connection 
 $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);
 $query = $conn->query("select distinct city from campdetails union select distinct city from oldagehomes"); 
 ?>
 <select name="pref_id" id="pref_id" onChange="getState(this.value);">
 <option value="" selected>Select Preference</option>
<option value="camp">Parindey</option>
<option value="home">Kutumb</option>
 </select>
 <br>
 <br>
 <select name="city" id="city" onchange="getMembers(this.value)">
<option value=''>Select City</option>
 </select>
 <br>
 <br>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
 <script>
function getState(val) {
	$.ajax({
	type: "POST",
	url: "getcity.php",
	data:'pref_id='+val,
	success: function(data){
		$("#city").html(data);
	}
	});
}
</script>
<div id="members" name="members"> </div>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
 <script>
function getMembers(val) {
	$.ajax({
	type: "POST",
	url: "getmem.php",
	data:'city_id='+val,
	success: function(data){
		$("#members").html(data);
	}
	});
}
</script>
<?php
if( $_SESSION['parindey']==true)
{?>
<i><h4>Your Students</i></h4><br>
 <?php
    $memid= $_SESSION['memid'];
	$query = $conn->query("SELECT children.id, children.name, children.guardianName, children.guardiancontact, children.datejoin, children.gender, children.dob,children.bloodgroup from children,campmembers,teaches where children.id=teaches.childid and campmembers.memid=teaches.memid and teaches.memid='$memid'"); 
?>
<table >
<tr>
<th>Child ID&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Gender&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Guardian Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Contact&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Date of Joining&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Date of Birth&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Blood Group&nbsp;&nbsp;&nbsp;&nbsp;</th>
<?php
	foreach($query as $row) {
		?>
		<tr>
		<?php
	      echo "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['id']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['name']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['gender']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['guardianName']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['guardiancontact']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['datejoin']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['dob']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['bloodgroup']; 
		  ?>
		  </tr>
		  <?php
	}
?>
</table>
<?php } ?>
<?php
if( $_SESSION['kutumb']==true)
{?>
<i><h4>Dependents</i></h4><br>
 <?php
    $memid= $_SESSION['oldmemid'];
	$query = $conn->query("SELECT oldpeople.id, oldpeople.name, oldpeople.contact, oldpeople.datejoin, oldpeople.gender, oldpeople.dob, oldpeople.bloodgroup from oldpeople,oldagemembers,helps where oldpeople.id=helps.oldpeopleid and oldagemembers.memid=helps.memid and helps.memid='$memid'"); 
?>
<table >
<tr>
<th>Dependent ID&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Gender&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Contact&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Date of Joining&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Date of Birth&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Blood Group&nbsp;&nbsp;&nbsp;&nbsp;</th>
<?php
	foreach($query as $row) {
		?>
		<tr>
		<?php
	      echo "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['id']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['name']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['gender']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['contact']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['datejoin']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['dob']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['bloodgroup']; 
		  ?>
		  </tr>
		  <?php
	}
?>
</table>
<?php } ?>
</div>
</body>
</html>