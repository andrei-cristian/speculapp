<?php

require('db.php');
require('session_check.php');

function get_user_data($username){
	$sql="SELECT * FROM `hof` where username='$username';";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
	return $result;
}


function get_game_data(){
	$sql="SELECT * FROM `game`;";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
	return $result;
}

function set_credit($username,$credit){
	$sql="UPDATE `hof` SET credit='$credit',updated_at=now()  WHERE username='$username';";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

function get_currency(){
	$sql="SELECT * FROM `currency`;";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
	return $result;
}

function create_currency($CURname){
	$sql="INSERT INTO `currency`(name,min_value,max_value,update_time,last_update) VALUES('$name','0','0','0',now());";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

?>