<?php

require ('db.php');
//require('session_check.php');

$sql="SELECT name, min_value, max_value, update_time FROM `currency`";
$result=mysqli_query($con,$sql);

if (mysqli_num_rows($result)>0){
	while ($row=mysqli_fetch_assoc($result)){ ?>
		<tr>
			<td><?php echo $row['name'];?></td>
			<td><input type="number" class="changeRate" value="<?php echo $row['min_value'];?>"></td>
			<td><input type="number" class="changeRate" value="<?php echo $row['max_value'];?>"></td>
			<td><input type="number" class="changeRate" value="<?php echo $row['update_time'];?>"></td>
		</tr>
	<?php
	}
}
?>