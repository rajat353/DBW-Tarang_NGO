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
?><html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="sign.css">
<title>
Change Password
</title>
</head>
<body background="children-1149671.jpg" > 
<?php
$dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

if ($_SERVER["REQUEST_METHOD"] == "POST")
{
   $password1=trim($_POST['password1']);
   $password2=trim($_POST['password2']);
   $password3=trim($_POST['password3']);
   $x=$_SESSION['userid'];

$sql = "SELECT * from donors WHERE email='$x' AND passwrd='$password1'";
$result = $conn->query($sql);

 if($result->num_rows == 0)
 {
	echo "<script>alert('Incorrect Current Password'); </script>";
   header("Location:editinfodonar.php");
        exit;
 }
 else
 {

	$sql="UPDATE donors set passwrd='$password2' where email='$x'";
	if($conn->query($sql))
	{
		echo "<script>alert('PASSWORD UPDATED SUCCESSFULLY'); </script>";
		header("Location:tarang.php");
        exit;
	}
 }

}

?>
<div class="wrap">
<CENTER>
<H1><b><i><font face = "Comic sans MS" color="white">CHANGE PASSWORD</FONT></B></I></H1>
</CENTER>
<form name="form"  method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" onsubmit="return validate()">
<table align="center">
<tr>
<td><font color="white"><b>Current Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password1" required><span style="color:white" id="pw1error"></span>
</tr>
<tr>
<td><font color="white"><b>New Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password2"  placeholder="Minimum 6 characters(atleast 1 lowercase, 1 uppercase and  1 numeral)" required><span style="color:white" id="pw2error"></span>
</tr>
<tr>
<td><font color="white"><b>Re Enter New Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password3" required><span style="color:white" id="pw3error"></span>
</tr>
</table>
<center>
<input type="submit" value="Update" id="btn"></center>
</form>
</div>
<script type="text/javascript">


function validatePwd(form)          /* password & retype-password verification */
{
 var eobj1=document.getElementById('pw1error');
 var eobj2=document.getElementById('pw2error');
 var eobj3=document.getElementById('pw3error');
 var minLength=6;
 var invalid=' ';
 var pw1=form.password1.value;
 var pw2=form.password2.value;
 var pw3=form.password3.value;
 var err=false;
 var error='';
 eobj1.innerHTML='';
 eobj2.innerHTML='';
 eobj3.innerHTML='';
 if (pw2.length<1)
 {
  error='Please enter your password.';
    err=true;
 }
 else if (pw2.length < minLength)
 {
  error='Too Short !';
    err=true;
 }
 else if (pw2.indexOf(invalid) > -1)
 {   err=true;
  error='Sorry, spaces are not allowed.';
 }
 else if( ! (/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/.test(pw2)))
 {    err=true;
    error='Does not match required criteria !';
 }
 if (err)
 {
  form.password2.focus();
  eobj2.innerHTML=error;
  return false
 }
 if (pw3 != pw2)
 { form.password3.focus();
  eobj3.innerHTML=' Passwords not matching !';
  return false;
 }
 return true;
}

function validate()
 {
 var form = document.forms['form'];
 var rtn=true;

 if( ! validatePwd(form))
 { 
     rtn=false;
 }

 return rtn;
}
</script>
</body>
</html>