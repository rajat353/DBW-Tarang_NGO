<?php
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 // Create connection 
 $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

if(!empty($_POST["pref_id"]))
{
 if($_POST["pref_id"]=='camp') 
 {
 $query = $conn->query("select distinct city from campdetails order by city"); 
 }
 elseif ($_POST["pref_id"]=='home')
 {
   $query = $conn->query("select distinct city from oldagehomes order by city");
 }
 ?>
 <option value="">Select City</option>
<?php
	foreach($query as $row) {
?>
	<option value="<?php echo $row['city']; ?>"><?php echo $row['city']; ?></option>
<?php
	}
}
?>