<?php
 $name=$_POST['name'];
 $email=$_POST['email'];
 $review=$_POST['comment'];
 $date=date("Y/m/d"); 
 if(empty($name))
	 echo" <html><script>alert('No Name'); window.location.href='reviewadd.php';</script></html> ";
 else if(empty($email))
	 echo" <html><script>alert('No email'); window.location.href='reviewadd.php';</script></html> ";
 else if(empty($review))
	 echo" <html><script>alert('No Message'); window.location.href='reviewadd.php';</script></html> ";
 $flag_update=0;
 $dbhost = "localhost";
 $dbuser = "root";
 $dbpass = "";
 $dbname = "project";
 // Create connection 
 $conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);
 $sql="select * from review";
 $result= $conn->query($sql);
 if($result->num_rows > 0)
 {
	 while($row=$result->fetch_assoc())
	 {
		 if($row['email']==$email)
		 {  
			$flag_update=1;
		 }
	 }
 }
 if($flag_update==1)
 {
	 echo "<html><script>alert('You have already added one review !!'); window.location.href='reviewadd.php';</script></html> ";
	 
 }

 
 if($flag_update==0)
 {
	 $sql="insert into review values('$email','$name','$review','$date')";
	 if($conn->query($sql))
	 {
		 header('location:reviews.php');
	 }
	 else
	 {
		echo" <html><script>alert('Error With Server ! ')</script></html> ".$conn->error;
	 }
 }
 
 $conn->close();
 ?>

 