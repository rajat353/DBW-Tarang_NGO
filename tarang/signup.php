<html>
<head>
<link REL="StyleSheet" TYPE="text/css" HREF="sign.css">
<title>
Member Sign Up
</title>
</head>
<body background="children-1149671.jpg" > 
<?php
$dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 
$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);
$memid=0;
$campid=0;
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
   $date=date("Y-m-d");
   $gener=test_input($_POST['gender']);
   $dob=test_input($_POST['dob']);
   $bg=test_input($_POST['bloodgroup']);
   $password=test_input($_POST['password1']);
   $city=test_input($_POST['city']);
   $pref=test_input($_POST['pref_id']);

if($pref=='camp')
{
$sql="select campid,memid from campmembers,campdetails where campdetails.id=campmembers.campid and campdetails.city= '$city' order by memid desc limit 1";
$result=$conn->query($sql);
while($row = $result->fetch_assoc())
{
$campid=$row['campid'];
$memid = $row['memid'];
}
$memid=$memid+1;


	$sql="insert into campmembers values('$memid','$campid','$name','$user','$phone','$date','$gener','$dob','$bg','$password')";
	if($conn->query($sql))
	{
		header("Location:memberlogin.php");
        exit;
	}		
	else
	{  echo "<script> alert('Id already registered !'); window.location.href='signup.php'; </script>";
		
	}
}
elseif($pref=='home')
{
$sql="select oldagehomeid,memid from oldagemembers,oldagehomes where oldagehomes.id=oldagemembers.oldagehomeid and oldagehomes.city= '$city' order by memid desc limit 1";
$result=$conn->query($sql);
while($row = $result->fetch_assoc())
{
$campid=$row['oldagehomeid'];
$memid = $row['memid'];
}
$memid=$memid+1;


	$sql="insert into oldagemembers values('$memid','$campid','$name','$user','$phone','$date','$gener','$dob','$bg','$password')";
	if($conn->query($sql))
	{
		header("Location:memberlogin.php");
        exit;
	}		
	else
	{  echo "<script> alert('Id already registered !'); window.location.href='signup.php'; </script>";
		
	}
}
}

?>
<div class="wrap">
<CENTER>
<H1><b><i><font face = "Comic sans MS" color="white">SIGNUP AS A MEMBER</FONT></B></I></H1>
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
 <td><font color="white"><b>Preference</font></b><font color="red">*</font> 
 <td><select class="custom-select" name="pref_id" id="pref_id" onChange="getState(this.value);">
 <option value="" selected>Select Preference</option>
<option value="camp">Parindey</option>
<option value="home">Kutumb</option>
 </select>
 <style>
 .custom-select
  position: relative
  display: block
  max-width: 400px
  min-width: 180px
  margin: 0 auto
  border: 1px solid #3C1C78
  background-color: #16013E
  z-index: 10
  
  select
    border: none
    outline: none
    background: transparent
    -webkit-appearance: none
    -moz-appearance: none
    appearance: none
    border-radius: 0
    margin: 0
    display: block
    width: 100%
    padding: 12px 55px 15px 15px
    font-size: 14px
    color: #714BB9
  
  &:after
    position: absolute
    right: 0
    top: 0
    width: 50px
    height: 100%
    line-height: 38px
    content: '\2228'
    text-align: center
    color: #714BB9
    font-size: 24px
    border-left: 1px solid #3C1C78
    z-index: -1
  
body
  margin-top: 80px
  background-color: #1A004A
 </style>
 </tr>
 <tr><td><td></tr>
 <tr>
 <td><font color="white"><b>City</font></b><font color="red">*</font> 
 <td><select class="custom-select" name="city" id="city">
<option value=''>Select City</option>
 </select></tr>
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
<tr>
<td><font color="white"><b>Gender</font></b><font color="red">*</font> 
<td><input type="radio" name="gender" value="M" required><font color="white"><i> Male <input type="radio" name="gender" value="F"> Female <input type="radio" name="gender" value="other"> Other
</font></i><span style="color:white" id="gendererror"></span></tr>
<tr>
<td><font color="white"><b>Date of Birth</font></b><font color="red">*</font> 
<td><input type="date" size="60"  name="dob"  placeholder="yyyy-mm-dd" required> <span style="color:white" id="doberror"></span>
</tr>
<tr>
<td><font color="white"><b>Blood Group</font></b> 
<td><input type="text" size="60"  name="bloodgroup" ><span style="color:white" id="bgerror"></span>
</tr>
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
 eobj.innerHTML='Invalid E-mail Address!';
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
  error='This field is required.';
    err=true;
 }
 else if (!phones.length > 1 || phones.length < 10)
 {
  error='Invalid phone number!';
    err=true;
 }
 else if( ! (/^[0-9]+$/.test(phones)))
    { err=true;
      error='Invalid Phone Number!';
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
  error='Too Short !';
    err=true;
 }
 else if (pw1.indexOf(invalid) > -1)
 {   err=true;
  error='Sorry, spaces are not allowed.';
 }
 else if( ! (/(?=.*\d)(?=.*[a-z])(?=.*[A-Z])/.test(pw1)))
 {    err=true;
    error='Does not match required criteria !';
 }
 if (err)
 {
  form.password1.focus();
  eobj1.innerHTML=error;
  return false
 }
 if (pw1 != pw2)
 { form.password2.focus();
  eobj2.innerHTML=' Passwords not matching !';
  return false;
 }
 return true;
}
 function checkBG(form)          /* for bloodgroup validation */
{
 var eobj=document.getElementById('bgerror');
 eobj.innerHTML='';
 if (/^(A|B|AB|O|a|b|ab|o)[+-]$/.test(form.bloodgroup.value) || form.bloodgroup.value == '')
 {
  return true;
 }
 eobj.innerHTML='Invalid Blood Group!';
 return false;
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
  if( ! checkBG(form) )
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