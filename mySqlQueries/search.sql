//FOR 1 query
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE `ingredients`.`ingredient_name` LIKE "%cheese%"
ORDER BY `recipes`.`Score` DESC

//FOR 2 queries
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE "%rice%" AND `ingredients`.`ingredient_name` NOT LIKE "%chicken%")
OR (`ingredients`.`ingredient_name` LIKE "%chicken%" AND `ingredients`.`ingredient_name` NOT LIKE "%rice%")
ORDER BY `recipes`.`Score` DESC

//FOR 3 queries
SELECT `recipes`.*
FROM `recipes`
JOIN `recipe_ingredients` ON `recipes`.`ID` = `recipe_ingredients`.`recipe_ID`
JOIN `ingredients` ON `recipe_ingredients`.`ingredient_ID` = `ingredients`.`ingredient_ID`
WHERE (`ingredients`.`ingredient_name` LIKE "%lettuce%"
AND `ingredients`.`ingredient_name` NOT LIKE "%onion%"
AND `ingredients`.`ingredient_name` NOT LIKE "%tomato%" )
OR (`ingredients`.`ingredient_name` LIKE "%onion%"
AND `ingredients`.`ingredient_name` NOT LIKE "%lettuce%"
AND `ingredients`.`ingredient_name` NOT LIKE "%tomato%")
OR (`ingredients`.`ingredient_name` LIKE "%tomato%"
AND `ingredients`.`ingredient_name` NOT LIKE "%onion%"
AND `ingredients`.`ingredient_name` NOT LIKE "%lettuce%")
ORDER BY `recipes`.`Score` DESC

