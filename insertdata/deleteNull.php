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

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$result = mysqli_query($conn, $recipeDelete);

if (mysqli_query($conn, $result)) {
    echo "Recipe deleted successfully";
} else {
    echo "Error deleting record: " . mysqli_error($conn);
}

$result2 = mysqli_query($conn, $recIngDelete);

if (mysqli_query($conn, $result2)) {
    echo "REC ING deleted successfully";
} else {
    echo "Error deleting record: " . mysqli_error($conn);
}

mysqli_close($conn);

?>