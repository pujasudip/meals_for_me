<?php

//require_once('mysqlconnect.php');

function populate(){
    $ch = curl_init();
    $randomIngredient = rand(1,1000000);
    $url = 'https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/informationBulk?ids='.$randomIngredient;
    $result = array();
    for($i = 0;$i<10;$i++){
        curl_setopt($ch,CURLOPT_URL,$url. '%2C'.$randomIngredient);
        curl_setopt($ch, CURLOPT_HTTPHEADER, array('X-Mashape-Key: d5nUBNnVnGmshBtJT6cj4FVln0Rfp10wqLgjsnMZpzV7REGknF'));
        curl_setopt($ch,CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $itemQuery = curl_exec($ch);
        array_push($result,$itemQuery);
    }
    curl_close($ch);
    //print_r($result);
    return $result;
}
function insertToDataBase($result){
    /*   if ($result === false) {
           echo 'cURL Error';
       } else {
           $decoded = json_decode($result, true);
       }*/
    $decoded = json_decode($result,true);
    for ($i = 0; $i < 10; $i++) {
        //objectnames
        $dishScore = $decoded[$i]['spoonacularScore'];
        $dishID = $decoded[$i]['id'];
        $dishName = $decoded[$i]['title'];
        $dishTimeToCook = $decoded[$i]['readyInMinutes'];
        $dishServings = $decoded[$i]['servings'];
        $dishImage = $decoded[$i]['image'];
        $dishInstructions = $decoded[$i]['analyzedInstructions'];
        $instructions = $decoded[$i]["analyzedInstructions"][0]["steps"];
        $extendedIngredients = $decoded[$i]["extendedIngredients"];

        $eachIngredientID = $decoded[$i]["extendedIngredients"][0]['id'];
        $eachIngredientName = $decoded[$i]["extendedIngredients"][0]['name'];

        $jsonInstructions = json_encode($dishInstructions);
        $jsonIngredients = json_encode($extendedIngredients);

        print($dishScore);
        print('<br>');
        print($dishID);
        print('<br>');
        print($eachIngredientID);
        print('<br>');

        /*$result[$i]['title'] = mysqli_real_escape_string($conn, $data[$i]['title']);
        $query = "REPLACE INTO `recipes`(`recipe_id`, `recipe_name`, `recipe_img`)VALUES({$data[$i]['id']},'{$data[$i]['title']}','{$data[$i]['image']}')";
        $storage = mysqli_query($conn, $query);
        if (mysqli_errno($conn)) {
            print(mysqli_error($conn) . ': ');
            print($query);
        }
        $row = mysqli_affected_rows($conn);*/

    }
//data -> result

}

insertToDataBase(populate());


?>