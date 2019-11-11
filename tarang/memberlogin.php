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
$username = trim($_POST['name']);
$password = trim($_POST['password1']);
$sql = "SELECT * from campmembers WHERE emailid='$username' AND passwrd='$password'";
$result = $conn->query($sql);

$row=$result->fetch_assoc();

 if($result->num_rows > 0)
 {   

  $_SESSION['parindey']=true;
  $_SESSION['kutumb']=false;
  $_SESSION['loggedin'] = true;
  $_SESSION['donor']=false;
  $_SESSION['userid']=$row['emailid'];
  $_SESSION['memid']=$row['memid'];
  $_SESSION['campid']=$row['campid'];
  $_SESSION['name']=$row['name'];
  $_SESSION['contact']=$row['contact'];
  $_SESSION['datejoin']=$row['datejoin'];
  $_SESSION['gender']=$row['gender'];
  $_SESSION['dob']=$row['dob'];
  $_SESSION['bloodgroup']=$row['bloodgroup'];
  $_SESSION['password']=$row['passwrd'];
  header("Location: tarang.php");
  exit;
 }
  else 
  { $query = "SELECT * from oldagemembers WHERE emailid='$username' AND passwrd='$password'";
    $result2= $conn->query($query);
     $row2=$result2->fetch_assoc();
	  if( $result2->num_rows > 0)
   {
  $_SESSION['parindey']=false;
  $_SESSION['kutumb']=true;;
  $_SESSION['loggedin'] = true;
  $_SESSION['donor']=false;
  $_SESSION['userid']=$row2['emailid'];
  $_SESSION['name']=$row2['name'];
  $_SESSION['contact']=$row2['contact'];
  $_SESSION['datejoin']=$row2['datejoin'];
  $_SESSION['gender']=$row2['gender'];
  $_SESSION['dob']=$row2['dob'];
  $_SESSION['bloodgroup']=$row2['bloodgroup'];
  $_SESSION['password']=$row2['passwrd'];
  $_SESSION['oldmemid']=$row2['memid'];
  $_SESSION['oldhomeid']=$row2['oldagehomeid'];
  header("Location: tarang.php");
  exit;
  }
  else
 {
   $error="Inavlid Username or Password !";
 }
  }
}
?>
<html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="sign.css">
<title>
Member Login
</title>
</head>
<body background="children-1149671.jpg" > 
<div class="wrap">
<CENTER>
<H1><b><i><font face = "Comic sans MS" color="white">MEMBER LOGIN</FONT></B></I></H1>
</CENTER>
<form name="memberlogin" method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>">
<table align="center">
<tr>
<td><font color="white"><b>Email ID</font></b><font color="red">*</font> 
<td><input size="60" type="text" name="name" required>
</tr>
<tr>
<td><font color="white"><b>Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password1"  required>
</tr>
</table>
<center>
<span id="loginerror" style="color:white" > <?php echo $error ; ?></span></center>
<br>
<center>
<input type="submit" class="btn" value="Login" ></center>
</form>
<CENTER>
<br>
<br>
<i><font color="white">NOT A MEMBER YET? &nbsp;&nbsp;</i></font>
<a href="signup.php"><font color="white"> SIGNUP</a></font>
</CENTER>
</div>
<script type="text/javascript">

</script>
</body>
</html>