<?php

require('db.php');
//require('session_check.php');

session_start();
$user_name=$_SESSION['username'];

$option1=mysqli_real_escape_string($con,$_POST['option1']);
$option2=mysqli_real_escape_string($con,$_POST['option2']);
$amount=mysqli_real_escape_string($con,$_POST['exchange_amount']);

$option1=stripslashes($option1);
$option2=stripslashes($option2);

echo $amount;


if(is_null($amount)){
	header("location:../page/Client.php?not_numeric_value");
	return;
}

if(!is_numeric($amount)){
	header("location:../page/Client.php?not_numeric_value");
	return;
}
if($amount<0){
	header("location:../page/Client.php?no_infinite_money_for_you");
	return;
}

if($option1!='RON'){
	$sql="SELECT cur_value from `currency` WHERE name='$option1';";
	$result=mysqli_query($con,$sql);
	if (!$result){
		header("location:../page/Client.php?currency_not_available");
		return;
	}
	else
	{
		$value_from=mysqli_fetch_assoc($result)['cur_value'];
	}

	$sql="SELECT * from `available` WHERE currency_name=$option1 and username=$user_name;";
	$result=mysqli_query($con,$sql);
	if ($result || mysqli_num_rows($result)>0)
		$result=mysqli_fetch_assoc($result);
	else{
		if (!$result){
			header("location:../page/Client.php?funds_not_available");
			return;
		}
		if ($result['amount']<$amount){
			header("location:../page/Client.php?insufficient_funds");
			return;
		}
	}

}
else{
	$value_from=1;
}


if($option2!='RON'){
	$sql="SELECT cur_value from `currency` WHERE name='$option2';";
	$result=mysqli_query($con,$sql);
	if ($result)
		$result=mysqli_fetch_assoc($result);
	else{
		header("location:../page/Client.php?currency_not_available");
		return;
	}
	$value_to=$result['cur_value'];

	$sql="SELECT * from `available` WHERE currency_name=$option2 and username=$user_name;";
	$result=mysqli_query($con,$sql);
	if ($result){
		$result=mysqli_fetch_assoc($result);
	}
	else{
		$sql="INSERT INTO `available` ('$user_name','$option2','0',now()";
		mysqli_query($con,$sql);
	}
}

else{
	$value_to=1;
}

$exchangeval=(($amount*$value_from)/$value_to);

if ($option1=='RON'){
	$sql="SELECT credit FROM `hof` WHERE username=$user_name;";
	$result=mysqli_query($con,$sql);
	if($result){
		$result=mysqli_fetch_assoc($con,$result)['credit'];
		if ($result<$amount){
			header("location:../page/Deposit.php?you_need_RON");
			return;
		}
		else{
			$new_credit=$result-$amount;
			$sql="UPDATE `hof` SET credit=$new_credit WHERE username=$user_name;";
			mysqli_query($con,$sql);
		}
	}
}
if ($option2=='RON'){
	$sql="UPDATE `hof` SET credit=credit+'$exchangeval' WHERE username=$user_name;";
	mysqli_query($con,$sql);
	header("location:../page/Client.php?exchange_success");
}
else{
	$sql="UPDATE `available` SET amount=amount+$exchangeval WHERE username=$user_name AND currency_name='$option2';";
	mysqli_query($con,$sql);
	header("location:../page/Client.php?exchange_success");
}

	echo $option1,' ',$value_from,'<p>',$option2,' ',$value_to,'<p>',$exchangeval;
?>