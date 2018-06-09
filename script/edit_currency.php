<?php

require ('db.php');
require('check_admin.php');
include_once ('include.php');

if (isset($_POST['submit'])){
	$name = $_POST['name'];
	$min_value=$_POST['min_value'];
	$max_value=$_POST['max_value'];
	$update_time=$_POST['update_time'];
	$sql="UPDATE `currency` SET min_value='$min_value',max_value='$max_value',update_time='$update_time',last_update=now() WHERE name='$name'";
	mysqli_query($con,$sql);
	currency_randomvalue_update($name,$update_time);
	header("location:../page/Admin.php?update_currency_success");
}
if (isset($_POST['delete'])){
	$name=$_POST['name'];
	remove_currency($name);
	header("location:../page/Admin.php?delete_currency_success");
}
if (isset($_POST['insert'])){
	$name=$_POST['name'];
	$name = mb_strimwidth($name,0,8);
	create_currency($name);
	currency_randomvalue_create($name,30);
	header("location:../page/Admin.php?$name_created_successfully");
}

$result=get_currency();

if (mysqli_num_rows($result)>0){
	while ($row=mysqli_fetch_assoc($result)){ ?>
		<form method="post" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>">
		<tr>
			<td><?php echo $row['name'];?></td>
			<td><input type="number" step="any" class="changeRate" name="min_value" value="<?php echo $row['min_value'];?>"></td>
			<td><input type="number" step="any" class="changeRate" name="max_value" value="<?php echo $row['max_value'];?>"></td>
			<td><input type="number" class="changeRate" name="update_time" value="<?php echo $row['update_time'];?>"></td>
			<td><input type="submit" name="submit" value="Modify"></button></td>
			<td><input type="submit" name="delete" value="Delete"></button></td>
            <td><input type="hidden" name="name" value="<?php echo $row['name'];?>"></td>
		</tr>
		</form>
	<?php
	} ?>
	<tr>
	<form method="post" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>">
	<td><input type="text" maxlength="8" class="changeRate" name="name" value="CUR"></td>
	<td><input type="submit" name="insert" value="Create Currency"></button></td>
	</form>
	</tr>
<?php 
}
?>

