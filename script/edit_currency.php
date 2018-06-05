<?php

require ('db.php');
require('check_admin.php');

if (isset($_POST['submit'])){
	$name = $_POST['name'];
	$min_value=$_POST['min_value'];
	$max_value=$_POST['max_value'];
	$update_time=$_POST['update_time'];
	$sql="UPDATE `currency` SET min_value='$min_value',max_value='$max_value',update_time='$update_time',last_update=now() WHERE name='$name'";
	mysqli_query($con,$sql);
	header("location:../page/Admin.php?update_currency_success");
}
if (isset($_POST['delete'])){
	$name=$_POST['name'];
	$sql="DELETE FROM `currency` WHERE name='$name'";
	mysqli_query($con,$sql);
	header("location:../page/Admin.php?delete_currency_success");
}
if (isset($_POST['insert'])){
	$name=$_POST['name'];
	$currency_check_query = "SELECT * FROM `currency` WHERE name='$name' LIMIT 1";
	$result = mysqli_query($con,$currency_check_query);
	$result = mysqli_fetch_assoc($result);
	if ($result) {
		header("location:../page/Admin.php?create_currency_fail");
	}
	else {

	$sql="INSERT INTO `currency`(name,min_value,max_value,update_time,last_update) VALUES('$name','0','0','0',now());";
	mysqli_query($con,$sql);
	header("location:../page/Admin.php?create_currency_success"); }
}

$sql="SELECT name, min_value, max_value, update_time FROM `currency`";
$result=mysqli_query($con,$sql);

if (mysqli_num_rows($result)>0){
	while ($row=mysqli_fetch_assoc($result)){ ?>
		<form method="post" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>">
		<tr>
			<td><?php echo $row['name'];?></td>
			<td><input type="hidden" name="name" value="<?php echo $row['name'];?>"></td>
			<td><input type="number" class="changeRate" name="min_value" value="<?php echo $row['min_value'];?>"></td>
			<td><input type="number" class="changeRate" name="max_value" value="<?php echo $row['max_value'];?>"></td>
			<td><input type="number" class="changeRate" name="update_time" value="<?php echo $row['update_time'];?>"></td>
			<td><input type="submit" name="submit" value="Modify"></button></td>
			<td><input type="submit" name="delete" value="Delete"></button></td>
		</tr>
		</form>
	<?php
	} ?>
	<tr>
	<form method="post" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>">
	<td><input type="text" class="changeRate" name="name" value="CUR"></td>
	<td><input type="submit" name="insert" value="Create Currency"></button></td>
	</form>
	</tr>
<?php 
}
?>

