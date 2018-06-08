<?php

require('db.php');
require ('session_check.php');
include_once('include.php');

$result = get_currency();

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