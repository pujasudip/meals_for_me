<?php
if(empty($_GET)){
    exit('Invalid Search');
}

require_once('mysql_server_connect.php');

if($conn->connect_error){
    die("failed to connect to MYSQL: (" . $conn->connect_errorno .") " . $conn->connect_error);
}
// FUNCTION TO REPLACE GET_RESULTS()
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
//SWITCH STATEMENT TO DIRECT WHICH QUERY TO USE AND GET SEARCH RESULTS
$countPost = count($_GET);
switch ($countPost){
    case 1:
        $ingredientOne = '%'.addslashes($_GET['one']).'%';
        $numOfResults = 10*intval($_GET['number']);
        $queryForOne = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE `ingredients`.`ingredient_name` LIKE (?)
ORDER BY `recipes`.`likes` DESC LIMIT 10 OFFSET (?)';

        if($stmt = $conn->prepare($queryForOne)){
            $stmt->bind_param('si', $ingredientOne,$numOfResults);
            $stmt->execute();
            $stmt->store_result();
            while ($row = fetchAssocStatement($stmt)){
                $results[] = $row;
            }
            $jsonOutput = json_encode($results);
            print_r($jsonOutput);
            $stmt->close();
        }
        break;

    case 2:
        $ingredientOne = '%'.addslashes($_GET['one']).'%';
        $ingredientTwo = '%'.addslashes($_GET['two']).'%';
        $numOfResults = 10*intval($_GET['number']);

        $queryForTwo = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE (?)
OR `ingredients`.`ingredient_name` LIKE (?) )
GROUP BY `recipes`.`ID`
HAVING COUNT(*) > 1
ORDER BY `recipes`.`likes` DESC LIMIT 10 OFFSET (?)';

        if($stmt = $conn->prepare($queryForTwo)){
            $stmt->bind_param('ssi', $ingredientOne,$ingredientTwo,$numOfResults);
            $stmt->execute();
            $stmt->store_result();

            while ($row = fetchAssocStatement($stmt)){
                $results[] = $row;
            }
            $jsonOutput = json_encode($results);
            print_r($jsonOutput);
            $stmt->close();
        }
        break;

    case 3:
        $ingredientOne = '%'.addslashes($_GET['one']).'%';
        $ingredientTwo = '%'.addslashes($_GET['two']).'%';
        $ingredientThree = '%'.addslashes($_GET['three']).'%';
        $numOfResults = 10*intval($_GET['number']);

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
ORDER BY `recipes`.`likes` DESC LIMIT 10 OFFSET (?)';

        if($stmt = $conn->prepare($queryForThree)){
            $stmt->bind_param('sssi', $ingredientOne,$ingredientTwo,$ingredientThree,$numOfResults);
            $stmt->execute();
            $stmt->store_result();
            while ($row = fetchAssocStatement($stmt)){
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



