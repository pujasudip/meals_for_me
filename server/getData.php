<?php
if(empty($_GET)){
    exit('Invalid Search');
}
///sanitize data here

require_once('mysql_server_connect.php');

$output = [
    'success'=> false,
    'errors'=>[]
];

$countPost = count($_GET);
switch ($countPost){
    case 1:
        $ingredientOne = $_GET['one'];

        $queryForOne = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE `ingredients`.`ingredient_name` LIKE '.'"%'.$ingredientOne.'%" 
ORDER BY `recipes`.`Score` DESC';

        $query = $queryForOne;
        break;
    case 2:
        $ingredientOne = $_GET['one'];
        $ingredientTwo = $_GET['two'];

        $queryForTwo = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE '.'"%'.$ingredientOne.'%" 
OR `ingredients`.`ingredient_name` LIKE '.'"%'.$ingredientTwo.'%")
GROUP BY `recipes`.`ID` 
HAVING COUNT(*) > 1
ORDER BY `recipes`.`Score` DESC';

        $query = $queryForTwo;
        break;
    case 3:
        $ingredientOne = $_GET['one'];
        $ingredientTwo = $_GET['two'];
        $ingredientThree = $_GET['three'];

        $queryForThree = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE '.'"%'.$ingredientOne.'%"
OR `ingredients`.`ingredient_name` LIKE '.'"%'.$ingredientTwo.'%"
OR `ingredients`.`ingredient_name` LIKE '.'"%'.$ingredientThree.'%")
GROUP BY `recipes`.`ID` 
HAVING COUNT(*) > 2
ORDER BY `recipes`.`Score` DESC
';
        $query = $queryForThree;
        break;
}

/*$query = '
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE `ingredients`.`ingredient_name` LIKE "%chicken%"
ORDER BY `recipes`.`Score` DESC';*/

$result = mysqli_query($conn, $query);
if (empty($result)) {
    $output['errors'][] = 'database error';
} else {
    if (mysqli_num_rows($result) > 0 ) {
        $output['success'] = true;
        $output['data']=[];
        while( $row = mysqli_fetch_assoc($result) ){
            $output['data'][] = $row;
        };
    } else {
        $output['errors'][] = 'no data';
    };
};

$jsonOutput = json_encode($output);

echo $jsonOutput;

?>



