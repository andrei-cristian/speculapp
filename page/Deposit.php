<?php
session_start();
require ('../script/session_check.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="../style/Client.css" type="text/css" rel="stylesheet">
    <link href="../style/Deposit.css"  type="text/css" rel="stylesheet">
    <link rel="stylesheet" media="(max-width:900px)" href="../style/Client_max900.css">
    <link rel="stylesheet" media="(min-width:450) and (max-width:900px)" href="../style/Client_min450-max900.css">
    <link rel="stylesheet" media="(max-width: 450px)" href="../style/Client_max450.css">
    <title>Deposit</title>
</head>
<body>
<h1 class="container">SpeculApp</h1>
<ul class="container">
    <li><a href="Client.php">Home</a> </li>
    <li><a href="statistics.php">Hall of fame</a></li>
    <li><a href="About.php">About</a></li>
    <li><a href="../script/logout.php">Logout</a></li>
</ul>
<div class="dep">
    <form action="../script/deposit_amt.php" method="post">
        <h2>Deposit</h2>
            Amount: <br>
            <input type="number" name="amount"><br>
        <input id="addbut" type="submit" value="Add">
</div>
</body>

</html>