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
        <th>Bid</th>
        <th>Ask</th>
    </tr>
        <tr>
        <td>EUR</td>
        <td>4.567</td>
        <td>4.543</td>
    </tr>
    <tr>
        <td>USD</td>
        <td>3.456</td>
        <td>3.432</td>
    </tr>
    <tr>
        <td>GBP</td>
        <td>5.567</td>
        <td>5.432</td>
    </tr>

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
    <p>Total Value:2000 ron </p>
    <table class="tableconvert">
        <tr>
            <td>From: </td>
            <td> <select style="height: 1.3em; width: 4em;">
                <option value="euro">EUR</option>
                <option value="dolar">USD</option>
                <option value="lira">GBP</option>
            </select></td>
        </tr>

        <tr>
            <td>To: </td>
            <td>  <select style="height: 1.3em; width: 4em;">
                <option value="euro">EUR</option>
                <option value="dolar">USD</option>
                <option value="lira">GBP</option>
            </select></td>
        </tr></table>
    <form>
        Amount: <br>
        <input  style=" height: 0.9em; width: 5em;" type="number"><br>
    </form>
    <form><input class="deposit" type="submit" value="Change"></form>
</div>

    <table class="portofolio">
        <caption>Portofolio Report</caption>
        <Tr>
            <th>Tranzaction</th>
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
