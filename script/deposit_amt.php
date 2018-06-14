<?php
require ('db.php');
require ('session_check.php');
include_once ('include.php');
session_start();
$user_name=$_SESSION['username'];
$result1=get_user_data($user_name);
$result2=get_game_data();
$result1=mysqli_fetch_assoc($result1)['credit'];
$result2=mysqli_fetch_assoc($result2)['win_limit'];
$deposit_amt=mysqli_real_escape_string($con, $_POST['amount']);
if ($deposit_amt<=0){
    header("location:../page/Deposit.php?fail_amount_lesser_than_zero");
}
$result3=$result1+$deposit_amt;
if ($result3>$result2){
    sleep(1);
    header("location:../page/Client.php?fail_amount_exceeded_max_allowed");
}
else{
    $query="UPDATE `hof` SET credit='$result3',updated_at=now()  WHERE username='$user_name';";
    mysqli_query($con,$query);
    header("location:../page/Client.php?deposit_success");
}
?>