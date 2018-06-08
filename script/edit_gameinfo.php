<?php
require('db.php');
require('check_admin.php');
include_once('include.php');

if (isset($_POST['submit'])){
	$init_money=$_POST['signamt'];
	$win_limit=$_POST['wintresh'];
	$lose_limit=$_POST['lostresh'];
	$valid_time=$_POST['validtime'];
	$find=$_POST['validtimefind'];

	$sql="UPDATE `game` SET init_money=$init_money,win_limit=$win_limit,lose_limit=$lose_limit,valid_time=$valid_time WHERE valid_time=$find";
	mysqli_query($con,$sql);
	header("location:../page/Admin.php");
}

$result = get_game_data();
$result = mysqli_fetch_assoc($result);

?>

<form method="post" action="<?php echo htmlentities($_SERVER['PHP_SELF']); ?>">
<input type="hidden" name=validtimefind value='<?php echo $result['valid_time']?>'>
    <tr>
        <td>Signing amount</td>
        <td><input type="number" name='signamt' value='<?php echo $result['init_money']?>'><br></td>
    </tr>
    <tr>
        <td>Winning threshold</td>
        <td><input type="number" name="wintresh" value='<?php echo $result['win_limit']?>'><br></td>
    </tr>
    <tr>
        <td>Losing threshold</td>
        <td><input type="number" name="lostresh" value='<?php echo $result['lose_limit']?>'><br></td>
    </tr>
    <tr>
        <td>Period of validity</td>
        <td> <input type="number" name='validtime' value='<?php echo $result['valid_time']?>'><br></td>
    </tr>
    <tr>
        <td><input type="submit" name="submit" value="Submit"></td>
    </tr>
 
   </form>
