<?php

require('db.php');
require('session_check.php');

$uname=$_SESSION['username'];
$sql="SELECT credit FROM `hof` WHERE username='$uname';";
$result=mysqli_query($con,$sql);
$result=mysqli_fetch_assoc($result);
echo $result['credit'];

?>