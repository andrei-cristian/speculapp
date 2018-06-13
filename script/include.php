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

function get_user_funds($username,$currencyname){
	require('db.php');
	if ($currencyname=='RON'){
		$ret=mysqli_fetch_assoc(get_user_data($username))['credit'];
		return $ret;
	}

	$sql="SELECT * FROM `available` where username='$username' and currency_name='$currencyname';";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
	if($result){
		$ret = mysqli_fetch_assoc($result)['amount'];
		return $ret;
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

function get_game_time(){
	$time=get_game_data();
	if ($time) {
		$time=mysqli_fetch_assoc($time);
		$time=$time['valid_time'];
		return $time;
	}
	else{
		return 0;
	}
}

function get_user_transactions($username){
	require('db.php');
	$sql="SELECT * FROM `transactions` WHERE username='$username' ORDER BY created_at DESC";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
		return $result;
}

function set_credit($username,$credit){
	require('db.php');
	$sql="UPDATE `hof` SET credit='$credit',updated_at=now()  WHERE username='$username';";
	mysqli_query($con,$sql) or die (mysqli_error($con));
}

function get_currency(){
	require('db.php');
	$sql="SELECT * FROM `currency` ORDER BY cur_value DESC;";
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

function get_exchange_value($amount,$currency1,$currency2){
	$value_from=get_currency_value($currency1);
	$value_to=get_currency_value($currency2);
	$exchangeval=(($amount*$value_from)/$value_to);

	return $exchangeval;

}

function create_currency($CURname){
	require('db.php');
	$sql="SELECT * FROM `currency` WHERE name='$CURname';";
	$result=mysqli_query($con,$sql) or die(mysqli_error($con));
	if ($result){
		if(mysqli_num_rows($result)==0){
			$sql="INSERT INTO `currency` VALUES ('$CURname','0','0','0','0','30',now());";
			mysqli_query($con,$sql) or die (mysqli_error($con));
		}
	}
}

function remove_currency($currencyname){
	require('db.php');
	$result=value_in_table('available','currency_name',$currencyname);
	if ($result){
		while($row=mysqli_fetch_assoc($result)){
			$id=$row['id'];
			$username=$row['username'];
			$amount=$row['amount'];
			$amount=get_exchange_value($amount,$currencyname,'RON');
			insert_money($username,'RON',$amount);
			delete_from_table('available','id',$id);
			transaction($username,$currencyname,'RON',$amount);
		}
	}
	delete_from_table('currency','name',$currencyname);
	currency_drop_event($currencyname);

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

function update_user_transaction($username,$value,$date){
	require('db.php');
	$result=value_in_table('transactions','result',$value);
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

function insert_currency_available($username,$currencyname){
	require('db.php');
	$sql="INSERT INTO `available`(username,currency_name,amount,updated_at) VALUES ('$username','$currencyname','0',now());";
	mysqli_query($con,$sql) or die(mysqli_error($con));

}

function update_usercurrency_amount($username,$currencyname,$value){
	require('db.php');

	$current=get_user_funds($username,$currencyname);
	if ($currencyname=='RON'){
		set_credit($username,$value);
		return;
	}

	if ($value==0){
		$sql="DELETE FROM `available` WHERE currency_name='$currencyname' and username='$username';";
	}
	else{
		if ($value<0){
			header("location:../page/Client.php?no_infinite_money_for_you");
			return;
		}
		else{
			$sql="UPDATE `available` SET amount='$value',updated_at=now() WHERE username='$username' and currency_name='$currencyname';";
		}
	}
	mysqli_query($con,$sql) or die(mysqli_error($con));
	return;
}

function take_money($username,$currencyname,$amount){
	$available=get_user_funds($username,$currencyname);
	$ok=1;
	if($available<=0){
		$ok=0;
		return 0;
	}

	$available=$available-$amount;

	if ($available<0){
		$ok=0;
		return 0;
	}
	if ($ok==1){
		update_usercurrency_amount($username,$currencyname,$available);
		return 1;
	}
	else{
		return 0;
		header("location:../page/Client.php?insuficient_funds");
	}
}

function insert_money($username,$currencyname,$value){
	$current=get_user_funds($username,$currencyname);
	if ($current==0 and $currencyname!='RON'){
		insert_currency_available($username,$currencyname);
	}
	$new_value=$current+$value;
	update_usercurrency_amount($username,$currencyname,$new_value);
}

function create_transaction($username,$currency1,$currency2,$result){
	require('db.php');
	$sql="INSERT INTO `transactions` (username,FCUR,TCUR,result,created_at) VALUES ('$username','$currency1','$currency2','$result',now());";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

function currency_randomvalue_create($currencyname,$seconds){
	require('db.php');
	$name=$currencyname.'_generator';
	$date="SELECT now() FROM DUAL;";
	$date=mysqli_query($con,$date) or die(mysqli_error($con));
	$date=mysqli_fetch_assoc($date)['now()'];
	$sql="CREATE EVENT $name
	ON SCHEDULE EVERY $seconds SECOND STARTS '$date'
	DO
		BEGIN
			DECLARE v_min, v_max, v_current, v_new_value double(10,3);
			SELECT min_value,max_value,cur_value INTO v_min,v_max,v_current FROM `currency` WHERE name='$currencyname';
			SELECT RAND()*(v_max-v_min)+v_min INTO v_new_value FROM DUAL;
			UPDATE `currency` SET cur_value=v_new_value, last_value=v_current, last_update=now() WHERE name='$currencyname';
		END;";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

function currency_randomvalue_update($currencyname,$seconds){
	require('db.php');
	$name=$currencyname.'_generator';
	$date="SELECT now() FROM DUAL;";
	$date=mysqli_query($con,$date) or die(mysqli_error($con));
	$date=mysqli_fetch_assoc($date)['now()'];
	$sql="ALTER EVENT $name
	ON SCHEDULE EVERY $seconds SECOND STARTS '$date';";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

function currency_drop_event($currencyname){
	require('db.php');
	$name=$currencyname.'_generator';
	$sql="DROP EVENT $name ;";
	mysqli_query($con,$sql) or die(mysqli_error($con));
}

function user_game_check($username){
	$usercredit=get_user_funds($username,'RON');
	if($lose_limit=get_game_data)
		$lose_limit=mysqli_fetch_assoc($lose_limit)['lose_limit'];
	if ($usercredit>$lose_limit){
		return 1;
	}
	else{
		return 0;
	}
}

function transaction($username,$currency1,$currency2,$amount){
	if ($currency1=='RON'){
		$amount=0-$amount;
		create_transaction($username,$currency1,$currency2,$amount);
	}
	else
		if ($currency2=='RON'){
			$amount=get_exchange_value($amount,$currency1,$currency2);
			create_transaction($username,$currency1,$currency2,$amount);
		}
		else{
			create_transaction($username,$currency1,$currency2,0);
		}
}

?>

