<?php
require('db.php');
require ('session_check.php');

$sql = "SELECT name FROM `currency`";
$result = mysqli_query($con,$sql);
if (mysqli_num_rows($result)>0){
	while ($row=mysqli_fetch_assoc($result)){ ?>
	<option value="<?php echo $row['name'];?>"><?php echo $row['name'];?></option>

	<?php
	}
}
?>