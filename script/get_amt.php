<?php

require('db.php');
require('session_check.php');
include_once('include.php');

$username=$_SESSION['username'];
$result=get_user_data($username);
$result=mysqli_fetch_assoc($result);
echo $result['credit'];

?>