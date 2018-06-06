<?php
session_start();
require ('../script/session_check.php');
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SpeculApp</title>
    <link href="../style/Client.css" type="text/css" rel="stylesheet">
</head>
<body>
<h1 class="container">SpeculApp</h1>
<ul class="container">
    <li><a href="Client.php">Home</a> </li>
    <li><a href="statistics.php">Hall of fame</a></li>
    <li><a href="About.php">About</a></li>
    <li><a href="../script/logout.php">Logout</a></li>
</ul>
<div class="game">
<table class="exchangerate" >
    <caption style="padding-bottom: 0.5em">Exchange Rate</caption>
    <tr>
        <th>Currency</th>
        <th>Value</th>
    </tr>

    <?php require("../script/get_rate.php") ?>
    

</table>

    <table class="budget">
        <caption style="padding-bottom: 0.5em">Available</caption>
        <tr>
            <td>50 EUR</td>
        </tr>
        <tr>
            <td>60 USD</td>
        </tr>
            <tr>
                <td>60 USD</td>
            </tr>
            <tr>
                <td>60 USD</td>
            </tr>
            <tr>
                <td>60 USD</td>
            </tr>

    </table>
<div class="change">
    <form action="Deposit.php"><input  class="deposit" type="submit" value="Deposit"></form>
    <p>Total Value:<?php require('../script/get_amt.php')?> ron </p>
    <table class="tableconvert">
    <form>
        <tr>
            <td>From: </td>
            <td> <select style="height: 1.3em; width: 4em;">
                <?php require('../script/get_cur_names.php');?>
            </select></td>
        </tr>

        <tr>
            <td>To: </td>
            <td>  <select style="height: 1.3em; width: 4em;">
                <?php require('../script/get_cur_names.php');?>
            </select></td>
        </tr></table>
        Amount: <br>
        <input  style=" height: 0.9em; width: 5em;" type="number"><br>
        <input class="deposit" name="exchange" type="submit" value="Change"></form>
</div>

    <table class="portofolio">
        <caption>Portofolio Report</caption>
        <Tr>
            <th>Transaction</th>
            <th>Result(in RON)</th>
        </Tr>
        <tr>
            <td>RON/EUR</td>
            <TD>-1050</TD>
        </tr>
        <TR>
            <TD>EUR/USD</TD>
            <TD>550</TD>
        </TR>
            <TR>
                <TD>EUR/USD</TD>
                <TD>550</TD>
            </TR>
            <TR>
                <TD>EUR/USD</TD>
                <TD>550</TD>
            </TR>
    </table>
</div>

</body>
</html>