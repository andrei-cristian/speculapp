<?php

require('db.php');
require('session_check.php');

$uname=$_SESSION['username'];

$sql="SELECT * FROM `available` WHERE username='$uname';";
$result=mysqli_query($con,$sql);
if (mysqli_num_rows($result)>0){
	while($row=mysqli_fetch_assoc($result)){
		?>
		<tr><td><?php echo $row['amount'];?> <?php echo $row['currency_name'];?></td></tr>
	<?php
	}
}
?>