<?php
session_start();
unset($_SESSION["userid"]);  
$_SESSION['loggedin']=false;;
header("Location: tarang.php");
?>