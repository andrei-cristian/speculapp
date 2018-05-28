<?php
if(!isset($_SESSION['username'])){
   header("Location:../page/Login.php");
}
if($_SESSION['username']!='admin'){
	header("Location:../page/Client.php");
}
?>