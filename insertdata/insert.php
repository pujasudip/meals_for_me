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
$dishName = addslashes($decoded['title']);
$dishTimeToCook = $decoded['readyInMinutes'];
$dishServings = $decoded['servings'];
$dishImage = $decoded['image'];
$dishInstructions = $decoded['analyzedInstructions'];
//$instructions = $decoded["analyzedInstructions"][0]["steps"];
$extendedIngredients = $decoded["extendedIngredients"];
$dishLikes = $decoded["aggregateLikes"];

//print_r( $instructions);

$vegetarian = $decoded['vegetarian'];
if($vegetarian){
    $vegetarian = 1;
} else{
    $vegetarian = 0;
}
$vegan = $decoded['vegan'];
if($vegan){
    $vegan = 1;
} else{
    $vegan = 0;
}
$glutenFree = $decoded['glutenFree'];
if($glutenFree){
    $glutenFree = 1;
} else{
    $glutenFree = 0;
}
$dairyFree = $decoded['dairyFree'];
if($dairyFree){
    $dairyFree = 1;
} else{
    $dairyFree = 0;
}
$healthScore = $decoded['healthScore'];
$diets = $decoded['diets'];
$winePairing = $decoded['winePairing'];

//these are for table input
$jsonInstructions = addslashes(json_encode($dishInstructions));
$jsonIngredients = addslashes(json_encode($extendedIngredients));
$jsonWinePairing = addslashes(json_encode($winePairing));
$jsonDiets = json_encode($diets);


if(!$conn){
    die("Connection Failed: " . mysqli_connect_error());
}
/*print($dishID);
print($dishScore);
print($dishName);
print($dishTimeToCook);
print($dishServings);
print($dishImage);
print($jsonInstructions);
print($jsonIngredients);
print($vegetarian);
print($vegan);*/

$recipeQuery = "
REPLACE INTO 
`recipes`(
`ID`, `Score`, `Name`, `Time`, `Servings`, `Image`, 
`Instructions`, `Ingredients`, `vegetarian`, `vegan`, 
`glutenfree`, `dairyfree`, `likes`, `healthscore`, `diets`, `winepairings`) VALUES (
$dishID,$dishScore,'$dishName',$dishTimeToCook,$dishServings,
'$dishImage','$jsonInstructions','$jsonIngredients',$vegetarian,$vegan,
$glutenFree,$dairyFree,$dishLikes,$healthScore,'$jsonDiets','$jsonWinePairing'
)";

$dummy = "
REPLACE INTO 
`recipes`(
`ID`, `Score`, `Name`, `Time`, `Servings`, `Image`, 
`Instructions`, `Ingredients`, `vegetarian`, `vegan`, 
`glutenfree`, `dairyfree`, `likes`, `healthscore`, `diets`, `winepairings`) 
VALUES (
    1123,79,'test',13,4,
    'testURLimage','{asdasddaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasadasdad}','{jsoaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaanjsonjson}',true,false,
    false,true,3,55,'{asdadadsaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaad}','{winepaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaairingstest}'
)";


if(mysqli_query($conn, $recipeQuery)){
    echo "Data entry was successful";
} else{
    echo "Error Recipes: " . $recipeQuery . '<br>' . mysqli_error($conn);
    //echo 'error';
}

for($i = 0; $i<count($extendedIngredients); $i++){
    $eachIngredientID = $decoded["extendedIngredients"][$i]['id'];
    $eachIngredientName = addslashes($decoded["extendedIngredients"][$i]['name']);
    $ingredientsQuery = "
REPLACE INTO `ingredients`(`ingredient_ID`, `ingredient_name`) VALUES ($eachIngredientID,'$eachIngredientName')";

    if(mysqli_query($conn, $ingredientsQuery)){
        echo "Data entry was successful";
    } else{
        echo "Error Ingredients: " . $ingredientsQuery . '<br>' . mysqli_error($conn);
    }
}

for($i = 0; $i<count($extendedIngredients); $i++){
    $eachIngredientID = $decoded["extendedIngredients"][$i]['id'];
    $eachIngredientName = addslashes($decoded["extendedIngredients"][$i]['name']);

    $recipeIngredientQuery = "
REPLACE INTO `recipe_ingredients`(`recipe_ID`, `ingredient_ID`, `Name`, `Image_url`) 
VALUES (
$dishID,$eachIngredientID,'$dishName','$dishImage'
)";

    if(mysqli_query($conn, $recipeIngredientQuery)){
        echo "Data entry was successful";
    } else{
        echo "Error REC ING: " . $recipeIngredientQuery . '<br>' . mysqli_error($conn);
    }
}

mysqli_close($conn);


?>