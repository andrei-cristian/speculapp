<?php

require('db.php');
require('session_check.php');

$option1=mysqli_real_escape_string($_POST['option1']);
$option2=mysqli_real_escape_string($_POST['option2']);
$amount=mysqli_real_escape_string($_POST['exchange_amount']);

$option1=stripslashes($option1);
$option2=stripslashes($option2);

if(!is_numeric($amount)){
	header("location:../page/Client.php?not_numeric_value");
}
if($amount<=0){
	header("location:../page/Client.php?no_infinite_money_for_you");
}

if($option1!='RON'){
	$sql="SELECT cur_value from `currency` WHERE name='$option1';";
	$result=mysqli_query($con,$sql);
	$result=mysqli_fetch_assoc($result);
	if (!$result){
		header("location:../page/Client.php?currency_not_available");
	}
	$value_from=$result['cur_value'];
	$sql="SELECT amount from `available` WHERE currency_name=$option1 and username=$_SESSION['username'];";
	$result=mysqli_query($con,$sql);
	$result=mysqli_fetch_assoc($result);
	if (!$result){
		header("location:../page/Client.php?funds_not_available");
	}
	if ($result['amount']<$amount){
		header("location:../page/Client.php?insufficient_funds");
	}
}
else{
	$value_from=1;
}

if($option2!='RON'){
	$sql="SELECT cur_value from `currency` WHERE name='$option2';";
	$result=mysqli_query($con,$sql);
	$result=mysqli_fetch_assoc($result);
	if (!$result){
		header("location:../page/Client.php?currency_not_available");
	}
	$value_to=$result['cur_value'];

	$sql="SELECT * from `available` WHERE currency_name='$option2' and username='$_SESSION['username'];";
	$result=mysqli_query($con,$sql);
	$result=mysqli_fetch_assoc($result);
	if (!$result){
		$sql="INSERT INTO `available` ('$_SESSION['username']','$option2','0',now()";
		mysqli_query($con,$sql);
	}
}
else{
	$value_to=1;
}

$exchangeval=($amount*(1/$value_from)*$value_to;

if ($option1='RON'){
	$sql="SELECT credit FROM `hof` WHERE username='$_SESSION['username']';";
	$result=mysqli_fetch_assoc(mysqli_query($con,$sql))['credit'];
	if ($result<$amount){
		header("location:../page/Deposit.php?you_need_RON");
	}
	else{
		$new_credit=$result-$amount;
		$sql="UPDATE `hof` SET credit='$new_credit' WHERE username='$_SESSION['username']';";
		mysqli_query($con,$sql);
	}
}
	if ($option2='RON'){
		$sql="UPDATE `hof` SET credit=credit+'$exchangeval' WHERE username='$_SESSION['username']';";
		mysqli_query($con,$sql);
		header("location:../page/Client.php?deposit_success");
	}
	else{
		$sql="UPDATE `available` SET amount=amount+'$exchangeval' WHERE username='$_SESSION['username']' AND currency_name='$option2';";
		mysqli_query($con,$sql);
		header("location:../page/Client.php?deposit_success");
	}
?>