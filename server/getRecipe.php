<?php

header("Access-Control-Allow-Origin: *");

require_once('mysql_server_connect.php');

if($conn->connect_errno){
    die('Bad connection');
}

if(empty($_GET)){
    die('No recipe ID');
}

$id = $_GET['id'];

$query = "SELECT * FROM `recipes` WHERE `recipes`.`ID` = . $id";

if($result = $conn->query($query)){
    print($result);
} else{
    print('invalid recipe ID');
}

$result->close();

$conn->close();

?>