<html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="sign.css">
<title>
Donor Sign Up
</title>
</head>
<body background="children-1149671.jpg" > 
<?php
$dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 
 // Create connection
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);
$donid=0;
function test_input($data) 
{
  $data = trim($data);
  $data = stripslashes($data);
  $data = htmlspecialchars($data);
  return $data;
}
if ($_SERVER["REQUEST_METHOD"] == "POST")
{ 
   $user= test_input($_POST['email']);
   $name=  test_input($_POST['name']);
   $phone= test_input($_POST['phone']);
   $gener=test_input($_POST['gender']);;
   $password=test_input($_POST['password1']);

$sql="select id from donors order by id desc limit 1";
$result=$conn->query($sql);
while($row = $result->fetch_assoc())
{
$donid=$row['id'];
}
$donid=$donid+1;


	$sql="insert into donors values('$donid','$password','$name','$user','$phone','$gener')";
	if($conn->query($sql))
	{
		header("Location:donorlogin.php");
        exit;
	}		
	else
	{  echo "<script> alert('Id already registered !'); window.location.href='donorsignup.php'; </script>";
		
	}

}

?>
<div class="wrap">
<CENTER>
<H1><b><i><font face = "Comic sans MS" color="white">SIGNUP AS A DONOR</FONT></B></I></H1>
</CENTER>
<form name="form"  method="post" action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]);?>" onsubmit="return validate()">
<table align="center">
<tr>
<td><font color="white"><b>Name</font></b><font color="red">*</font> 
<td><input size="60" type="text" name="name" required> <span style="color:white" id="nameerror"></span>
</tr>
<tr>
<td><font color="white"><b>Email</font></b><font color="red">*</font> 
<td><input type="email" size="60"  name="email"  placeholder="abc@xyz.com" required><span style="color:white" id="emailerror"></span>
</tr>
<tr>
<td><font color="white"><b>Phone No.</font></b><font color="red">*</font> 
<td><input type="text" size="60" name="phone" required><span id="phoneerror" style="color:white"></span>
</tr>
<tr>
<td><font color="white"><b>Gender</font></b><font color="red">*</font> 
<td><input type="radio" name="gender" value="M" required><font color="white"><i> Male <input type="radio" name="gender" value="F"> Female <input type="radio" name="gender" value="other"> Other
</font></i><span style="color:white" id="gendererror"></span></tr>
<tr>
<td><font color="white"><b>Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password1" placeholder="Minimum 6 characters(atleast 1 lowercase, 1 uppercase and  1 numeral)" required><span style="color:white" id="pw1error"></span>
</tr>
<tr>
<td><font color="white"><b>Re Enter Password</font></b><font color="red">*</font> 
<td><input type="password" size="60" name="password2" required><span style="color:white" id="pw2error"></span>
</tr>
</table>
<center>
<input type="submit" value="Sign Up" id="btn"></center>
</form>
<div id="Error"></div>
</div>
<script type="text/javascript">
function checkName(form)  /*for name verification*/
{
  var eobj=document.getElementById('nameerror');
  var sName = form.name.value;
  var oRE = /^[a-zA-Z_ ]+$/i;
  var err=false;
  var error='';
  eobj.innerHTML='';
  if (sName == '') {
   error='Error: Name cannot be blank!';
   form.name.focus();
   err=true;
  }
  else if (!oRE.test(sName))
  {
   error="Name cannot contain special characters";
   err=true;
  }
  if (err)
  {
   form.name.focus();
   eobj.innerHTML=error;
   return false;
  }
  return true;
 }
 function checkEmail(form)          /* for email validation */
{
 var eobj=document.getElementById('emailerror');
 eobj.innerHTML='';
 if (/^\w+@[a-zA-Z_]+?\.[a-zA-Z]{2,3}$/.test(form.email.value))
 {
  return true;
 }
 eobj.innerHTML='Invalid E-mail Address! Please re-enter.';
 return false;
}

function validPhone(form)              /* phone no validation */
{
 var eobj=document.getElementById('phoneerror');
 var valid = '0123456789';
 var phones = form.phone.value;
 var err=false;
 var error='';
 var i=0;
 var temp;
 eobj.innerHTML='';
 if (phones == '')
 {
  error='This field is required. Please enter phone number';
    err=true;
 }
 else if (!phones.length > 1 || phones.length < 10)
 {
  error='Invalid phone number! Please try again.';
    err=true;
 }
 else if( ! (/^[0-9]+$/.test(phones)))
    { err=true;
      error='Invalid Phone Number! Please try again.';
    }   
 if (err)
 {
  form.phone.focus();
  eobj.innerHTML=error;
  return false;
 }
 return true;
}

function validatePwd(form)          /* password & retype-password verification */
{
 var eobj1=document.getElementById('pw1error');
 var eobj2=document.getElementById('pw2error');
 var minLength=6;
 var invalid=' ';
 var pw1=form.password1.value;
 var pw2=form.password2.value;
 var err=false;
 var error='';
 eobj1.innerHTML='';
 eobj2.innerHTML='';
 if (pw1.length<1)
 {
  error='Please enter your password.';
    err=true;
 }
 else if (pw1.length < minLength)
 {
  error='Your password must be at least ' + minLength + ' characters long. Try again.';
    err=true;
 }
 else if (pw1.indexOf(invalid) > -1)
 {   err=true;
  error='Sorry, spaces are not allowed.';
 }
 else if( ! (/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/.test(pw1)))
 {    err=true;
    error='Sorry, The password does not match required criteria.';
 }
 if (err)
 {
  form.password1.focus();
  eobj1.innerHTML=error;
  return false
 }
 if (pw1 != pw2)
 { form.password2.focus();
  eobj2.innerHTML=' Passwords not matching.Please re-enter your password.';
  return false;
 }
 return true;
}

function validate()
 {
 var form = document.forms['form'];
 var rtn=true;
 if( ! checkName(form) )
 {
	 rtn=false;
 }
 if( ! checkEmail(form) )
 {
	 rtn=false;
 }

 if( ! validPhone(form))
 {   
     rtn=false;
 }
 
 if( ! validatePwd(form))
 { 
     rtn=false;
 }

 return rtn;
}
</script>
</body>
</html>