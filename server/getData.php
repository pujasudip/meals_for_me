<?php

header("Access-Control-Allow-Origin: *");


if(empty($_GET)){
    exit('Invalid Search');
}

require_once('mysqlconnect.php');

if($conn->connect_error){
    die("failed to connect to MYSQL: (" . $conn->connect_errorno .") " . $conn->connect_error);
}

function fetchAssocStatement($stmt){
    if ($stmt->num_rows > 0) {
        $result = array();
        $md = $stmt->result_metadata();
        $params = array();
        while ($field = $md->fetch_field()) {
            $params[] = &$result[$field->name];
        }
        call_user_func_array(array($stmt, 'bind_result'), $params);
        if ($stmt->fetch()) {
            return $result;
        }

        return null;
    }
}

$countPost = count($_GET);
switch ($countPost){
    case 1:
        $ingredientOne = '%'.$_GET['one'].'%';
        $queryForOne = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE `ingredients`.`ingredient_name` LIKE (?)
ORDER BY `recipes`.`Score` DESC';

        if($stmt = $conn->prepare($queryForOne)){
            $stmt->bind_param('s', $ingredientOne);
            $stmt->execute();
            $stmt->store_result();
            while ($row = fetchAssocStatement($stmt)) {
                $results[] = $row;
            }
            $jsonOutput = json_encode($results);
            print_r($jsonOutput);
            $stmt->close();
        }
        break;

    case 2:
        $ingredientOne = '%'.$_GET['one'].'%';
        $ingredientTwo = '%'.$_GET['two'].'%';
        $queryForTwo = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE (?)
OR `ingredients`.`ingredient_name` LIKE (?) )
GROUP BY `recipes`.`ID`
HAVING COUNT(*) > 1
ORDER BY `recipes`.`Score` DESC';

        if($stmt = $conn->prepare($queryForTwo)){
            $stmt->bind_param('ss', $ingredientOne,$ingredientTwo);
            $stmt->execute();
            $stmt->store_result();

            while ($row = fetchAssocStatement($stmt)) {
                $results[] = $row;
            }
            $jsonOutput = json_encode($results);
            print_r($jsonOutput);
            $stmt->close();
        }
        break;

    case 3:
        $ingredientOne = '%'.$_GET['one'].'%';
        $ingredientTwo = '%'.$_GET['two'].'%';
        $ingredientThree = '%'.$_GET['three'].'%';
        $queryForThree = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE (?)
OR `ingredients`.`ingredient_name` LIKE (?)
OR `ingredients`.`ingredient_name` LIKE (?) )
GROUP BY `recipes`.`ID`
HAVING COUNT(*) > 2
ORDER BY `recipes`.`Score` DESC';

        if($stmt = $conn->prepare($queryForThree)){
            $stmt->bind_param('sss', $ingredientOne,$ingredientTwo,$ingredientThree);
            $stmt->execute();
            $stmt->store_result();
            while ($row = fetchAssocStatement($stmt)) {
                $results[] = $row;
            }
            $jsonOutput = json_encode($results);
            print_r($jsonOutput);
            $stmt->close();
        }
        break;

    default:
        die('invalid search');
        break;
}

$conn->close();

?>



