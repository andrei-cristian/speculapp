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
$user=mysqli_fetch_assoc($result);
$count=mysqli_num_rows($result);

if($count==1 and $user['role']=='user'){

	$_SESSION['username']=$myusername;
	header("location:../page/Client.php");
}
if($count==1 and $user['role']=='admin'){

	$_SESSION['username']=$myusername;
	header("location:../page/Admin.php");
}

if($count==0){
	echo "<div><h3>Wrong Username or Password.</h3><br>Click here to <a href='../page/login.php'>Login</a></div>";
}

?>