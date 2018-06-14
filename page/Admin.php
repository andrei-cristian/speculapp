<?php
session_start();
require ('../script/check_admin.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Admin Panel</title>
    <link href="../style/Client.css" type="text/css" rel="stylesheet">
    <style>
        .changeRate{
            width:50%;
            margin-right: auto;
            box-shadow: 1px 1px #000000;
        }
        button {
            outline: none;
            background-color: #ffffff;
            box-shadow: 1px 1px #000000;
        }
        button:hover{
            background-color: #000000;
            color: #ffffff;
        }
        th.To{
            width:40%;
        }
    </style>
</head>
<body>
<h1 class="container">Admin Panel</h1>
<ul class="container">
    <li><form action="../script/json.php" method="post"> <input type="submit" value="EXPORT JSON" style="background-color: #293249; color: white; border: 0px;font-family: 'Arial Black'; font-size: 2vw"></form> </li>
    <li><form action="../script/xml.php" method="post"> <input type="submit" value="EXPORT XML" style="background-color: #293249; color: white; border: 0px;font-family: 'Arial Black'; font-size: 2vw"></form> </li>
    <li><a href="#">EDIT RSS</a></li>
    <li><a href="../script/logout.php">Logout</a></li>
</ul>
<div class="cnt" style="
    margin-left:  auto;
    margin-right: auto;
    margin-top: 5%;
    border: 1em double orangered;
    padding: 10px;
    width: fit-content;
">
<table style="margin-left:auto; margin-right: auto">
    <caption>Range Between</caption>
    <tr>
        <th>Currency</th>
        <th>From</th>
        <th>To</th>
        <th>Time(seconds)</th>
    </tr>
    <?php require('../script/edit_currency.php'); ?>
    <tr>
    <form method="post" action="../script/edit_currency.php">
    <td><input type="text" maxlength="8" class="changeRate" name="name" value="CUR"></td>
    <td><input type="submit" name="insert" value="Create Currency"></button></td>
    </form>
    </tr>
</table>
    <table style="
    margin-left:  auto;
    margin-right:  auto;
    margin-top: 5%;
">
  
    <?php require('../script/edit_gameinfo.php'); ?>


</table>
</div>
</body>
</html>


