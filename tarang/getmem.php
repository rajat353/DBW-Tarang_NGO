<?php
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 // Create connection 
 $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

if(!empty($_POST["city_id"]))
{ 
  $city= ($_POST["city_id"]);
    $query = $conn->query("select * from campmembers,campdetails where campmembers.campid=campdetails.id and campdetails.city='$city'"); 
?>

<i><h4>The Members You Searched For</i></h4><br>
<table>
<tr>
<th>Member ID&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Name&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Email ID&nbsp;&nbsp;&nbsp;&nbsp;</th>
<th>Contact&nbsp;&nbsp;&nbsp;&nbsp;</th>
<?php
	foreach($query as $row) {
		?>
		<tr>
		<?php
	      echo "<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['memid']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['name']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['emailid']."<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;".$row['contact']; 
		  ?>
		  </tr>
		  <?php
	}
?>
</table>
<?php
}
?>
