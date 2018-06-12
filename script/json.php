<?php
function get_data(){
    require('db.php');

    $sql="SELECT username,credit FROM `hof`  ORDER BY credit DESC limit 10;";
    $result = mysqli_query($con,$sql);
    $hof_array = array();
    while ($row=mysqli_fetch_assoc($result))
    {
        $hof_array[] = array(
            'username' => $row["username"],
            'credit'    => $row["credit"]
        );
    }
    return json_encode($hof_array);
}
$file_name = 'hof'.'.json';
if(file_put_contents($file_name, get_data()))
{
    echo $file_name.' file created';
}
else{
    echo 'There is some error';
}
?>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Refresh" content="5;url=http://localhost/speculapp/script/hof.json">
</head>

<body>
<p>You will be redirected to the json file in 5 seconds.</p>

</body>

</html>
