<?php
require_once('mysql_server_connect.php');

if($conn->connect_errno){
    die('Bad connection');
}

$query = "
SELECT `recipes`.*
FROM `recipes`
JOIN `favorites` ON `recipes`.`ID` = `favorites`.`recipe_ID`
JOIN `users` ON `favorites`.`user_id` = `users`.`ID`
WHERE `favorites.`user_id = `users`.`ID`
";

if($result = $conn->query($query)){
    while ($row = fetchAssocStatement($result)){
        $results[] = $row;
    }
    $jsonOutput = json_encode($results);
    print_r($jsonOutput);
} else{
    print('bad query');
}
$result->close();

$conn->close();

?>