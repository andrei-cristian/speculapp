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
    <script src="../script/jquery-1.10.2.js"></script>
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
    
    <div id="refresh">
    
    </div>

    <script type="text/javascript">
        $(document).ready(function(){
            $('#refresh').load('../script/get_rate.php');
            refresh();
        });
        function refresh(){
            setTimeout(function(){
                $('#refresh').load('../script/get_rate.php');
                refresh();
            },200);
        }
    </script>    

    <table class="budget">
        <caption style="padding-bottom: 0.5em">Available</caption>
        <?php require('../script/get_available_cur.php');?>

    </table>
<div class="change">
    <form action="Deposit.php"><input  class="deposit" type="submit" value="Deposit"></form>
    <p>Total Value:<?php require('../script/get_amt.php');?> ron </p>
    <form action="../script/exchange.php" method="post">
    <table class="tableconvert">
        <tr>
            <td>From: </td>
            <td> <select name="option1" style="height: 1.3em; width: 4em;">
                <option value="RON">RON</option>
                <?php require('../script/get_cur_names.php');?>
            </select></td>
        </tr>

        <tr>
            <td>To: </td>
            <td>  <select name ="option2" style="height: 1.3em; width: 4em;">
                <?php require('../script/get_cur_names.php');?>
                <option value="RON">RON</option>
            </select></td>
        </tr></table>
        <br> Amount: <br>
        <input name="exchange_amount" required min="0" step="any" style=" height: 0.9em; width: 5em;" type="number"><br>
        <input class="deposit" name="exchange" type="submit" value="Change">
        </form>
</div>

    <table class="portofolio">
        <caption>Portofolio Report</caption>
        <Tr>
            <th>Transaction</th>
            <th>Result(in RON)</th>
            <th>Date of transaction</th>
        </Tr>
        <?php require('../script/get_transactions.php'); ?>
    </table>
</div>

</body>
</html>
