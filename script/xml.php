<?php
require('db.php');
$sql="SELECT username,credit FROM `hof` ORDER BY credit DESC;";
$result = mysqli_query($con,$sql);
$xml=new DOMDocument("1.0");
$xml->formatOutput=true;
$top=$xml->createElement("Hall_of_Fame");
$xml->appendChild($top);

while($row=mysqli_fetch_assoc($result)) {
    $rank = $xml->createElement("rank");
    $top->appendChild($rank);
    $name = $xml->createElement("username", $row['username']);
    $rank->appendChild($name);
    $credit = $xml->createElement("credit", $row['credit']);
    $rank->appendChild($credit);
}


    echo "<xmp>".$xml->saveXML()."</xmp>";
    ?>