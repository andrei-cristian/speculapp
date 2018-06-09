<?php

include_once('include.php');

$username=$_SESSION['username'];

$result=get_user_transactions($username);
if ($result){
	if (mysqli_num_rows($result)>0){
		$number=0;
		while($row=mysqli_fetch_assoc($result) and $number<5){ ?>
		<tr>
			<td><?php echo $row['FCUR'];?>/<?php echo $row['TCUR'];?></td>
			<td><?php echo $row['result'];?></td>
			<td><?php echo $row['created_at'];?></td>
		</tr>
		<?php
		$number=$number+1;

		}
	}
}

?>