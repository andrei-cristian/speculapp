<?php
session_start();
require ('../script/session_check.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="../style/Statistics.css" rel="stylesheet" type="text/css">
    <link href="../style/Client.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>Statistics</title>
</head>
<body>
    <h1 class="container">SpeculApp</h1>
    <ul class="container">
    <li><a href="Client.php">Home</a> </li>
    <li><a href="Statistics.php">Hall of fame</a></li>
    <li><a href="About.php">About</a></li>
    <li><a href="../script/logout.php">Logout</a></li>
    </ul>
    <div style="width: fit-content;margin-left:auto;margin-right: auto;padding:10px">
    <p>Top 10 Richest Players</p>
    <table>
        <tr>
            <th>Rank</th>
            <th>Name</th>
            <th>Earnings</th>
        </tr>
        <?php require('../script/get_hof.php');?>
    </table>
    </div>

</body>
</html>