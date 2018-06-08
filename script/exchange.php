<?php

require('db.php');
//require('session_check.php');
include_once('include.php');

session_start();
$user_name=$_SESSION['username'];

$option1=mysqli_real_escape_string($con,$_POST['option1']);
$option2=mysqli_real_escape_string($con,$_POST['option2']);
$amount=mysqli_real_escape_string($con,$_POST['exchange_amount']);

$option1=stripslashes($option1);
$option2=stripslashes($option2);


if (!check_amount($amount)){
	return 0;
}


$value_from=get_currency_value($option1);

$value_to=get_currency_value($option2);

$exchangeval=(($amount*$value_from)/$value_to);

if(take_money($user_name,$option1,$amount)){
	insert_money($user_name,$option2,$exchangeval);
}
else{
	header("location:../page/Client.php?exchange_denied");
}

?>