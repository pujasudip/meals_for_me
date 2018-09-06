<?php
require_once('mysql_connect.php');

$recipeDelete = "
DELETE FROM `recipes` 
WHERE (`Instructions` = '[]' OR `Image` = '' OR `Ingredients` = '[]')";

$recIngDelete = "
DELETE `recipe_ingredients` 
FROM `recipe_ingredients` 
LEFT JOIN `recipes` 
ON `recipes`.ID = `recipe_ingredients`.`recipe_ID` 
WHERE `recipes`.ID IS null";

$result = mysqli_query($conn, $recipeDelete);

if (empty($result)) {
    $output['errors'][] = 'database error';
} else {
    if (mysqli_affected_rows($conn) > 0 ) {
        $output['success'] = true;
    } else {
        $output['errors'][] = 'delete error';
    };
}

$result2 = mysqli_query($conn, $recIngDelete);
if (empty($result2)) {
    $output['errors'][] = 'database error';
} else {
    if (mysqli_affected_rows($conn) > 0 ) {
        $output['success'] = true;
    } else {
        $output['errors'][] = 'delete error';
    };
};

?>