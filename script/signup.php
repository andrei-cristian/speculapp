<?php
require('db.php');
session_start();

$myusername = "";
$mypassword = "";
$email = "";
$errors = array();

$myusername = mysqli_real_escape_string($con, $_POST['username']);
$email = mysqli_real_escape_string($con, $_POST['email']);
$mypassword = mysqli_real_escape_string($con, $_POST['password']);


$myusername=preg_replace("/[^a-zA-Z0-9]/", "",$myusername);
$myusername=stripslashes($myusername);
$email=stripslashes($email);

$user_check_query = "SELECT * FROM `users` WHERE username='$myusername' OR email='$email' LIMIT 1;";
$result = mysqli_query($con,$user_check_query) or die(mysqli_error($con));
if ($result){
	$user = mysqli_fetch_assoc($result);

	if ($user){
		if ($user['username'] == $myusername){
			array_push($errors, "Username already exists.");
		}

		if ($user['email'] == $email){
			array_push($errors,"Email already exists.");
		}
	}
}

if (count($errors)==0){
	$encrypt_password = md5($mypassword);
	$query = "INSERT INTO `users` (username, password, email, role, created_at, updated_at) VALUES ('$myusername','$encrypt_password','$email','user',now(),now());";
	mysqli_query($con,$query) or die(mysqli_error($con));
	$_SESSION['username'] = $myusername;
	header("location:../page/Client.php");
}

?>