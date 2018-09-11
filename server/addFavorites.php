<?php
if(empty($_POST)){
    echo 'invalid post';
}

require_once('mysql_server_connect.php');

if($conn->connect_errno){
    die('Bad connection');
}



$query = "
INSERT INTO `favorites`(`favorite_id`, `recipe_id`, `user_id`) 
VALUES (null,'$test1','$test2')";


if($result = $conn->query($query)){
    echo 'insert successful';
} else{
    print('duplicate entry');
}
$conn->close();



?>