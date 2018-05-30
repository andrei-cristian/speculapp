<?php
require('db.php');
require ('session_check.php');

$sql="SELECT username,credit FROM `hof` ORDER BY credit DESC;";
$result = mysqli_query($con,$sql);

if (mysqli_num_rows($result)>0){
	$i=1;
	while ($row=mysqli_fetch_assoc($result)AND $i<=10){ ?>
		<tr>
			<td><?php echo $i;?></td>
			<td><?php echo $row['username'];?></td>
			<td><?php echo $row['credit'];?></td>
		</tr>
	<?php
	$i=$i+1;
	}
}
?>