<?php

//curl --get --include 'https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/informationBulk?ids=50000%2C50001%2C50002' \
//-H 'X-Mashape-Key: XM8RqJ1vhEmshaAedqDjAHJ764j0p1kFOGGjsnyGFNgssre0Qy' \
//-H 'X-Mashape-Host: spoonacular-recipe-food-nutrition-v1.p.mashape.com'


//$url = 'https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/informationBulk?ids=1';


$ch = curl_init();

curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);

curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-Mashape-Key: XM8RqJ1vhEmshaAedqDjAHJ764j0p1kFOGGjsnyGFNgssre0Qy'));

curl_setopt($ch, CURLOPT_URL, $url);


//$output =  curl_exec($ch);

curl_close($ch);


if($output === false){
    echo 'cURL Error: ' . curl_error($curl);
} else{
    $decoded = json_decode($output,true);
    //print_r($decoded);
    //print('<br>');
}


//objectnames
$dishScore = $decoded[0]['spoonacularScore'];
$dishID = $decoded[0]['id'];
$dishName = $decoded[0]['title'];
$dishTimeToCook = $decoded[0]['readyInMinutes'];
$dishServings = $decoded[0]['servings'];
$dishImage = $decoded[0]['image'];
$dishInstructions = $decoded[0]['analyzedInstructions'];
$instructions = $decoded[0]["analyzedInstructions"][0]["steps"];

/*print($dishScore);
print('<br>');
print($dishID);
print('<br>');

print($dishName);
print('<br>');

print($dishTimeToCook);
print('<br>');

print($dishServings);
print('<br>');

print($dishImage);

print('<br>');*/

print_r($instructions);
print('<br>');
print_r($dishInstructions);


?>

