<?php
require('db.php');
session_start();

$myusername=mysqli_real_escape_string($con, $_POST['myusername']);
$mypassword=mysqli_real_escape_string($con, $_POST['mypassword']);

//anti sql-injection

$myusername=stripslashes($myusername);
$mypassword=stripslashes($mypassword);

//password encryption
$encrypt_password=md5($mypassword);


$sql="SELECT * FROM `users` WHERE username='$myusername' and password='$encrypt_password';";
$result=mysqli_query($con, $sql) or die(mysql_error());

$count=mysqli_num_rows($result);

if($count==1){

	$_SESSION['username']=$myusername;
	header("location:../page/Client.html");
}
else{
	echo "<div><h3>Wrong Username or Password.</h3><br>Click here to <a href='../page/login.html'>Login</a></div>";
}

?>