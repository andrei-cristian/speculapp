<?php

$host="localhost";
$username="";
$password="";
$db_name="test";
$tbl_name="members";

//Connect to server

mysql_connect("$host","$username","$password") or die ("cannot conect");
my_sql_select_db("$db_name") or die ("cannot select database");

//get username&password from form

$myusername=$_POST['myusername'];
$mypassword=$_POST['mypassword'];

//anti sql-injection

$myusername=stripslashes($myusername);
$mypassword=stripslashes($mypassword);
$myusername=mysql_real_escape_string($myusername);
$mypassword=mysql_real_escape_string($mypassword);

//password encryption
$encrypt_password=md5($mypassword);


$sql="SELECT * FROM $tbl_name WHERE username=$myusername and password=$encrypt_password";
$result=mysql_query($sql);

$count=mysql_num_rows($result);

if($count==1){

	session_register("myusername");
	session_register("encrypt_password");
	header("location:login_success.php");
}
else{
	echo "Wrong Username or Password";
}

?>