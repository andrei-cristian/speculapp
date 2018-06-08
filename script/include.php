<?php

function get_user_data($username){
	require('db.php');
	$sql="SELECT * FROM `hof` where username='$username';";
	$result=mysqli_query($con,$sql) or die (mysqli_error($con));
	if ($result){
		return $result;
	}
	else return 0;
}

function get_user_available_currency($username,$currencyname){
	require('db.php');
	$sql="SELECT * FROM `available` where username='$username' and currency_name='$currencyname';";
	$result=mysqli_query($con,$sql);
	if($result){
		return $result;
	}
	else return 0;
}


function get_game_data(){
	require('db.php');
	$sql="SELECT * FROM `game`;";
	$result=mysqli_query($con,$sql) or die (mysqli_error($con));
	if ($result){
		return $result;
	}
	else return 0;
}

function set_credit($username,$credit){
	require('db.php');
	$sql="UPDATE `hof` SET credit='$credit',updated_at=now()  WHERE username='$username';";
	mysqli_query($con,$sql) or die (mysqli_error($con));
}

function get_currency(){
	require('db.php');
	$sql="SELECT * FROM `currency`;";
	$result=mysqli_query($con,$sql) or die (mysqli_error($con));
	if ($result){
		return $result;
	}
	else return 0;
}

function get_currency_value($currency_name){
	if ($currency_name!='RON'){
		$result=value_in_table('currency','name',$currency_name);
		if (!$result){
			header("location:../page/Client.php?currency_not_available");
			return 0;
		}
		else{
			return mysqli_fetch_assoc($result)['cur_value'];
		}
	}
	else{
		return 1;
	}
}

function create_currency($CURname){
	require('db.php');
	$sql="SELECT * FROM `currency` WHERE name='$CURname';";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
	if ($result){
		if(mysqli_num_rows($result)==0){
			$sql="INSERT INTO `currency` VALUES ('$CURname','0','0','0','0',now());";
			mysqli_query($con,$sql) or die (mysqli_error($con));
		}
	}
}

function value_in_table($tablename,$colname,$value){
	require('db.php');
	$sql="SELECT * FROM `$tablename` WHERE $colname='$value';";
	$result=mysqli_query($con,$sql) or die (mysqli_error($con));
	if ($result){
		return $result;
	}
	else return(0);
}

function delete_from_table($tablename,$colname,$value){
	require('db.php');
	$sql="SELECT * FROM `$tablename` WHERE $colname='$value';";
	$result=mysqli_query($con,$sql);
	if ($result){
		if (mysqli_num_rows($result)!=0){
			$sql="DELETE FROM `$tablename` WHERE $colname='$value';";
			mysqli_query($con,$sql) or die (mysqli_error($con));
		}
	}
}

function update_table_value($tablename,$col_replace,$value_new,$col_find,$value_search){
	require('db.php');
	$sql="UPDATE `$tablename` SET $col_replace='$value_new' WHERE $col_find='$value_search';";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

function check_amount($amount){
	if(is_null($amount)){
		header("location:../page/Client.php?not_numeric_value");
		return 0;
	}

	if(!is_numeric($amount)){
		header("location:../page/Client.php?not_numeric_value");
		return 0;
	}

	if($amount<0){
		header("location:../page/Client.php?no_infinite_money_for_you");
		return 0;
	}
	return 1;
}

function get_currency_amount($username,$currencyname,$option=0){
	require_once('db.php');
	if ($currencyname=='RON'){
		$amount=mysqli_fetch_assoc(get_user_data($username))['amount'];
		return $amount;
	}
	else{
		$result=get_user_available_currency($username,$currencyname);
		if ($result){
			return(mysqli_fetch_assoc($result)['amount']);
	}
		else{
			if ($option==1){
				$sql="INSERT INTO `available` ('$user_name','$option2','0',now());";
				mysqli_query($con,$sql);
			}
			else{
				return 0;
			}
		}
	}
}

function update_currency_amount($username,$currencyname,$value){
	$current=get_currency_amount($username,$currencyname,1);
	if ($currencyname=='RON'){
		set_credit($username,$value);
	}
	else{
		$sql="UPDATE `available` SET amount='$value', updated_at=now() WHERE username='$username' and currency_name='$currencyname';";
		mysqli_query($con,$sql);
	}
}


?>