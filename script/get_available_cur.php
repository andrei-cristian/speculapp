<?php

require('db.php');
require('session_check.php');
include_once('include.php');

$uname=$_SESSION['username'];

$result=value_in_table('available','username',$uname);
if (mysqli_num_rows($result)>0){
	while($row=mysqli_fetch_assoc($result)){
		?>
		<tr><td><?php echo $row['amount'];?> <?php echo $row['currency_name'];?></td></tr>
	<?php
	}
}
?>