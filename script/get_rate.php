<?php

require('db.php');

$sql = "SELECT name, cur_value FROM `currency`";
$result = mysqli_query($con,$sql);

if (mysqli_num_rows($result)>0){
	while ($row=mysqli_fetch_assoc($result)){ ?>
		<tr>
			<td><?php echo $row['name'];?></td>
			<td><?php echo $row['cur_value'];?>
			</td>
		</tr>
	<?php
	}
}

?>