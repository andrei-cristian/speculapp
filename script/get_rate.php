<table class="exchangerate" >
    <caption style="padding-bottom: 0.5em">Exchange Rate</caption>
<tr>
        <th>Currency</th>
        <th>Value</th>
</tr>
<?php

require('db.php');
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
</table>