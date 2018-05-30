<?php

require ('db.php');
session_start();
$user_name=$_SESSION['username'];

$sql1="SELECT credit FROM `hof` where username='$user_name';";
$sql2="SELECT win_limit FROM `game`;";
$result1=mysqli_query($con,$sql1) or die(mysqli_error($con));
$result2=mysqli_query($con,$sql2) or die(mysqli_error($con));
$result1=mysqli_fetch_assoc($result1)['credit'];
$result2=mysqli_fetch_assoc($result2)['win_limit'];
$deposit_amt=mysqli_real_escape_string($con, $_POST['amount']);
$result3=$result1+$deposit_amt;
if ($result3>$result2){
	sleep(1);
	header("location:../page/Client.php?fail_amount_exceeded_max_allowed");
}

else{
	$query="UPDATE `hof` SET credit='$result3',updated_at=now()  WHERE username='$user_name';";
	mysqli_query($con,$query);
	header("location:../page/Client.php?deposit_succ");
}


?>