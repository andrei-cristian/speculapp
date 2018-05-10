<?php

require('db.php');

$sql = "SELECT name, cur_value FROM `currency`";
$result = $con->mysqli_query($sql);

if (mysqli_num_rows($result)>0){
	while ($row=mysqli_fetch_assoc($result)){
		echo "<tr><td>$row['name']</td><td>$row['cur_value']</td></tr>"
	}
}

?>