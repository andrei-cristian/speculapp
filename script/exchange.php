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
	return;
}

function take_money(){
	$available=get_currency_amount($user_name,$option1);
	if(!$available){
		header("location:../page/Client.php?insuficient_funds");
		return;
	}
	

}

else{
	$available=$available-$amount;
	if ($available<0){
		header("location:../page/Client.php?insuficient_funds");
		return;
	}
	else update_currency_amount($user_name,$option1,$available);
}

$value_from=get_currency_value($option1);

$value_to=get_currency_value($option2);

$exchangeval=(($amount*$value_from)/$value_to);


if ($option2=='RON'){
	$new_credit=mysqli_fetch_assoc(get_user_data($user_name))['credit'];
	$new_credit=$new_credit+$exchangeval;
	//$sql="UPDATE `hof` SET credit=credit+'$exchangeval' WHERE username=$user_name;";
	//mysqli_query($con,$sql);
	set_credit($user_name,$new_credit);
	header("location:../page/Client.php?exchange_success");
}
else{
	$sql="UPDATE `available` SET amount=amount+$exchangeval WHERE username=$user_name AND currency_name='$option2';";
	mysqli_query($con,$sql);
	header("location:../page/Client.php?exchange_success");
}

	echo $option1,' ',$value_from,'<p>',$option2,' ',$value_to,'<p>',$exchangeval;
?>