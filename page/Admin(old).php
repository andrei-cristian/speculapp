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
    <li><a href="#">EXPORT JSON</a> </li>
    <li><a href="#">EXPORT XML</a></li>
    <li><a href="#">EDIT RSS</a></li>
    <li><a href="../script/logout.php">Logout</a></li>
</ul>
<div class="cnt" style="
    float:  left;
    margin-left:  auto;
    margin-right: auto;
    margin-top: 5%;
    border: 1em double orangered;
    padding: 10px;
">
<table >
    <caption>Range Between</caption>
    <tr>
        <th>Currency</th>
        <th>From</th>
        <th class="To">To</th>
    </tr>
    <tr>
        <td>EUR</td>
        <td><input type="number" class="changeRate"></td>
        <td><input type="number" class="changeRate"><button>Ok</button></td>
    </tr>
    <tr>
        <td>USD</td>
        <td><input type="number" class="changeRate"></td>
        <td><input type="number" class="changeRate"><button>Ok</button></td>
    </tr>
    <tr>
        <td>GBP</td>
        <td><input type="number" class="changeRate"></td>
        <td><input type="number" class="changeRate"><button>Ok</button></td>
    </tr>
</table>
    <table style="
    margin-left:  auto;
    margin-right:  auto;
    margin-top: 5%;
">
    <tr>
        <td>Signing amount</td>
        <td><form><input type="number"><br></form></td>
    </tr>
    <tr>
        <td>Winning threshold</td>
        <td><input type="number" name="wintresh"><br></td>
    </tr>
    <tr>
        <td>Losing threshold</td>
        <td><input type="number" name="lostresh"><br></td>
    </tr>
    <tr>
        <td>Period of validity</td>
        <td> <input type="number"><br></td>
    </tr>
    <tr>
        <td><input type="submit" value="Submit"></td>
        <td></td>
    </tr>
</table>
</div>
</body>
</html>

