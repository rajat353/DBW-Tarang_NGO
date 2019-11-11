<?php
 session_start();
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 $error='';
 // Create connection
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);
if($_SERVER["REQUEST_METHOD"] == "POST")
{
$username = trim($_POST['email']);
$password = trim($_POST['password1']);
$sql = "SELECT * from donors WHERE email='$username' AND passwrd='$password'";
$result = $conn->query($sql);
$row = $result->fetch_assoc();
 if($result->num_rows > 0)
 {
	 $_SESSION['loggedin'] = true;
	 $_SESSION['donor']=true;
  $_SESSION['userid']=$row['email'];
  $_SESSION['id']=$row['id'];
  $_SESSION['name']=$row['name'];
  $_SESSION['contact']=$row['contact'];
  $_SESSION['gender']=$row['gender'];
  $_SESSION['password']=$row['passwrd'];
  header("Location: tarang.php");
  exit;
 }
  else
 {
   $error="Inavlid Username or Password !";
 }
 
}
?><html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="sign.css">
<title>
Donor Login
</title>
</head>
<body background="children-1149671.jpg" > 
<div class="wrap">
<CENTER>
<H1><b><i><font face = "Comic sans MS" color="white">DONOR LOGIN</FONT></B></I></H1>
</CENTER>
<form method="post" name="donorlogin" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
<table align="center">
<tr>
<td><font color="white"><b>Email</font></b><font color="red">*</font> 
<td><input type="email" size="60"  name="email" required>
</tr>
<tr>
<td><font color="white"><b>Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password1" required>
</tr>
</table>
<center>
<span id="loginerror" style="color:white" > <?php echo $error ; ?></span></center>
<br>
<center>
<center>
<input type="submit" class="btn" value="Proceed"></center>
</form>
<CENTER>
<I><font color="white">NOT REGISTERD YET? &nbsp; &nbsp;</I></FONT>
<A HREF="donorsignup.php"> <font color="white">Register</A>
</FONT>
</CENTER>
</div>

</body>
</html>