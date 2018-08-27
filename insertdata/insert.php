<?php

require_once('mysql_connect.php');

$ch = curl_init();

$randomIngredient = rand(1,1000000);

$url = 'https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/'.$randomIngredient.'/information';

curl_setopt($ch,CURLOPT_URL,$url);

curl_setopt($ch, CURLOPT_HTTPHEADER, array(
    'X-Mashape-Key: d5nUBNnVnGmshBtJT6cj4FVln0Rfp10wqLgjsnMZpzV7REGknF',
    'X-Mashape-Host: spoonacular-recipe-food-nutrition-v1.p.mashape.com'
));

curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

$output = curl_exec($ch);

curl_close($ch);

if ($output === false) {
    echo 'cURL Error';
} else {
    $decoded = json_decode($output, true);
}

$dishScore = $decoded['spoonacularScore'];
$dishID = $decoded['id'];
$dishName = $decoded['title'];
$dishTimeToCook = $decoded['readyInMinutes'];
$dishServings = $decoded['servings'];
$dishImage = $decoded['image'];
$dishInstructions = $decoded['analyzedInstructions'];
//$instructions = $decoded["analyzedInstructions"][0]["steps"];
$extendedIngredients = $decoded["extendedIngredients"];
$dishLikes = $decoded["aggregateLikes"];

$eachIngredientID = $decoded["extendedIngredients"][$i]['id'];
$eachIngredientName = $decoded["extendedIngredients"][$i]['name'];

$vegetarian = $decoded['vegetarian'];
$vegan = $decoded['vegan'];
$glutenFree = $decoded['glutenFree'];
$dairyFree = $decoded['dairyFree'];
$healthScore = $decoded['healthScore'];
$diets = $decoded['diets'];
$winePairing = $decoded['winePairing'];

//these are for table input
$jsonInstructions = json_encode($dishInstructions);
$jsonIngredients = json_encode($extendedIngredients);
$jsonWinePairing = json_encode($winePairing);
$jsonDiets = json_encode($diets);


$dataInput = mysqli_query($conn, $query);
if(!$conn){
    die("Connection Failed: " . mysqli_connect_error());
} else{
    echo "connection made";
}

$recipeIngredientQuery = "
INSERT INTO `recipe_ingredients`(`recipe_ID`, `ingredient_ID`, `Name`, `Image_url`) 
VALUES (
$dishID,$eachIngredientID,$dishName,$dishImage
)";

$recipeQuery = "
REPLACE INTO 
`recipes`(
`ID`, `Score`, `Name`, `Time`, `Servings`, `Image`, 
`Instructions`, `Ingredients`, `vegetarian`, `vegan`, 
`glutenfree`, `dairyfree`, `likes`, `healthscore`, `diets`, `winepairings`) 
VALUES (
$dishName,$dishScore,$dishName,$dishTimeToCook,$dishServings,
$dishImage,$jsonInstructions,$jsonIngredients,$vegetarian,$vegan,
$glutenFree,$dairyFree,$dishLikes,$healthScore,$jsonDiets,$jsonWinePairing
)";

$ingredientsQuery = "
REPLACE INTO `ingredients`(`ingredient_ID`, `ingredient_name`) VALUES ($eachIngredientID,$eachIngredientName)";

if(mysqli_query($conn, $recipeQuery)){
    echo "Data entry was successful";
} else{
    echo "Error Recipes: " . $recipeQuery . '<br>' . mysqli_error($conn);
}

for($i = 0; $i<count($extendedIngredients); $i++){
    if(mysqli_query($conn, $ingredientsQuery)){
        echo "Data entry was successful";
    } else{
        echo "Error Ingredients: " . $ingredientsQuery . '<br>' . mysqli_error($conn);
    }
}

for($i = 0; $i<count($extendedIngredients); $i++){
    if(mysqli_query($conn, $recipeIngredientQuery)){
        echo "Data entry was successful";
    } else{
        echo "Error REC ING: " . $recipeIngredientQuery . '<br>' . mysqli_error($conn);
    }
}


mysqli_close($conn);


?>