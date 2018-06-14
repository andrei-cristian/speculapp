<?php
session_start();
require ('../script/session_check.php');
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <link href="../style/Client.css" rel="stylesheet" type="text/css">
    <link href="../style/About.css" rel="stylesheet" type="text/css">
    <meta charset="UTF-8">
    <title>About</title>
</head>
<body>
<h1 class="container">SpeculApp</h1>
<ul class="container">
    <li><a href="Client.php">Home</a> </li>
    <li><a href="Statistics.php">Hall of fame</a></li>
    <li><a href="About.php">About</a></li>
    <li><a href="../script/logout.php">Logout</a></li>
</ul>
<div class="reg">
<h2 style="text-align: center">Regulations</h2>
    <p>1.To start, you must deposit at least 3000RON.</p>
    <p>2.The first change you make won't affect the total value. That will be the base for your next moves.</p>
    <p>3.Using the exchange rate table, make decisions. Keep in mind that the rates can change anytime.</p>
    <p>4.Once your total value is over 6000RON, you win.</p>
    <p>5.If yout total value is under 100RON, you lose.</p>
    <p>6.To play another game, you should deposit what is left to 1000RON.</p>
</div>
</body>
</html>