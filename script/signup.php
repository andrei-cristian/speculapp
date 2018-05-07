<?php
session_start();

$username = "";
$password = "";
$errors = array();

$db=mysqli_connect('speculapp.000webhostapp.com','id5658853_speculapp_user','12345678','id5658853_speculapp');

if (isset($_POST['reg_user'])) {
	$username = mysqli_real_escape_string($db, $_POST['username']);
	$email = mysqli_real_escape_string($db, $_POST['email']);
	$password = mysqli_real_escape_string($db, $_POST['password']);
	$encrypt_password = md5($password);

	if (preg_match('!@#$%^&*()[]{};\',<.>/? -', $username)) {
		array_push($errors,"Username can only containt alphanumeric characters and underscore.");
	}

	$username=stripslashes($username);
	$email=stripslashes($email);

	$user_check_query = "SELECT * FROM users WHERE username='$username' OR email='$email' LIMIT 1";
	$result = mysqli_query($db,$user_check_query);
	$user = mysqli_fetch_assoc($result);

	if ($user){
		if ($user['username'] === $username){
			array_push($errors, "Username already exists.");
		}

		if ($user['email'] === $email){
			array_push($errors,"email already exists.");
		}
	}

	if (count($errors)==0){
		$encrypt_password = md5($password);
		$date = date('Y-m-d H:i:s');
		$query = "INSERT INTO user (username, password, email, role, created_at, updated_at) VALUES ('$username','$encrypt_password', '$email', 'user', '$date', '$date')";
		mysqli_query($db,$query);
		$_SESSION['username'] = $username;
		$_SESSION['success'] "You are now logged in.";
		header("location:login_success.php");
	}
}
?>