-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 21, 2018 at 09:22 PM
-- Server version: 5.6.34-log
-- PHP Version: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `c6.18db`
--
CREATE DATABASE IF NOT EXISTS `c6.18db` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `c6.18db`;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `given_name` varchar(30) NOT NULL,
  `family_name` varchar(30) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(64) NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`ID`, `given_name`, `family_name`, `email`, `password`, `status`) VALUES
(1, 'Chuck', 'Tomai', 'somedude@someserver.com', '06cf73d585b182a85d0270a5ebb9f3768ebfbe18', 1),
(2, 'Jane', 'Doe', 'somewhere@overtherainbow.com', '48a3218fa3bacb1d5d1cdb56ae2d7f7808d4a036', 1),
(3, 'Stan', 'TheMan', 'superawesome@cantstopwontstop.com', 'd8e9031e962f8a22a7443c1748960090e85ad6c3', 1),
(4, 'Tabula', 'Rasa', 'failedmmo@sadpanda.com', 'f2b8e82e40773a667ebcabc658a0b6d3b8b9974b', 1);

-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `price` float NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL,
  `type` enum('shoes','shirt','pants') NOT NULL,
  `added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`ID`, `name`, `price`, `status`, `type`, `added`) VALUES
(1, 'hiking boots', 19.99, 1, 'shoes', '2016-03-15 12:14:23'),
(2, 'dress shoes', 35.99, 1, 'shoes', '2016-03-15 12:14:23'),
(3, 'dinner shoes', 129.99, 1, 'shoes', '2016-03-15 14:27:53'),
(4, 'dinner pants', 40, 1, 'pants', '2016-03-15 14:27:53'),
(5, 'dress pants', 48, 1, 'pants', '2016-03-15 14:27:53'),
(6, 'flower pants', 22.3, 1, 'pants', '2016-03-15 14:27:53'),
(7, 'short pants', 15.99, 1, 'pants', '2016-03-15 14:27:53'),
(8, 'hawaiiain shirt', 9.99, 1, 'shirt', '2016-03-15 14:29:22'),
(9, 'dress shirt', 22.32, 1, 'shirt', '2016-03-15 14:29:22'),
(10, 'chiffon shirt', 12.5, 1, 'shirt', '2016-03-15 14:29:22'),
(11, 't-shirt', 11.59, 1, 'shirt', '2016-03-15 14:29:22'),
(12, 'polo shirt', 15.66, 1, 'shirt', '2016-03-15 14:29:22');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `ID` bigint(20) UNSIGNED NOT NULL,
  `item_id` mediumint(8) UNSIGNED NOT NULL,
  `customers_id` mediumint(8) UNSIGNED NOT NULL,
  `price` double NOT NULL,
  `item_count` int(10) UNSIGNED NOT NULL,
  `added` datetime NOT NULL,
  `status` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`ID`, `item_id`, `customers_id`, `price`, `item_count`, `added`, `status`) VALUES
(1, 10, 1, 37.5, 3, '2016-03-22 09:00:00', 1),
(2, 9, 1, 156.24, 7, '2016-03-14 05:00:00', 1),
(3, 6, 1, 44.6, 2, '2016-02-15 19:00:00', 1),
(4, 11, 2, 69.54, 6, '2016-04-08 22:00:00', 1),
(5, 2, 2, 143.96, 4, '2016-03-24 03:00:00', 1),
(6, 9, 2, 223.2, 10, '2016-03-16 02:00:00', 1),
(7, 8, 2, 69.93, 7, '2016-04-20 12:00:00', 1),
(8, 6, 2, 89.2, 4, '2016-02-06 19:00:00', 1),
(9, 11, 3, 69.54, 6, '2016-03-30 07:00:00', 1),
(10, 5, 3, 384, 8, '2016-03-13 21:00:00', 1),
(11, 8, 3, 49.95, 5, '2016-02-15 02:00:00', 1),
(12, 3, 3, 1299.9, 10, '2016-04-21 09:00:00', 1),
(13, 6, 3, 89.2, 4, '2016-02-13 03:00:00', 1),
(14, 7, 3, 159.9, 10, '2016-01-18 01:00:00', 1),
(15, 9, 3, 66.96, 3, '2016-04-10 05:00:00', 1),
(16, 2, 3, 71.98, 2, '2016-02-20 06:00:00', 1),
(17, 9, 4, 66.96, 3, '2016-02-23 14:00:00', 1),
(18, 3, 4, 779.94, 6, '2016-01-14 08:00:00', 1),
(19, 4, 4, 40, 1, '2016-04-12 16:00:00', 1),
(20, 8, 4, 89.91, 9, '2016-02-20 12:00:00', 1),
(21, 5, 4, 144, 3, '2016-04-05 14:00:00', 1),
(22, 7, 4, 47.97, 3, '2016-03-22 22:00:00', 1),
(23, 12, 4, 93.96, 6, '2016-01-01 01:00:00', 1),
(24, 2, 4, 215.94, 6, '2016-01-18 03:00:00', 1),
(25, 9, 4, 200.88, 9, '2016-04-27 08:00:00', 1),
(26, 11, 4, 115.9, 10, '2016-02-12 13:00:00', 1),
(27, 6, 4, 178.4, 8, '2016-03-19 07:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` mediumint(8) UNSIGNED NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(40) NOT NULL,
  `joined` datetime NOT NULL,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `level` tinyint(4) NOT NULL,
  `status` enum('created','active','banned','deleted') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `name`, `email`, `password`, `joined`, `updated`, `level`, `status`) VALUES
(2, 'rebecca', 'myteethwontstopchattering@gmail.com', '2beb0192eb1ca5a8756bc89a09b93036e1854049', '2018-08-02 17:44:14', '2018-08-16 18:33:04', 2, 'created'),
(3, 'john boy', '40ksucks@gmail.com', '7bd4e8b82c0b681e9aa6d9f387f80545bd2a42af', '2018-08-02 17:44:14', '2018-08-03 00:44:14', 1, 'banned'),
(4, 'taytay', 'kojackismyboy@gmail.com', '923b9ca9ed5f6677fe4582fbba1ad06f206a56b4', '2018-08-02 17:45:35', '2018-08-03 00:45:35', 4, 'deleted'),
(5, 'joh', 'isleepwithmyeyesopen@gmail.com', '0444b8a8ba20fa8929bf54243192891869199e0c', '2018-08-02 17:45:35', '2018-08-03 00:45:35', 3, 'active'),
(6, 'Soora', 'sudipisunlucky@gmail.com', '712c6d37a2b53ffc5e5594491db3d4c4b91e4ef7', '2018-08-02 17:46:30', '2018-08-03 00:46:30', 3, 'banned'),
(7, 'federico', 'thequickening@gmail.com', 'e342fbcda19deca968af9768e6c60f6d75448f0c', '2018-08-02 18:11:01', '2018-08-03 01:11:01', 2, 'active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `ID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;--
-- Database: `sgt`
--
CREATE DATABASE IF NOT EXISTS `sgt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sgt`;

-- --------------------------------------------------------

--
-- Table structure for table `student_data`
--

CREATE TABLE `student_data` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(30) NOT NULL,
  `grade` tinyint(3) UNSIGNED NOT NULL,
  `course_name` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `student_data`
--

INSERT INTO `student_data` (`id`, `name`, `grade`, `course_name`) VALUES
(5, 'Andres', 89, 'How to get 89'),
(6, 'Miranda', 92, 'Cats'),
(7, 'Ryan', 100, 'Asking Questions'),
(18, 'test', 0, 'test'),
(19, 'test', 0, 'test');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `student_data`
--
ALTER TABLE `student_data`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `student_data`
--
ALTER TABLE `student_data`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;--
-- Database: `what_to_food`
--
CREATE DATABASE IF NOT EXISTS `what_to_food` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `what_to_food`;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `favorite_id` mediumint(9) NOT NULL,
  `recipe_id` mediumint(9) NOT NULL,
  `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients`
--

CREATE TABLE `ingredients` (
  `ingredient_ID` mediumint(9) NOT NULL,
  `ingredient_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipe_ingredients`
--

CREATE TABLE `recipe_ingredients` (
  `recipe_ingredient_id` mediumint(9) NOT NULL,
  `recipe_id` mediumint(9) NOT NULL,
  `ingredient_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `recipes`
--

CREATE TABLE `recipes` (
  `id` bigint(250) NOT NULL,
  `title` varchar(500) NOT NULL,
  `image` varchar(500) NOT NULL,
  `imageType` varchar(10) NOT NULL,
  `usedIngredientCount` int(11) NOT NULL,
  `missedIngredientCount` int(11) NOT NULL,
  `likes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `recipes`
--

INSERT INTO `recipes` (`id`, `title`, `image`, `imageType`, `usedIngredientCount`, `missedIngredientCount`, `likes`) VALUES
(1543, 'King Salmon With Braised Fennel And Artichokes', 'https://spoonacular.com/recipeImages/1543-312x231.jpg', 'jpg', 1, 2, 3),
(1709, 'Salmon Fillets With Horseradish-potato Crust', 'https://spoonacular.com/recipeImages/1709-312x231.jpg', 'jpg', 1, 2, 0),
(1864, 'Chili-Rubbed Salmon', 'https://spoonacular.com/recipeImages/1864-312x231.jpg', 'jpg', 1, 2, 0),
(1945, 'Parmesan Sole', 'https://spoonacular.com/recipeImages/1945-312x231.jpg', 'jpg', 1, 2, 0),
(2972, 'Roasted Grouper with Seafood Risotto and Champagne-Citrus Beurre Blanc', 'https://spoonacular.com/recipeImages/2972-312x231.jpg', 'jpg', 1, 2, 0),
(3151, 'Crunchy Fish Sticks', 'https://spoonacular.com/recipeImages/3151-312x231.jpg', 'jpg', 1, 2, 0),
(3317, 'Spanish-Style Halibut', 'https://spoonacular.com/recipeImages/3317-312x231.jpg', 'jpg', 2, 3, 0),
(3343, 'Potato-wrapped Halibut With Sautéed Spinach', 'https://spoonacular.com/recipeImages/3343-312x231.jpg', 'jpg', 2, 2, 0),
(3397, 'Potato-Wrapped Halibut with Sautéed Spinach', 'https://spoonacular.com/recipeImages/3397-312x231.jpg', 'jpg', 2, 2, 1),
(4466, 'Grilled Salmon', 'https://spoonacular.com/recipeImages/4466-312x231.jpg', 'jpg', 1, 2, 2),
(4468, 'Orange Salmon', 'https://spoonacular.com/recipeImages/4468-312x231.jpg', 'jpg', 1, 2, 1),
(4515, 'Braided Salmon', 'https://spoonacular.com/recipeImages/4515-312x231.jpg', 'jpg', 1, 2, 0),
(4516, 'Ginger Salmon', 'https://spoonacular.com/recipeImages/4516-312x231.jpg', 'jpg', 1, 2, 44),
(4521, 'Soy-glazed Salmon Steaks', 'https://spoonacular.com/recipeImages/4521-312x231.jpg', 'jpg', 1, 2, 1),
(4524, 'Seared Salmon With Garlicky Green Beans', 'https://spoonacular.com/recipeImages/4524-312x231.jpg', 'jpg', 1, 2, 6),
(4526, 'Seared Salmon With Horseradish And Scallions', 'https://spoonacular.com/recipeImages/4526-312x231.jpg', 'jpg', 1, 2, 0),
(4528, 'Steamed Salmon With Avocado', 'https://spoonacular.com/recipeImages/4528-312x231.jpg', 'jpg', 1, 2, 3),
(4535, 'Planked Miso-glazed Salmon With Bok Choy', 'https://spoonacular.com/recipeImages/4535-312x231.jpg', 'jpg', 1, 2, 0),
(4578, 'Pan Seared Salmon', 'https://spoonacular.com/recipeImages/4578-312x231.jpg', 'jpg', 1, 2, 1),
(4586, 'Pine Nut-crusted Pacific Salmon', 'https://spoonacular.com/recipeImages/4586-312x231.jpg', 'jpg', 1, 2, 0),
(4606, 'Seared Salmon With Cinnamon And Chili Powder', 'https://spoonacular.com/recipeImages/4606-312x231.jpg', 'jpg', 1, 2, 10),
(4614, 'Brown Sugar Grilled Salmon', 'https://spoonacular.com/recipeImages/4614-312x231.jpg', 'jpg', 1, 2, 0),
(4622, 'Grilled Salmon with Melted Tomatoes', 'https://spoonacular.com/recipeImages/4622-312x231.jpg', 'jpg', 1, 2, 0),
(4656, 'Sesame Encrusted Salmon With Pinot Noir Reduction', 'https://spoonacular.com/recipeImages/4656-312x231.jpg', 'jpg', 1, 2, 4),
(4658, 'Baked Crusted Salmon', 'https://spoonacular.com/recipeImages/4658-312x231.jpg', 'jpg', 1, 2, 3),
(4691, 'Baked Salmon with Dill', 'https://spoonacular.com/recipeImages/4691-312x231.jpg', 'jpg', 1, 2, 0),
(4692, 'Miso-Glazed Salmon', 'https://spoonacular.com/recipeImages/4692-312x231.jpg', 'jpg', 1, 2, 0),
(4700, 'Glazed Salmon With Spicy Grapefruit Relish', 'https://spoonacular.com/recipeImages/4700-312x231.jpg', 'jpg', 1, 2, 23),
(4754, 'Cumin-Dusted Salmon Fillets', 'https://spoonacular.com/recipeImages/4754-312x231.jpg', 'jpg', 1, 2, 0),
(4795, 'Salmon with Wilted Watercress and Balsamic Drizzle', 'https://spoonacular.com/recipeImages/4795-312x231.jpg', 'jpg', 1, 2, 0),
(4814, 'Broiled Salmon with Sweet-and-Sour Cucumbers', 'https://spoonacular.com/recipeImages/4814-312x231.jpg', 'jpg', 1, 2, 0),
(4828, 'Roasted Salmon with Lemon and Dill', 'https://spoonacular.com/recipeImages/4828-312x231.jpg', 'jpg', 1, 2, 0),
(4830, 'Roasted Salmon', 'https://spoonacular.com/recipeImages/4830-312x231.jpg', 'jpg', 1, 2, 1),
(4869, 'Homemade Gravlax', 'https://spoonacular.com/recipeImages/4869-312x231.jpg', 'jpg', 1, 2, 6),
(4873, 'Homemade Gravlax', 'https://spoonacular.com/recipeImages/4873-312x231.jpg', 'jpg', 1, 2, 0),
(4883, 'Seared Salmon with Balsamic Glaze', 'https://spoonacular.com/recipeImages/4883-312x231.jpg', 'jpg', 1, 2, 0),
(4889, 'Grilled Salmon in Grape Leaves with Tomato-Raisin Relish', 'https://spoonacular.com/recipeImages/4889-312x231.jpg', 'jpg', 1, 2, 0),
(4901, 'Classic Gravlax', 'https://spoonacular.com/recipeImages/4901-312x231.jpg', 'jpg', 1, 2, 0),
(5425, 'Salt & Pepper Shrimp With Fried Spinach', 'https://spoonacular.com/recipeImages/5425-312x231.jpg', 'jpg', 2, 1, 4),
(6212, 'Sautéed Snapper with Plum Tomatoes and Spinach', 'https://spoonacular.com/recipeImages/6212-312x231.jpg', 'jpg', 2, 3, 0),
(6220, 'Snapper with Warm Italian-Style Salsa', 'https://spoonacular.com/recipeImages/6220-312x231.jpg', 'jpg', 1, 2, 0),
(8235, 'Protein-packed Arugula Pesto', 'https://spoonacular.com/recipeImages/8235-312x231.jpg', 'jpg', 1, 2, 3),
(8385, 'Scallops With Wilted Spinach And Arugula', 'https://spoonacular.com/recipeImages/8385-312x231.jpg', 'jpg', 2, 3, 17),
(8421, 'Grilled Pizza With Fontina And Arugula', 'https://spoonacular.com/recipeImages/8421-312x231.jpg', 'jpg', 1, 2, 6),
(8428, 'Grilled Mushroom, Arugula & Comté Salad', 'https://spoonacular.com/recipeImages/8428-312x231.jpg', 'jpg', 1, 2, 9),
(8435, 'Chicken Roll-ups With Goat Cheese And Arugula', 'https://spoonacular.com/recipeImages/8435-312x231.jpg', 'jpg', 1, 2, 49),
(8480, 'Spinach Linguine With Walnut-arugula Pesto', 'https://spoonacular.com/recipeImages/8480-312x231.jpg', 'jpg', 2, 3, 13),
(8561, 'Lemon and Arugula Salad with Parmesan Cheese', 'https://spoonacular.com/recipeImages/8561-312x231.jpg', 'jpg', 1, 2, 0),
(8725, 'Warm New Potato Salad with Taleggio and Arugula', 'https://spoonacular.com/recipeImages/8725-312x231.jpg', 'jpg', 1, 2, 0),
(8745, 'Arugula Salad With Parmesan', 'https://spoonacular.com/recipeImages/8745-312x231.jpg', 'jpg', 1, 2, 0),
(8820, 'Arugula Salad With Shaved Parmesan, Lemon & Olive Oil', 'https://spoonacular.com/recipeImages/8820-312x231.jpg', 'jpg', 1, 2, 4),
(8834, 'Arugula, Blood Orange, and Blue Cheese Salad', 'https://spoonacular.com/recipeImages/8834-312x231.jpg', 'jpg', 1, 2, 0),
(8838, 'Porterhouse Steaks with Arugula and Parmesan Cheese', 'https://spoonacular.com/recipeImages/8838-312x231.jpg', 'jpg', 1, 2, 0),
(9034, 'Mission Fig Rolls', 'https://spoonacular.com/recipeImages/9034-312x231.jpg', 'jpg', 1, 2, 0),
(10070, 'Claypot Rice with Chinese Sausage', 'https://spoonacular.com/recipeImages/10070-312x231.jpg', 'jpg', 1, 2, 0),
(13202, 'Hearty Greens With Garlic', 'https://spoonacular.com/recipeImages/13202-312x231.jpg', 'jpg', 2, 2, 15),
(14335, 'Warm Dandelion Greens With Roasted Garlic Dressing', 'https://spoonacular.com/recipeImages/14335-312x231.jpg', 'jpg', 2, 3, 20),
(18097, 'Peas with Spinach and Shallots', 'https://spoonacular.com/recipeImages/18097-312x231.jpg', 'jpg', 2, 3, 0),
(19128, 'Saumon A L\'oiselle (salmon With Sorrel & Shallots)', 'https://spoonacular.com/recipeImages/19128-312x231.jpg', 'jpg', 1, 2, 0),
(19204, 'Lemon Spinach', 'https://spoonacular.com/recipeImages/19204-312x231.jpg', 'jpg', 2, 1, 0),
(19205, 'Spinach With Bacon Bits', 'https://spoonacular.com/recipeImages/19205-312x231.jpg', 'jpg', 2, 2, 5),
(19262, 'Seasoned Spinach', 'https://spoonacular.com/recipeImages/19262-312x231.jpg', 'jpg', 2, 2, 0),
(19270, 'Creamy Garlicky Spinach', 'https://spoonacular.com/recipeImages/19270-312x231.jpg', 'jpg', 2, 3, 0),
(19325, 'Cantonese Spinach with Garlic', 'https://spoonacular.com/recipeImages/19325-312x231.jpg', 'jpg', 2, 1, 0),
(19377, 'Sautéed Spinach with Basil', 'https://spoonacular.com/recipeImages/19377-312x231.jpg', 'jpg', 2, 2, 0),
(19384, 'Sauteed Spinach With Garlic', 'https://spoonacular.com/recipeImages/19384-312x231.jpg', 'jpg', 2, 1, 1),
(19390, 'Sauteed Spinach', 'https://spoonacular.com/recipeImages/19390-312x231.jpg', 'jpg', 2, 2, 0),
(19397, 'Sauteed Spinach With Toasted Pine Nuts', 'https://spoonacular.com/recipeImages/19397-312x231.jpg', 'jpg', 2, 2, 1),
(19568, 'Baked Eggs with Spinach and Tomatoes', 'https://spoonacular.com/recipeImages/19568-312x231.jpg', 'jpg', 2, 2, 0),
(19601, 'Baked Spinach with Garlic Bread Crumbs', 'https://spoonacular.com/recipeImages/19601-312x231.jpg', 'jpg', 2, 2, 0),
(19778, 'Simple Sautéed Spinach', 'https://spoonacular.com/recipeImages/19778-312x231.jpg', 'jpg', 2, 2, 110),
(19838, 'Spinach Sauté With Brown Butter & Garlic', 'https://spoonacular.com/recipeImages/19838-312x231.jpg', 'jpg', 2, 2, 0),
(19941, 'SautÃ©ed Spinach with Mushrooms', 'https://spoonacular.com/recipeImages/19941-312x231.jpg', 'jpg', 2, 2, 0),
(21771, 'Grilled Chicken and Club Sandwich with Avocado and Chipotle Caramelized Onions', 'https://spoonacular.com/recipeImages/21771-312x231.jpg', 'jpg', 4, 5, 0),
(33771, 'Lentil And Ham Hock Soup', 'https://spoonacular.com/recipeImages/33771-312x231.jpg', 'jpg', 1, 2, 0),
(33890, 'Muhjadarrah', 'https://spoonacular.com/recipeImages/33890-312x231.jpg', 'jpg', 1, 2, 0),
(33898, 'Mujadara', 'https://spoonacular.com/recipeImages/33898-312x231.jpg', 'jpg', 1, 2, 79),
(34065, 'Megadarra (Brown Lentils and Rice with Caramelized Onions)', 'https://spoonacular.com/recipeImages/34065-312x231.jpg', 'jpg', 1, 2, 0),
(34296, 'Kentucky Burgoo', 'https://spoonacular.com/recipeImages/34296-312x231.jpg', 'jpg', 5, 9, 0),
(35633, 'Peanut Butter Crispy Rice Treats', 'https://spoonacular.com/recipeImages/35633-312x231.jpg', 'jpg', 1, 2, 0),
(35866, 'Orange Rice', 'https://spoonacular.com/recipeImages/35866-312x231.jpg', 'jpg', 1, 2, 0),
(35868, 'Rice Pilaf with Chorizo and Scallions', 'https://spoonacular.com/recipeImages/35868-312x231.jpg', 'jpg', 1, 2, 0),
(35873, 'Green-Tea Rice', 'https://spoonacular.com/recipeImages/35873-312x231.jpg', 'jpg', 1, 2, 0),
(35879, 'Perfect Sushi Rice', 'https://spoonacular.com/recipeImages/35879-312x231.jpg', 'jpg', 1, 2, 0),
(35901, 'Saffron Rice', 'https://spoonacular.com/recipeImages/35901-312x231.jpg', 'jpg', 1, 2, 0),
(35905, 'Banana Brown Rice', 'https://spoonacular.com/recipeImages/35905-312x231.jpg', 'jpg', 1, 2, 0),
(35914, 'Shiitake Mushrooms, Parsley And Saffron Rice', 'https://spoonacular.com/recipeImages/35914-312x231.jpg', 'jpg', 1, 2, 6),
(35915, 'Asparagus And Courgettes Saffron Rice', 'https://spoonacular.com/recipeImages/35915-312x231.jpg', 'jpg', 1, 2, 0),
(35917, 'Vietnamese Chicken Rice With Ginger Fish Sauce', 'https://spoonacular.com/recipeImages/35917-312x231.jpg', 'jpg', 1, 2, 8),
(35927, 'Coconut Brown Rice', 'https://spoonacular.com/recipeImages/35927-312x231.jpg', 'jpg', 1, 2, 75),
(35929, 'Curried Rice', 'https://spoonacular.com/recipeImages/35929-312x231.jpg', 'jpg', 1, 2, 0),
(35930, 'Saffron Rice', 'https://spoonacular.com/recipeImages/35930-312x231.jpg', 'jpg', 1, 2, 0),
(35939, 'Chipotle\'s \"skinny\" Cilantro Lime Rice', 'https://spoonacular.com/recipeImages/35939-312x231.jpg', 'jpg', 1, 2, 2326),
(36101, 'Spiced Rice', 'https://spoonacular.com/recipeImages/36101-312x231.jpg', 'jpg', 1, 2, 0),
(36116, 'Chop! Chop! Fried Rice', 'https://spoonacular.com/recipeImages/36116-312x231.jpg', 'jpg', 1, 2, 11),
(36124, 'Ham \'fried\' Rice', 'https://spoonacular.com/recipeImages/36124-312x231.jpg', 'jpg', 1, 2, 0),
(36216, 'Crisp Sushi-Rice Cakes', 'https://spoonacular.com/recipeImages/36216-312x231.jpg', 'jpg', 1, 2, 0),
(36276, 'Purple Tai Rice Cooker Sticky Rice', 'https://spoonacular.com/recipeImages/36276-312x231.jpg', 'jpg', 1, 2, 1),
(36366, 'Chorizo, Beans And Rice', 'https://spoonacular.com/recipeImages/36366-312x231.jpg', 'jpg', 4, 4, 0),
(36499, 'Brown Rice with Sesame', 'https://spoonacular.com/recipeImages/36499-312x231.jpg', 'jpg', 1, 2, 0),
(36504, 'Savory Coconut Rice', 'https://spoonacular.com/recipeImages/36504-312x231.jpg', 'jpg', 1, 2, 19),
(36514, 'Coconut Rice (take 2)', 'https://spoonacular.com/recipeImages/36514-312x231.jpg', 'jpg', 1, 2, 33),
(36516, 'Red Beans And Rice', 'https://spoonacular.com/recipeImages/36516-312x231.jpg', 'jpg', 1, 2, 19),
(38903, 'Hearty Garlic Greens', 'https://spoonacular.com/recipeImages/38903-312x231.jpg', 'jpg', 2, 2, 8),
(39695, 'Caramelized Onions', 'https://spoonacular.com/recipeImages/39695-312x231.jpg', 'jpg', 1, 2, 4),
(42727, 'Zippy Beef & Cheese Hoagie', 'https://spoonacular.com/recipeImages/42727-312x231.jpg', 'jpg', 4, 3, 9),
(52353, 'Heat Wave Green Monster', 'https://spoonacular.com/recipeImages/52353-312x231.jpg', 'jpg', 2, 2, 0),
(70625, 'Apple Rice', 'https://spoonacular.com/recipeImages/70625-312x231.jpg', 'jpg', 1, 2, 0),
(74695, 'Smoked Tea Duck', 'https://spoonacular.com/recipeImages/74695-312x231.jpg', 'jpg', 1, 2, 0),
(76582, 'Mussels With Potatoes And Spinach', 'https://spoonacular.com/recipeImages/76582-312x231.jpg', 'jpg', 2, 2, 0),
(78074, 'Massa Brown Rice Egg Bowl', 'https://spoonacular.com/recipeImages/78074-312x231.jpg', 'jpg', 1, 2, 5),
(80150, 'Bacon Cheeseburger', 'https://spoonacular.com/recipeImages/80150-312x231.jpg', 'jpg', 4, 2, 7),
(82857, 'California Burgers With Spicy Oven Fries', 'https://spoonacular.com/recipeImages/82857-312x231.jpg', 'jpg', 4, 4, 2),
(83066, 'Blt Burger', 'https://spoonacular.com/recipeImages/83066-312x231.jpg', 'jpg', 4, 2, 24),
(83693, 'Blue Cheese Bacon Burgers', 'https://spoonacular.com/recipeImages/83693-312x231.jpg', 'jpg', 4, 4, 1),
(84656, 'Mom&rsquo;s Spinach Soup With Anchovies', 'https://spoonacular.com/recipeImages/84656-312x231.jpg', 'jpg', 2, 1, 2),
(85157, 'Salmon on the Grill', 'https://spoonacular.com/recipeImages/85157-312x231.jpg', 'jpg', 1, 2, 0),
(85528, '&quot;Goldilox&quot; Tea Sandwiches', 'https://spoonacular.com/recipeImages/85528-312x231.png', 'png', 1, 2, 1),
(85643, 'Baked Sesame Ginger Salmon', 'https://spoonacular.com/recipeImages/85643-312x231.jpg', 'jpg', 1, 2, 1),
(85688, 'Whiskey Caramelized Salmon', 'https://spoonacular.com/recipeImages/85688-312x231.jpg', 'jpg', 1, 2, 5),
(85769, 'Smoked Salmon Butter', 'https://spoonacular.com/recipeImages/85769-312x231.jpg', 'jpg', 1, 2, 0),
(85949, 'Bistro Catfish', 'https://spoonacular.com/recipeImages/85949-312x231.jpg', 'jpg', 2, 2, 2),
(86695, 'Parmannaise Salmon', 'https://spoonacular.com/recipeImages/86695-312x231.jpg', 'jpg', 1, 2, 1),
(86710, 'Salmon Au Poivre', 'https://spoonacular.com/recipeImages/86710-312x231.jpg', 'jpg', 1, 2, 0),
(86711, 'Asian Glazed Salmon', 'https://spoonacular.com/recipeImages/86711-312x231.jpg', 'jpg', 1, 2, 0),
(86738, 'Roasted caesar and dill Salmon', 'https://spoonacular.com/recipeImages/86738-312x231.jpg', 'jpg', 1, 2, 0),
(86765, 'Salmon with Olive Relish', 'https://spoonacular.com/recipeImages/86765-312x231.png', 'png', 1, 2, 13),
(86823, 'Steamed Artichokes with Poached Eggs and Smoked Salmon', 'https://spoonacular.com/recipeImages/86823-312x231.png', 'png', 1, 2, 5),
(90989, 'Garlic Spinach With White Beans', 'https://spoonacular.com/recipeImages/90989-312x231.jpg', 'jpg', 2, 2, 1),
(94378, 'Hungarian Cabbage Rolls', 'https://spoonacular.com/recipeImages/94378-312x231.jpg', 'jpg', 4, 4, 0),
(98225, 'Ultimate Bacon Cheeseburger', 'https://spoonacular.com/recipeImages/98225-312x231.jpg', 'jpg', 4, 2, 48),
(98461, 'Chicken Caesar BLT Sandwich', 'https://spoonacular.com/recipeImages/98461-312x231.jpg', 'jpg', 4, 2, 0),
(98490, 'Cobb Sandwich', 'https://spoonacular.com/recipeImages/98490-312x231.png', 'png', 4, 4, 1),
(98510, 'Open-Faced Chicken Club Sandwiches', 'https://spoonacular.com/recipeImages/98510-312x231.jpg', 'jpg', 4, 4, 0),
(98562, 'Southwestern Bacon Burgers', 'https://spoonacular.com/recipeImages/98562-312x231.jpg', 'jpg', 4, 4, 13),
(98668, 'Wisconsin Badger Burger', 'https://spoonacular.com/recipeImages/98668-312x231.jpg', 'jpg', 4, 5, 3),
(98681, 'Grilled Bacon Burgers', 'https://spoonacular.com/recipeImages/98681-312x231.jpg', 'jpg', 4, 4, 0),
(98684, 'Chivito', 'https://spoonacular.com/recipeImages/98684-312x231.png', 'png', 4, 5, 0),
(99259, 'Easy Rice Salsa Salad', 'https://spoonacular.com/recipeImages/99259-312x231.jpg', 'jpg', 1, 2, 0),
(99287, 'Lemon Pepper Bacon Chicken Sandwich - Pioneer Woman', 'https://spoonacular.com/recipeImages/99287-312x231.jpg', 'jpg', 4, 2, 16),
(99314, 'Squashed Burgers and Chips', 'https://spoonacular.com/recipeImages/99314-312x231.jpg', 'jpg', 4, 5, 2),
(99368, 'Smoky Bacon Burgers', 'https://spoonacular.com/recipeImages/99368-312x231.jpg', 'jpg', 4, 4, 0),
(100303, 'Steamed Ginger Rice with Snow Peas', 'https://spoonacular.com/recipeImages/100303-312x231.jpg', 'jpg', 1, 2, 1),
(101424, 'Easiest Creamed Spinach', 'https://spoonacular.com/recipeImages/101424-312x231.jpg', 'jpg', 2, 2, 4),
(101425, 'Swiss Chard or Spinach With Pine Nuts and Raisins (ww)', 'https://spoonacular.com/recipeImages/101425-312x231.jpg', 'jpg', 2, 2, 2),
(101429, 'Spinach With Pine Nuts', 'https://spoonacular.com/recipeImages/101429-312x231.jpg', 'jpg', 2, 1, 0),
(101430, 'Spinach with Pine Nuts', 'https://spoonacular.com/recipeImages/101430-312x231.jpg', 'jpg', 2, 2, 0),
(101674, 'Yellow Turnip Soubise', 'https://spoonacular.com/recipeImages/101674-312x231.jpg', 'jpg', 1, 2, 0),
(110417, 'San Francisco Chicken Brocco - Roni', 'https://spoonacular.com/recipeImages/110417-312x231.jpg', 'jpg', 1, 2, 0),
(111180, 'Broccoli with Sour Cream', 'https://spoonacular.com/recipeImages/111180-312x231.jpg', 'jpg', 1, 2, 0),
(112699, 'Grilled Tofu and Sauteed Asian Greens', 'https://spoonacular.com/recipeImages/112699-312x231.png', 'png', 2, 2, 2),
(114158, 'Puerto Rican Rice and Beans (Pink Beans)', 'https://spoonacular.com/recipeImages/114158-312x231.jpg', 'jpg', 4, 5, 11),
(133849, 'Chicken Salad Crescent Rolls', 'https://spoonacular.com/recipeImages/133849-312x231.jpg', 'jpg', 1, 2, 0),
(134880, 'Cipaille Pot Pie', 'https://spoonacular.com/recipeImages/134880-312x231.jpg', 'jpg', 4, 3, 24),
(135800, 'Chicken Alouette', 'https://spoonacular.com/recipeImages/135800-312x231.jpg', 'jpg', 1, 2, 0),
(136322, 'Golden Chicken Nuggets', 'https://spoonacular.com/recipeImages/136322-312x231.jpg', 'jpg', 1, 2, 3),
(136336, 'Melissa\'s Lemon Pepper Chicken', 'https://spoonacular.com/recipeImages/136336-312x231.jpg', 'jpg', 1, 2, 14),
(136337, 'Parmesan Chicken', 'https://spoonacular.com/recipeImages/136337-312x231.jpg', 'jpg', 1, 2, 0),
(136393, 'Mom\'s Fried Chicken', 'https://spoonacular.com/recipeImages/136393-312x231.jpg', 'jpg', 1, 2, 0),
(136398, 'Asian Chicken', 'https://spoonacular.com/recipeImages/136398-312x231.jpg', 'jpg', 1, 2, 1),
(136405, 'Lemon-Grilled Chicken Breasts', 'https://spoonacular.com/recipeImages/136405-312x231.jpg', 'jpg', 1, 2, 2),
(136441, 'Maryland Fried Chicken with Cream Gravy', 'https://spoonacular.com/recipeImages/136441-312x231.png', 'png', 1, 2, 1),
(136444, 'Crock Pot Chicken Taco Meat', 'https://spoonacular.com/recipeImages/136444-312x231.jpg', 'jpg', 1, 2, 0),
(136471, 'Baked Cracker-Crusted Chicken Fingers', 'https://spoonacular.com/recipeImages/136471-312x231.png', 'png', 1, 2, 0),
(136472, 'Diet Cola Chicken', 'https://spoonacular.com/recipeImages/136472-312x231.jpg', 'jpg', 1, 2, 14),
(136496, 'My Favorite Grilled Lemon Chicken', 'https://spoonacular.com/recipeImages/136496-312x231.jpg', 'jpg', 1, 2, 0),
(136527, 'Salsa Seasoning Chicken', 'https://spoonacular.com/recipeImages/136527-312x231.jpg', 'jpg', 1, 2, 0),
(136548, 'Unknownchef86\'s Lemon-Pepper Chicken (Sbd Phase One)', 'https://spoonacular.com/recipeImages/136548-312x231.jpg', 'jpg', 1, 2, 0),
(136584, 'Butterflied Grilled Chicken with Curry and Cumin', 'https://spoonacular.com/recipeImages/136584-312x231.jpg', 'jpg', 1, 2, 0),
(136586, 'Crock Pot Roasted Chicken With Rosemary and Garlic', 'https://spoonacular.com/recipeImages/136586-312x231.jpg', 'jpg', 1, 2, 7),
(136594, 'Salsa Chicken', 'https://spoonacular.com/recipeImages/136594-312x231.png', 'png', 1, 2, 1),
(136605, 'Beer-Can Chicken', 'https://spoonacular.com/recipeImages/136605-312x231.png', 'png', 1, 2, 11),
(136641, 'Kentucky Fried Chicken', 'https://spoonacular.com/recipeImages/136641-312x231.jpg', 'jpg', 1, 2, 16),
(136672, 'Balsamic Chicken', 'https://spoonacular.com/recipeImages/136672-312x231.jpg', 'jpg', 1, 2, 0),
(136716, 'Bacon-Wrapped Rosemary Chicken', 'https://spoonacular.com/recipeImages/136716-312x231.jpg', 'jpg', 1, 2, 9),
(136730, 'Orange Soda Chicken', 'https://spoonacular.com/recipeImages/136730-312x231.jpg', 'jpg', 1, 2, 6),
(136733, 'Easy Chicken-N-Pastry', 'https://spoonacular.com/recipeImages/136733-312x231.jpg', 'jpg', 1, 2, 9),
(136736, 'Oven Fried Sesame Chicken', 'https://spoonacular.com/recipeImages/136736-312x231.jpg', 'jpg', 1, 2, 2),
(136770, 'Salsa Chicken', 'https://spoonacular.com/recipeImages/136770-312x231.jpg', 'jpg', 1, 2, 0),
(136784, 'Ranch Chicken', 'https://spoonacular.com/recipeImages/136784-312x231.jpg', 'jpg', 1, 2, 12),
(136795, 'Shoyu Chicken', 'https://spoonacular.com/recipeImages/136795-312x231.jpg', 'jpg', 1, 2, 1),
(136799, 'Easy Lemon Basil Chicken', 'https://spoonacular.com/recipeImages/136799-312x231.jpg', 'jpg', 1, 2, 0),
(136805, 'Caribbean Jerk Chicken', 'https://spoonacular.com/recipeImages/136805-312x231.png', 'png', 1, 2, 0),
(143413, 'Spam Musubi', 'https://spoonacular.com/recipeImages/143413-312x231.png', 'png', 1, 2, 1),
(149070, 'Salmon Spinach Scramble', 'https://spoonacular.com/recipeImages/149070-312x231.jpg', 'jpg', 1, 2, 0),
(149115, 'Surf N Turf Burger (Grilled Burger with Lobster and Bacon)', 'https://spoonacular.com/recipeImages/149115-312x231.jpg', 'jpg', 4, 5, 1),
(149944, 'Garlicky Spinach', 'https://spoonacular.com/recipeImages/149944-312x231.jpg', 'jpg', 2, 1, 0),
(152780, 'Rice and Wheat Berry Pilaf with Baby Spinach', 'https://spoonacular.com/recipeImages/152780-312x231.jpg', 'jpg', 2, 2, 0),
(158320, 'Bacon Cheeseburger', 'https://spoonacular.com/recipeImages/158320-312x231.jpg', 'jpg', 4, 4, 0),
(159266, 'Blue Cheese and Bacon Chicken Burgers', 'https://spoonacular.com/recipeImages/159266-312x231.jpg', 'jpg', 4, 4, 0),
(159477, 'Grilled Lemon Salmon Packs', 'https://spoonacular.com/recipeImages/159477-312x231.jpg', 'jpg', 1, 2, 0),
(160188, 'Grilled Chicken Club Sandwiches', 'https://spoonacular.com/recipeImages/160188-312x231.jpg', 'jpg', 4, 2, 0),
(163821, 'Chicken BLT Sandwiches', 'https://spoonacular.com/recipeImages/163821-312x231.jpg', 'jpg', 4, 2, 0),
(165942, 'Cordon Bleu Sandwiches', 'https://spoonacular.com/recipeImages/165942-312x231.jpg', 'jpg', 4, 2, 0),
(168171, 'Chicken Salad Club Sandwich Stackers', 'https://spoonacular.com/recipeImages/168171-312x231.jpg', 'jpg', 4, 5, 0),
(170824, 'Chicken Club Sandwiches', 'https://spoonacular.com/recipeImages/170824-312x231.jpg', 'jpg', 4, 2, 0),
(175559, 'Pesto-Glazed Salmon Fillet', 'https://spoonacular.com/recipeImages/175559-312x231.jpg', 'jpg', 1, 2, 4),
(179173, 'Grilled Chicken BLT Sandwiches', 'https://spoonacular.com/recipeImages/179173-312x231.jpg', 'jpg', 4, 3, 91),
(181272, 'Simple Honey-Glazed Salmon', 'https://spoonacular.com/recipeImages/181272-312x231.jpg', 'jpg', 1, 2, 13),
(185034, 'Aloha BBQ Sliders | burger', 'https://spoonacular.com/recipeImages/185034-312x231.jpg', 'jpg', 4, 4, 6161),
(187617, 'Spinach-Garlic Yogurt', 'https://spoonacular.com/recipeImages/187617-312x231.jpg', 'jpg', 2, 2, 0),
(196457, 'Hot and Smoky Cheeseburgers with Bacon and Pickled Cherry Pepper Relish', 'https://spoonacular.com/recipeImages/196457-312x231.jpg', 'jpg', 4, 3, 126),
(196707, 'The Art of Eating\'s Carbonade à la Gueuze', 'https://spoonacular.com/recipeImages/196707-312x231.jpg', 'jpg', 1, 2, 41),
(198313, 'Roast Chicken with Pan Sauce', 'https://spoonacular.com/recipeImages/198313-312x231.jpg', 'jpg', 1, 2, 0),
(198331, 'Roast Chicken with Thyme', 'https://spoonacular.com/recipeImages/198331-312x231.jpg', 'jpg', 1, 2, 10),
(198651, 'The Best Juicy Grilled Boneless Skinless Chicken Breasts', 'https://spoonacular.com/recipeImages/198651-312x231.jpg', 'jpg', 1, 2, 273),
(198678, 'Open-Faced Apricot-Chipotle Chicken Club', 'https://spoonacular.com/recipeImages/198678-312x231.jpg', 'jpg', 4, 5, 0),
(198825, 'Best Brined Roast Chicken', 'https://spoonacular.com/recipeImages/198825-312x231.jpg', 'jpg', 1, 2, 0),
(200039, 'Lexington Style Grilled Chicken', 'https://spoonacular.com/recipeImages/200039-312x231.jpg', 'jpg', 1, 2, 1341),
(200084, 'Stir-Fried Rice with Chinese Sausage', 'https://spoonacular.com/recipeImages/200084-312x231.jpg', 'jpg', 1, 2, 60),
(200884, 'Herb-Grilled Chicken', 'https://spoonacular.com/recipeImages/200884-312x231.jpg', 'jpg', 1, 2, 0),
(201056, 'Glutinous Rice with Red Bean Paste, Walnuts, and Currants', 'https://spoonacular.com/recipeImages/201056-312x231.jpg', 'jpg', 1, 2, 35),
(201283, 'Star Anise Chicken Thighs with Meyer Lemon', 'https://spoonacular.com/recipeImages/201283-312x231.jpg', 'jpg', 1, 2, 44),
(201430, 'French in a Flash: Tapenade Baked Chicken', 'https://spoonacular.com/recipeImages/201430-312x231.jpg', 'jpg', 1, 2, 79),
(202384, 'Berliner Weisse (For Intermediate Homebrewers)', 'https://spoonacular.com/recipeImages/202384-312x231.jpg', 'jpg', 1, 2, 29),
(204024, 'Sushi Rice', 'https://spoonacular.com/recipeImages/204024-312x231.jpg', 'jpg', 1, 2, 0),
(212736, 'BBQ chicken burgers', 'https://spoonacular.com/recipeImages/212736-312x231.jpg', 'jpg', 4, 4, 167),
(221372, 'Easy salmon sushi', 'https://spoonacular.com/recipeImages/221372-312x231.jpg', 'jpg', 1, 2, 134),
(222985, 'Leeky salmon in a parcel', 'https://spoonacular.com/recipeImages/222985-312x231.jpg', 'jpg', 1, 2, 28),
(226141, 'Tamales Tolimenses (Tolima Region Tamales)', 'https://spoonacular.com/recipeImages/226141-312x231.jpg', 'jpg', 4, 4, 502),
(234952, 'Almond-Milk Rice Pudding', 'https://spoonacular.com/recipeImages/234952-312x231.jpg', 'jpg', 1, 2, 0),
(240259, 'Salmon with Balsamic Sauce', 'https://spoonacular.com/recipeImages/240259-312x231.jpg', 'jpg', 1, 2, 0),
(245794, 'Miso Glazed Salmon', 'https://spoonacular.com/recipeImages/245794-312x231.jpg', 'jpg', 1, 2, 1021),
(247838, 'Cheese Covered, Bacon Wrapped Jalapeno Popper Burgers with Roasted Jalapeno Mayonnaise', 'https://spoonacular.com/recipeImages/247838-312x231.jpg', 'jpg', 4, 5, 9951),
(248335, 'Bacon Jam Chicken Club Sandwich with Avocado and Chipotle Mayo', 'https://spoonacular.com/recipeImages/248335-312x231.jpg', 'jpg', 4, 5, 1574),
(248499, 'Strawberry BBQ Chicken Club Sandwich with Bacon, Avocado and Goat Cheese', 'https://spoonacular.com/recipeImages/248499-312x231.jpg', 'jpg', 4, 4, 2052),
(248507, 'Salmon Teriyaki', 'https://spoonacular.com/recipeImages/248507-312x231.jpg', 'jpg', 1, 2, 652),
(252798, '“San Francisco” Bacon Guacamole Cheeseburger', 'https://spoonacular.com/recipeImages/252798-312x231.jpg', 'jpg', 4, 2, 14),
(263697, 'Spinach Artichoke Dip', 'https://spoonacular.com/recipeImages/263697-312x231.jpg', 'jpg', 2, 3, 42),
(264571, 'Crispy Salsa Chicken', 'https://spoonacular.com/recipeImages/264571-312x231.jpg', 'jpg', 1, 2, 0),
(264842, 'Gingersnaps Cookie Balls', 'https://spoonacular.com/recipeImages/264842-312x231.jpg', 'jpg', 1, 2, 0),
(264966, 'Mozzarella and Nectarine Skewers With Pesto', 'https://spoonacular.com/recipeImages/264966-312x231.jpg', 'jpg', 1, 2, 0),
(265037, 'Saucy Parmesan Chicken', 'https://spoonacular.com/recipeImages/265037-312x231.jpg', 'jpg', 1, 2, 0),
(265089, 'Ranch-Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/265089-312x231.jpg', 'jpg', 4, 4, 0),
(265094, 'Sizzlin BBQ Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/265094-312x231.jpg', 'jpg', 4, 4, 0),
(265244, 'Cilantro-Chipotle Rice', 'https://spoonacular.com/recipeImages/265244-312x231.jpg', 'jpg', 1, 2, 0),
(265255, 'Easy OREO Truffles', 'https://spoonacular.com/recipeImages/265255-312x231.jpg', 'jpg', 1, 2, 0),
(265707, 'Greek-Style Lemon Roast Chicken', 'https://spoonacular.com/recipeImages/265707-312x231.jpg', 'jpg', 1, 2, 0),
(265789, 'Southwest Chicken & Rice Soup', 'https://spoonacular.com/recipeImages/265789-312x231.jpg', 'jpg', 1, 2, 0),
(265970, 'Gourmet Parmesan Italian Pesto', 'https://spoonacular.com/recipeImages/265970-312x231.jpg', 'jpg', 1, 2, 0),
(266072, 'Spaghetti Cacio e Pepe', 'https://spoonacular.com/recipeImages/266072-312x231.jpg', 'jpg', 1, 2, 0),
(266381, 'Ants on a Log', 'https://spoonacular.com/recipeImages/266381-312x231.jpg', 'jpg', 1, 2, 0),
(266692, 'A Morning Wrap', 'https://spoonacular.com/recipeImages/266692-312x231.jpg', 'jpg', 1, 2, 0),
(266815, 'Two-Step Salmon', 'https://spoonacular.com/recipeImages/266815-312x231.jpg', 'jpg', 1, 2, 0),
(266819, 'Raspberry Kisses', 'https://spoonacular.com/recipeImages/266819-312x231.jpg', 'jpg', 1, 2, 0),
(266896, 'Pineapple Chicken Wings', 'https://spoonacular.com/recipeImages/266896-312x231.jpg', 'jpg', 1, 2, 0),
(266931, 'Easy Chocolate Truffles', 'https://spoonacular.com/recipeImages/266931-312x231.jpg', 'jpg', 1, 2, 1),
(266949, 'Italian Cottage Dip', 'https://spoonacular.com/recipeImages/266949-312x231.jpg', 'jpg', 1, 2, 0),
(266986, 'Blueberry-Cheese Rolls', 'https://spoonacular.com/recipeImages/266986-312x231.jpg', 'jpg', 1, 2, 0),
(267112, 'Easy Parmesan-Crusted Tilapia', 'https://spoonacular.com/recipeImages/267112-312x231.jpg', 'jpg', 1, 2, 0),
(267273, 'Crispy Baked Pesto Chicken', 'https://spoonacular.com/recipeImages/267273-312x231.jpg', 'jpg', 1, 2, 0),
(267371, 'Ham & Cheese Roll-Ups', 'https://spoonacular.com/recipeImages/267371-312x231.jpg', 'jpg', 1, 2, 0),
(267537, 'Crispy Mozzarella Chicken with Garlic Spinach', 'https://spoonacular.com/recipeImages/267537-312x231.jpg', 'jpg', 2, 2, 0),
(267545, 'Fruity Morning Bagel', 'https://spoonacular.com/recipeImages/267545-312x231.jpg', 'jpg', 1, 2, 0),
(267732, 'Inside-Out Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/267732-312x231.jpg', 'jpg', 4, 3, 0),
(267906, 'Cheddar Jack Creamed Spinach', 'https://spoonacular.com/recipeImages/267906-312x231.jpg', 'jpg', 2, 3, 0),
(267910, 'Strawberry Fruit Dip', 'https://spoonacular.com/recipeImages/267910-312x231.jpg', 'jpg', 1, 2, 0),
(268160, 'Layered Orange-Pineapple Mold', 'https://spoonacular.com/recipeImages/268160-312x231.jpg', 'jpg', 1, 2, 1),
(268176, 'Quick Tortilla-String Cheese Snack', 'https://spoonacular.com/recipeImages/268176-312x231.jpg', 'jpg', 1, 2, 19),
(268398, 'Pickle Roll-Ups', 'https://spoonacular.com/recipeImages/268398-312x231.jpg', 'jpg', 1, 2, 0),
(268543, 'Famous Sub Shop Club', 'https://spoonacular.com/recipeImages/268543-312x231.jpg', 'jpg', 4, 3, 0),
(268649, 'SHAKE \'N BAKEÂ® Mexican Pork Chops', 'https://spoonacular.com/recipeImages/268649-312x231.jpg', 'jpg', 1, 2, 0),
(268703, 'Cheese-Stuffed Burgers with Bacon', 'https://spoonacular.com/recipeImages/268703-312x231.jpg', 'jpg', 4, 2, 0),
(268823, 'Whipped Feta Spread with Walnuts', 'https://spoonacular.com/recipeImages/268823-312x231.jpg', 'jpg', 1, 2, 0),
(268828, 'No-Cook Kabob', 'https://spoonacular.com/recipeImages/268828-312x231.jpg', 'jpg', 1, 2, 0),
(268920, 'Bacon-Spinach Mashed Potatoes', 'https://spoonacular.com/recipeImages/268920-312x231.jpg', 'jpg', 2, 3, 0),
(269013, 'Crab Rangoon', 'https://spoonacular.com/recipeImages/269013-312x231.jpg', 'jpg', 1, 2, 0),
(269015, 'Easy Taco Bake', 'https://spoonacular.com/recipeImages/269015-312x231.jpg', 'jpg', 1, 2, 0),
(269119, 'Mini Pizza Bagels', 'https://spoonacular.com/recipeImages/269119-312x231.jpg', 'jpg', 1, 2, 0),
(269178, 'Quick and Easy Deviled Eggs', 'https://spoonacular.com/recipeImages/269178-312x231.jpg', 'jpg', 1, 2, 0),
(269239, 'Presto Pesto', 'https://spoonacular.com/recipeImages/269239-312x231.jpg', 'jpg', 1, 2, 0),
(269350, 'Chicken & Cheese Sub Sandwiches', 'https://spoonacular.com/recipeImages/269350-312x231.jpg', 'jpg', 4, 4, 0),
(269418, 'Butternut Squash Bake', 'https://spoonacular.com/recipeImages/269418-312x231.jpg', 'jpg', 1, 2, 232),
(269514, 'Cream Cheese-Bacon Crescents', 'https://spoonacular.com/recipeImages/269514-312x231.jpg', 'jpg', 1, 2, 0),
(269581, 'Creamy Coconut Dip', 'https://spoonacular.com/recipeImages/269581-312x231.jpg', 'jpg', 1, 2, 0),
(270063, 'Mediterranean Salmon for Two', 'https://spoonacular.com/recipeImages/270063-312x231.jpg', 'jpg', 2, 3, 0),
(270096, 'Easy Appetizer Bites', 'https://spoonacular.com/recipeImages/270096-312x231.jpg', 'jpg', 1, 2, 0),
(270404, 'Crispy Blue Cheese Potatoes', 'https://spoonacular.com/recipeImages/270404-312x231.jpg', 'jpg', 1, 2, 0),
(270823, 'Morning Maple Waffles', 'https://spoonacular.com/recipeImages/270823-312x231.jpg', 'jpg', 1, 2, 0),
(270892, 'Little Pizzas', 'https://spoonacular.com/recipeImages/270892-312x231.jpg', 'jpg', 1, 2, 0),
(270997, 'Cheesy Broccoli Toss', 'https://spoonacular.com/recipeImages/270997-312x231.jpg', 'jpg', 1, 2, 96),
(271836, '10-Minute Cheesy Mexican Rice', 'https://spoonacular.com/recipeImages/271836-312x231.jpg', 'jpg', 1, 2, 0),
(272075, 'Speedy Triple-Decker Club', 'https://spoonacular.com/recipeImages/272075-312x231.jpg', 'jpg', 4, 2, 0),
(273011, 'Salsa Rice', 'https://spoonacular.com/recipeImages/273011-312x231.jpg', 'jpg', 1, 2, 5),
(273057, '15-Minute Cheesy Rice with Ham & Broccoli', 'https://spoonacular.com/recipeImages/273057-312x231.jpg', 'jpg', 1, 2, 3),
(273947, 'Country Pie', 'https://spoonacular.com/recipeImages/273947-312x231.jpg', 'jpg', 1, 2, 3),
(274183, 'Shrimp Stir-Fry', 'https://spoonacular.com/recipeImages/274183-312x231.jpg', 'jpg', 1, 2, 0),
(275455, 'Hot Spinach Dip', 'https://spoonacular.com/recipeImages/275455-312x231.jpg', 'jpg', 2, 2, 0),
(275798, 'All-American BBQ-Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/275798-312x231.jpg', 'jpg', 4, 3, 0),
(276408, 'Crispy Chicken Club Sandwiches', 'https://spoonacular.com/recipeImages/276408-312x231.jpg', 'jpg', 4, 3, 0),
(276614, 'Polenta with Fontina and Spinach', 'https://spoonacular.com/recipeImages/276614-312x231.jpg', 'jpg', 2, 3, 0),
(278571, 'Springtime Sauteed Spinach', 'https://spoonacular.com/recipeImages/278571-312x231.jpg', 'jpg', 2, 2, 0),
(280873, 'Ultimate Caesar Burgers', 'https://spoonacular.com/recipeImages/280873-312x231.jpg', 'jpg', 4, 2, 0),
(287299, 'Jack\'s Brunswick Stew', 'https://spoonacular.com/recipeImages/287299-312x231.jpeg', 'jpeg', 4, 6, 9),
(288154, 'Stuffed Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/288154-312x231.jpeg', 'jpeg', 4, 2, 2),
(289406, 'Chicken and Sausage Sandwiches with Sauteed Bell Peppers and German Potato Salad', 'https://spoonacular.com/recipeImages/289406-312x231.jpeg', 'jpeg', 4, 6, 0),
(294851, 'Lori\'s Special Spinach', 'https://spoonacular.com/recipeImages/294851-312x231.jpeg', 'jpeg', 2, 2, 0),
(296927, 'Chicken-Avocado Club Sandwiches', 'https://spoonacular.com/recipeImages/296927-312x231.jpg', 'jpg', 4, 6, 0),
(299135, 'Asparagus and Smoked Salmon Bundles', 'https://spoonacular.com/recipeImages/299135-312x231.jpeg', 'jpeg', 1, 2, 4),
(301277, 'Bacon, Onion and Cheese Stuffed Burger', 'https://spoonacular.com/recipeImages/301277-312x231.jpeg', 'jpeg', 4, 4, 14),
(307148, 'CBLTS', 'https://spoonacular.com/recipeImages/307148-312x231.jpeg', 'jpeg', 4, 3, 3),
(311252, 'Spinach Saute', 'https://spoonacular.com/recipeImages/311252-312x231.jpeg', 'jpeg', 2, 1, 2),
(312973, 'Braised Spinach', 'https://spoonacular.com/recipeImages/312973-312x231.jpeg', 'jpeg', 2, 2, 0),
(314454, 'Grilled Polenta with Spinach and Robiola Cheese', 'https://spoonacular.com/recipeImages/314454-312x231.jpg', 'jpg', 2, 1, 0),
(329544, 'Spinaci (Spinach) alla Padella (Frying Pan)', 'https://spoonacular.com/recipeImages/329544-312x231.jpeg', 'jpeg', 2, 1, 1),
(330777, 'Nutty Rice', 'https://spoonacular.com/recipeImages/330777-312x231.jpg', 'jpg', 1, 2, 0),
(332877, 'Dry Rubbed BBQ Chicken', 'https://spoonacular.com/recipeImages/332877-312x231.jpeg', 'jpeg', 1, 2, 3),
(359530, 'Garlic-Lime Spinach', 'https://spoonacular.com/recipeImages/359530-312x231.jpeg', 'jpeg', 2, 1, 1),
(370750, 'Grilled Pepper Jack Chicken Sandwiches', 'https://spoonacular.com/recipeImages/370750-312x231.jpg', 'jpg', 4, 5, 0),
(372148, 'Grilled Chicken Club Pitas', 'https://spoonacular.com/recipeImages/372148-312x231.jpg', 'jpg', 4, 5, 0),
(372588, 'Broccoli with Rice', 'https://spoonacular.com/recipeImages/372588-312x231.jpg', 'jpg', 1, 2, 0),
(379075, 'Orange-Pecan Salmon for Two', 'https://spoonacular.com/recipeImages/379075-312x231.jpg', 'jpg', 1, 2, 0),
(380176, 'Sweet Mustard Salmon', 'https://spoonacular.com/recipeImages/380176-312x231.jpg', 'jpg', 1, 2, 90),
(385233, 'Spinach & Feta Saute', 'https://spoonacular.com/recipeImages/385233-312x231.jpg', 'jpg', 2, 2, 29),
(387552, 'Roast Beef BLT', 'https://spoonacular.com/recipeImages/387552-312x231.jpg', 'jpg', 4, 3, 0),
(389673, 'Chicken Cacciatore Subs', 'https://spoonacular.com/recipeImages/389673-312x231.jpeg', 'jpeg', 5, 7, 1),
(391182, 'Sauteed Spinach', 'https://spoonacular.com/recipeImages/391182-312x231.jpg', 'jpg', 2, 1, 0),
(393884, 'Maple Cranberry Chicken', 'https://spoonacular.com/recipeImages/393884-312x231.jpg', 'jpg', 1, 2, 0),
(394046, 'Easy Rice Pilaf', 'https://spoonacular.com/recipeImages/394046-312x231.jpg', 'jpg', 1, 2, 0),
(394088, 'Diploma Sandwiches', 'https://spoonacular.com/recipeImages/394088-312x231.jpg', 'jpg', 1, 2, 0),
(394692, 'Onigiri (Rice Balls)', 'https://spoonacular.com/recipeImages/394692-312x231.jpg', 'jpg', 1, 2, 3),
(396325, 'Wilted Garlic Spinach', 'https://spoonacular.com/recipeImages/396325-312x231.jpg', 'jpg', 2, 2, 0),
(398915, 'Pepper Jack Stuffed Chicken', 'https://spoonacular.com/recipeImages/398915-312x231.jpg', 'jpg', 1, 2, 11),
(400189, 'Vegetable Rice Medley', 'https://spoonacular.com/recipeImages/400189-312x231.jpg', 'jpg', 1, 2, 0),
(401265, 'Deluxe Bacon Burgers', 'https://spoonacular.com/recipeImages/401265-312x231.jpg', 'jpg', 4, 5, 0),
(402202, 'Grilled Pineapple Chicken Sandwiches', 'https://spoonacular.com/recipeImages/402202-312x231.jpg', 'jpg', 4, 3, 0),
(403967, 'Orange-Pecan Salmon', 'https://spoonacular.com/recipeImages/403967-312x231.jpg', 'jpg', 1, 2, 16),
(415258, 'Spinach with Pine Nuts and Raisins', 'https://spoonacular.com/recipeImages/415258-312x231.jpg', 'jpg', 2, 2, 0),
(423629, 'BBQ Bacon Burgers', 'https://spoonacular.com/recipeImages/423629-312x231.jpg', 'jpg', 4, 5, 5),
(424584, 'Western Range Sandwiches', 'https://spoonacular.com/recipeImages/424584-312x231.jpg', 'jpg', 4, 5, 0),
(426151, 'Partridge with Wild Rice', 'https://spoonacular.com/recipeImages/426151-312x231.jpg', 'jpg', 1, 2, 0),
(428204, 'Rice-Stuffed Pork Chops', 'https://spoonacular.com/recipeImages/428204-312x231.jpg', 'jpg', 1, 2, 0),
(435597, 'Mexican Rice', 'https://spoonacular.com/recipeImages/435597-312x231.jpg', 'jpg', 1, 2, 0),
(436906, 'Chicken Salad Clubs', 'https://spoonacular.com/recipeImages/436906-312x231.jpg', 'jpg', 4, 3, 0),
(437346, 'Creamy Cheese Rice', 'https://spoonacular.com/recipeImages/437346-312x231.jpg', 'jpg', 1, 2, 1),
(444496, 'Sourdough Chicken Sandwiches', 'https://spoonacular.com/recipeImages/444496-312x231.jpg', 'jpg', 4, 5, 99),
(448036, 'Warm Spinach Salad', 'https://spoonacular.com/recipeImages/448036-312x231.jpg', 'jpg', 2, 2, 26),
(459549, 'Spinach Garlic Pasta', 'https://spoonacular.com/recipeImages/459549-312x231.jpg', 'jpg', 2, 1, 30),
(463302, '1-2-3 Grilled Salmon for Two', 'https://spoonacular.com/recipeImages/463302-312x231.jpg', 'jpg', 1, 2, 667),
(468410, 'Salsa Rice', 'https://spoonacular.com/recipeImages/468410-312x231.jpg', 'jpg', 1, 2, 26),
(471726, 'Curried Salmon Bake', 'https://spoonacular.com/recipeImages/471726-312x231.jpg', 'jpg', 1, 2, 31),
(473382, 'Sautéed Spinach', 'https://spoonacular.com/recipeImages/473382-312x231.jpg', 'jpg', 2, 1, 16),
(477047, 'Honey Ginger Salmon', 'https://spoonacular.com/recipeImages/477047-312x231.jpg', 'jpg', 1, 2, 149),
(477454, 'Southern Salmon Patties', 'https://spoonacular.com/recipeImages/477454-312x231.jpg', 'jpg', 1, 2, 376),
(478423, 'Ooops, sorry, but nothing lasts forever', 'https://spoonacular.com/recipeImages/478423-312x231.jpg', 'jpg', 5, 21, 5),
(483210, 'Lemon Garlic Greens and Onions', 'https://spoonacular.com/recipeImages/483210-312x231.jpg', 'jpg', 2, 2, 23),
(485655, 'Blackberry Walnut Salmon', 'https://spoonacular.com/recipeImages/485655-312x231.jpg', 'jpg', 1, 2, 1),
(492233, 'Santa Fe Baked Chicken', 'https://spoonacular.com/recipeImages/492233-312x231.jpg', 'jpg', 1, 1, 107520),
(493441, 'Cilantro Lime Rice', 'https://spoonacular.com/recipeImages/493441-312x231.jpg', 'jpg', 1, 2, 622),
(494595, 'Cajun Blackened Salmon', 'https://spoonacular.com/recipeImages/494595-312x231.jpg', 'jpg', 1, 2, 56),
(497056, 'Sweet Coconut Sticky Rice with Mango', 'https://spoonacular.com/recipeImages/497056-312x231.jpg', 'jpg', 1, 2, 828),
(497320, 'Sesame Garlic Wilted Spinach', 'https://spoonacular.com/recipeImages/497320-312x231.jpg', 'jpg', 2, 1, 122),
(497879, 'Korean Spinach Banchan (Sigeumchi Namul)', 'https://spoonacular.com/recipeImages/497879-312x231.jpg', 'jpg', 2, 2, 203),
(501018, 'Chicken and Yellow Rice', 'https://spoonacular.com/recipeImages/501018-312x231.jpg', 'jpg', 1, 2, 276),
(502624, 'Chorizo Burger with Fried Egg and Sriracha Mayo', 'https://spoonacular.com/recipeImages/502624-312x231.jpg', 'jpg', 4, 5, 211),
(504201, 'Honey Lemon Pepper Salmon – 15 Minute Meal', 'https://spoonacular.com/recipeImages/504201-312x231.jpg', 'jpg', 1, 2, 246),
(507262, 'Classic Cheeseburger', 'https://spoonacular.com/recipeImages/507262-312x231.jpg', 'jpg', 4, 2, 148),
(508040, 'Spinach Dip', 'https://spoonacular.com/recipeImages/508040-312x231.jpg', 'jpg', 2, 2, 3951),
(510441, 'Soy Honey Salmon', 'https://spoonacular.com/recipeImages/510441-312x231.jpg', 'jpg', 1, 2, 1785),
(511973, 'Roasted Salmon with Spicy Apricot Glaze', 'https://spoonacular.com/recipeImages/511973-312x231.jpg', 'jpg', 1, 2, 96),
(514432, 'Sauteed Spinach with Cranberries and Feta', 'https://spoonacular.com/recipeImages/514432-312x231.jpg', 'jpg', 2, 2, 160),
(515676, 'Bacon Chipotle Stuffed Cheeseburger', 'https://spoonacular.com/recipeImages/515676-312x231.jpg', 'jpg', 4, 4, 439),
(516025, 'Parmesan Rice with Spinach', 'https://spoonacular.com/recipeImages/516025-312x231.png', 'png', 2, 2, 403),
(516261, 'Honey Glazed Grilled Salmon', 'https://spoonacular.com/recipeImages/516261-312x231.png', 'png', 1, 2, 187),
(517609, 'Seared Jumbo Scallops', 'https://spoonacular.com/recipeImages/517609-312x231.jpg', 'jpg', 2, 2, 3),
(518253, 'Lightened Up Chicken Bacon Ranch Sandwiches', 'https://spoonacular.com/recipeImages/518253-312x231.jpg', 'jpg', 4, 5, 238),
(521817, 'Spinach Scramble', 'https://spoonacular.com/recipeImages/521817-312x231.jpg', 'jpg', 2, 2, 27),
(523208, 'Spinach and cream cheese dumplings', 'https://spoonacular.com/recipeImages/523208-312x231.jpg', 'jpg', 2, 2, 150),
(524312, 'savory squash puree', 'https://spoonacular.com/recipeImages/524312-312x231.jpg', 'jpg', 1, 2, 46),
(524327, 'cranberry horseradish cheddar bites', 'https://spoonacular.com/recipeImages/524327-312x231.jpg', 'jpg', 1, 2, 729),
(524410, 'Cheese Straw Cracker Pumpkins (Five Ingredient Friday)', 'https://spoonacular.com/recipeImages/524410-312x231.jpg', 'jpg', 1, 2, 15),
(524902, 'Easy Slow Cooker Chicken and Gravy', 'https://spoonacular.com/recipeImages/524902-312x231.jpg', 'jpg', 1, 2, 6293),
(525080, '3- Ingredient Crock Pot Chili Cheese Dip', 'https://spoonacular.com/recipeImages/525080-312x231.jpg', 'jpg', 1, 2, 555),
(525093, 'Parmesan Roasted Asparagus', 'https://spoonacular.com/recipeImages/525093-312x231.jpg', 'jpg', 1, 2, 1677),
(525149, 'Skinny Strawberry Rice Pudding', 'https://spoonacular.com/recipeImages/525149-312x231.jpg', 'jpg', 1, 2, 50),
(525165, 'Slow Cooker Chocolate Rice Pudding', 'https://spoonacular.com/recipeImages/525165-312x231.jpg', 'jpg', 1, 2, 3),
(525212, 'Easy Crock Pot Chicken and Stuffing', 'https://spoonacular.com/recipeImages/525212-312x231.jpg', 'jpg', 1, 2, 436),
(525214, 'Easy 3-Ingredient Crock Pot Corn Dip', 'https://spoonacular.com/recipeImages/525214-312x231.jpg', 'jpg', 1, 2, 192),
(525301, 'Easy 3 Ingredient Slow Cooker Chicken', 'https://spoonacular.com/recipeImages/525301-312x231.jpg', 'jpg', 1, 2, 724),
(525758, 'Nigella Lawson’s Chicken Teriyaki', 'https://spoonacular.com/recipeImages/525758-312x231.jpg', 'jpg', 1, 2, 40),
(525770, 'Crock Pot Balsamic Chicken Thighs', 'https://spoonacular.com/recipeImages/525770-312x231.jpg', 'jpg', 1, 2, 241),
(525890, 'Baked Crusted Salmon and a McCormick Spice Giveaway', 'https://spoonacular.com/recipeImages/525890-312x231.jpg', 'jpg', 1, 2, 8),
(525989, 'Stuffed Jalepeno Peppers {}', 'https://spoonacular.com/recipeImages/525989-312x231.jpg', 'jpg', 1, 2, 18),
(525991, 'Creamy Fruit Dip', 'https://spoonacular.com/recipeImages/525991-312x231.jpg', 'jpg', 1, 2, 3),
(526166, 'How to Make Kale Chips', 'https://spoonacular.com/recipeImages/526166-312x231.jpg', 'jpg', 1, 2, 4),
(526303, 'Grilled Bacon Jack Chicken Sandwich', 'https://spoonacular.com/recipeImages/526303-312x231.jpg', 'jpg', 4, 6, 2),
(526321, 'Red Dates and Egg Tea', 'https://spoonacular.com/recipeImages/526321-312x231.jpg', 'jpg', 1, 2, 70),
(526429, 'Grilled Dijon Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/526429-312x231.jpg', 'jpg', 4, 5, 4),
(526619, 'Deep Fried Salmon Fish Sticks', 'https://spoonacular.com/recipeImages/526619-312x231.jpg', 'jpg', 1, 2, 15),
(526994, 'Easy Balsamic Chicken Skewers + A BIG Giveaway', 'https://spoonacular.com/recipeImages/526994-312x231.jpg', 'jpg', 1, 2, 136),
(527041, '7 Cheese Garlic Spread', 'https://spoonacular.com/recipeImages/527041-312x231.jpg', 'jpg', 1, 2, 38),
(527350, 'Slow Cooker Buffalo Chicken Sandwiches', 'https://spoonacular.com/recipeImages/527350-312x231.jpg', 'jpg', 1, 2, 11),
(527490, 'Easy Pesto Stuffed Mushrooms', 'https://spoonacular.com/recipeImages/527490-312x231.jpg', 'jpg', 1, 2, 29),
(527578, 'Bacon-Wrapped Blue Cheese Stuffed Dates', 'https://spoonacular.com/recipeImages/527578-312x231.jpg', 'jpg', 1, 2, 66),
(527788, 'Chicken Chili Quesadillas', 'https://spoonacular.com/recipeImages/527788-312x231.jpg', 'jpg', 1, 2, 1),
(527797, '{Video} How to Poach Chicken Breasts', 'https://spoonacular.com/recipeImages/527797-312x231.jpg', 'jpg', 1, 2, 1),
(527800, 'Panko Fried Chicken Tenders', 'https://spoonacular.com/recipeImages/527800-312x231.jpg', 'jpg', 1, 2, 5),
(527804, 'Lemon and Herb Roast Chicken', 'https://spoonacular.com/recipeImages/527804-312x231.jpg', 'jpg', 1, 2, 3),
(527878, 'Baked Chicken Tenders', 'https://spoonacular.com/recipeImages/527878-312x231.jpg', 'jpg', 1, 2, 6),
(527892, 'Gluten Free Baked Chicken Tenders', 'https://spoonacular.com/recipeImages/527892-312x231.jpg', 'jpg', 1, 2, 19),
(527898, 'Pretzel-Crusted Chicken Nuggets', 'https://spoonacular.com/recipeImages/527898-312x231.jpg', 'jpg', 1, 2, 14),
(527972, 'Bacon Stuffed Chicken #CookingWithFarmerJohn', 'https://spoonacular.com/recipeImages/527972-312x231.jpg', 'jpg', 1, 2, 67),
(528326, 'Oktoberfest Burger', 'https://spoonacular.com/recipeImages/528326-312x231.jpg', 'jpg', 4, 5, 6),
(528333, 'Copycat Chick-fil-A Chicken Nuggets', 'https://spoonacular.com/recipeImages/528333-312x231.jpg', 'jpg', 1, 2, 91),
(530628, 'Basil Pesto with Walnuts', 'https://spoonacular.com/recipeImages/530628-312x231.jpg', 'jpg', 1, 2, 939),
(530736, 'Cheddar Bacon Onion Sliders', 'https://spoonacular.com/recipeImages/530736-312x231.jpg', 'jpg', 4, 3, 3070),
(530744, 'Crab Rangoon - Lobster Style', 'https://spoonacular.com/recipeImages/530744-312x231.jpg', 'jpg', 1, 2, 43),
(530808, 'Gorgonzola Smashed Potatoes', 'https://spoonacular.com/recipeImages/530808-312x231.jpg', 'jpg', 1, 2, 1058),
(531157, 'Zucchini Noodles and Fresh Pesto', 'https://spoonacular.com/recipeImages/531157-312x231.jpg', 'jpg', 1, 2, 0),
(531683, 'Barbecue Chicken Quesadillas', 'https://spoonacular.com/recipeImages/531683-312x231.jpg', 'jpg', 1, 2, 37),
(531728, 'Take Advantage of Local Produce with this Easy Caprese Appetizer', 'https://spoonacular.com/recipeImages/531728-312x231.jpg', 'jpg', 1, 2, 0),
(531847, 'Chicken Salad Quesadillas', 'https://spoonacular.com/recipeImages/531847-312x231.jpg', 'jpg', 1, 2, 3),
(532245, 'Pasta Bake', 'https://spoonacular.com/recipeImages/532245-312x231.jpg', 'jpg', 1, 2, 5),
(532320, 'Chili Pasta Bake', 'https://spoonacular.com/recipeImages/532320-312x231.jpg', 'jpg', 1, 2, 11),
(532454, '10 Uses for Basil + Walnut Pesto', 'https://spoonacular.com/recipeImages/532454-312x231.jpg', 'jpg', 1, 2, 14),
(532688, 'Basmati Rice with Onion and Garlic', 'https://spoonacular.com/recipeImages/532688-312x231.jpg', 'jpg', 1, 2, 2),
(532783, 'French Bread Pizza', 'https://spoonacular.com/recipeImages/532783-312x231.jpg', 'jpg', 1, 2, 1941),
(532826, 'Roasted Garlic and Brie Crostini', 'https://spoonacular.com/recipeImages/532826-312x231.jpg', 'jpg', 1, 2, 793),
(532838, 'Arugula Pesto', 'https://spoonacular.com/recipeImages/532838-312x231.jpg', 'jpg', 1, 2, 98),
(532848, 'Roasted Red Pepper Cheese Dip', 'https://spoonacular.com/recipeImages/532848-312x231.jpg', 'jpg', 1, 2, 3),
(532874, 'Deep Dish Skillet Pizza', 'https://spoonacular.com/recipeImages/532874-312x231.jpg', 'jpg', 1, 2, 3834),
(532895, 'Twice Baked Potatoes with Greek Yogurt', 'https://spoonacular.com/recipeImages/532895-312x231.jpg', 'jpg', 1, 2, 285),
(532902, 'Parmesan Wonton Crackers', 'https://spoonacular.com/recipeImages/532902-312x231.jpg', 'jpg', 1, 2, 37572),
(532934, 'Spinach Prosciutto Salad with Basil Vinaigrette', 'https://spoonacular.com/recipeImages/532934-312x231.jpg', 'jpg', 2, 3, 246),
(532949, 'Three Cheese Spinach Tortellini', 'https://spoonacular.com/recipeImages/532949-312x231.jpg', 'jpg', 1, 2, 226),
(539285, 'Spinach Hummus', 'https://spoonacular.com/recipeImages/539285-312x231.jpg', 'jpg', 2, 3, 128),
(539804, 'Spinach Penne Pasta with Toasted Almonds and Dairy-Free “Parmesan Creamy Cheese”', 'https://spoonacular.com/recipeImages/539804-312x231.jpg', 'jpg', 2, 2, 74),
(542892, 'Mushroom Spinach Alfredo', 'https://spoonacular.com/recipeImages/542892-312x231.jpg', 'jpg', 2, 3, 23),
(543568, 'Pistachio Pesto', 'https://spoonacular.com/recipeImages/543568-312x231.jpg', 'jpg', 2, 3, 0),
(543727, 'Smoked Salmon & Cream Cheese Bites', 'https://spoonacular.com/recipeImages/543727-312x231.jpg', 'jpg', 1, 2, 0),
(544351, 'Maple Soy Salmon', 'https://spoonacular.com/recipeImages/544351-312x231.jpg', 'jpg', 1, 2, 0),
(544739, 'BBQ Bacon-Habanero Burger', 'https://spoonacular.com/recipeImages/544739-312x231.jpg', 'jpg', 4, 2, 27),
(545548, 'White Beans with Bacon & Garlicky Greens', 'https://spoonacular.com/recipeImages/545548-312x231.jpg', 'jpg', 2, 2, 2),
(546498, 'Crispy Mozzarella Chicken with Garlic Spinach', 'https://spoonacular.com/recipeImages/546498-312x231.jpg', 'jpg', 2, 2, 0),
(551080, 'Grilled Salmon', 'https://spoonacular.com/recipeImages/551080-312x231.jpg', 'jpg', 1, 2, 338);
INSERT INTO `recipes` (`id`, `title`, `image`, `imageType`, `usedIngredientCount`, `missedIngredientCount`, `likes`) VALUES
(551867, 'for Honey-Soy Roasted Salmon', 'https://spoonacular.com/recipeImages/551867-312x231.jpg', 'jpg', 1, 2, 165),
(553804, 'Royal Ultimate Burger', 'https://spoonacular.com/recipeImages/553804-312x231.jpg', 'jpg', 4, 4, 546),
(556173, 'Avocado Bacon Burgers', 'https://spoonacular.com/recipeImages/556173-312x231.png', 'png', 4, 5, 143),
(556765, 'Cheesy Spinach Baked Eggs', 'https://spoonacular.com/recipeImages/556765-312x231.jpg', 'jpg', 2, 2, 789),
(558768, 'Coconut Sticky Sweet Rice with Mango', 'https://spoonacular.com/recipeImages/558768-312x231.jpg', 'jpg', 1, 2, 3917),
(559041, 'Homemade Cheese Crackers & Meal Planning', 'https://spoonacular.com/recipeImages/559041-312x231.jpg', 'jpg', 1, 2, 172),
(559249, 'Creamed Spinach', 'https://spoonacular.com/recipeImages/559249-312x231.jpg', 'jpg', 2, 2, 727),
(559405, 'Easy Chicken Salad Sandwiches', 'https://spoonacular.com/recipeImages/559405-312x231.jpg', 'jpg', 4, 5, 1428),
(560633, 'Spinach Pesto', 'https://spoonacular.com/recipeImages/560633-312x231.jpg', 'jpg', 2, 2, 25),
(563283, 'Vegan Basil Rice Pilaf or Basil Fried Rice', 'https://spoonacular.com/recipeImages/563283-312x231.jpg', 'jpg', 1, 2, 1),
(564113, 'Sauteed Spinach', 'https://spoonacular.com/recipeImages/564113-312x231.jpg', 'jpg', 2, 1, 359),
(564665, 'Garlic Fried Rice | How to make Sinangag', 'https://spoonacular.com/recipeImages/564665-312x231.jpg', 'jpg', 1, 2, 4269),
(564964, 'Chinese Spinach in Superior Broth', 'https://spoonacular.com/recipeImages/564964-312x231.jpg', 'jpg', 2, 2, 9),
(565537, '{ Redux} Green Tea Rice', 'https://spoonacular.com/recipeImages/565537-312x231.jpg', 'jpg', 1, 2, 42),
(567361, 'Guacamole Bacon Cheeseburger', 'https://spoonacular.com/recipeImages/567361-312x231.jpg', 'jpg', 4, 3, 0),
(567543, 'Simply Seasoned Korean Spinach Salad (Sigeumchi Namul version.1)', 'https://spoonacular.com/recipeImages/567543-312x231.jpg', 'jpg', 2, 2, 119),
(567906, 'Sauteed Spinach with Toasted Sesame Seeds', 'https://spoonacular.com/recipeImages/567906-312x231.jpg', 'jpg', 2, 2, 5),
(568412, 'Biko', 'https://spoonacular.com/recipeImages/568412-312x231.jpg', 'jpg', 1, 2, 66),
(569859, 'California Club Sandwich', 'https://spoonacular.com/recipeImages/569859-312x231.jpg', 'jpg', 4, 5, 2860),
(574789, 'Real Men Cook: Sautéed Garlic Spinach', 'https://spoonacular.com/recipeImages/574789-312x231.jpg', 'jpg', 2, 1, 193),
(576020, 'Grilled Chicken with Sauteed Spinach and Garlic', 'https://spoonacular.com/recipeImages/576020-312x231.jpg', 'jpg', 2, 2, 6),
(576516, 'College Student Meals – Easy Minestrone and Spinach Quesadillas Week', 'https://spoonacular.com/recipeImages/576516-312x231.jpg', 'jpg', 5, 18, 3),
(576678, 'Lemon Salmon Kebabs', 'https://spoonacular.com/recipeImages/576678-312x231.jpg', 'jpg', 1, 2, 1250),
(577077, 'College Student Meals – Bacon Cheeseburger Meatloaf Week', 'https://spoonacular.com/recipeImages/577077-312x231.jpg', 'jpg', 6, 19, 22),
(577151, 'Grilled Salmon with Lemon Dill Butter', 'https://spoonacular.com/recipeImages/577151-312x231.jpg', 'jpg', 1, 2, 2128),
(582106, 'Mushroom and Spinach Garlic Noodles', 'https://spoonacular.com/recipeImages/582106-312x231.jpg', 'jpg', 2, 2, 57),
(584016, 'Coconut Lime Salmon', 'https://spoonacular.com/recipeImages/584016-312x231.jpg', 'jpg', 1, 2, 337),
(585154, 'Roasted Ramps and Mushrooms with Salmon', 'https://spoonacular.com/recipeImages/585154-312x231.jpg', 'jpg', 1, 2, 18),
(586126, 'Spinach Pesto', 'https://spoonacular.com/recipeImages/586126-312x231.jpg', 'jpg', 2, 2, 365),
(586362, 'Marinated Baked Salmon', 'https://spoonacular.com/recipeImages/586362-312x231.jpg', 'jpg', 1, 2, 1162),
(587120, 'Onion Ring Topped BBQ Bacon Burgers', 'https://spoonacular.com/recipeImages/587120-312x231.png', 'png', 4, 3, 1168),
(590735, '2-Ingredient Slow Cooker Salsa Chicken', 'https://spoonacular.com/recipeImages/590735-312x231.jpg', 'jpg', 1, 2, 177),
(591363, '5 Ingredient Soy Dijon Chicken', 'https://spoonacular.com/recipeImages/591363-312x231.jpg', 'jpg', 1, 2, 900),
(592253, 'ginger salmon', 'https://spoonacular.com/recipeImages/592253-312x231.jpg', 'jpg', 1, 2, 458),
(592823, 'Care for a Condiment', 'https://spoonacular.com/recipeImages/592823-312x231.jpg', 'jpg', 1, 2, 1),
(593038, 'Soy-Glazed Salmon', 'https://spoonacular.com/recipeImages/593038-312x231.jpg', 'jpg', 1, 2, 56),
(593064, 'Baked Asian-Style Salmon', 'https://spoonacular.com/recipeImages/593064-312x231.jpg', 'jpg', 1, 2, 307),
(594539, 'soy sauce and sugar salmon with white rice', 'https://spoonacular.com/recipeImages/594539-312x231.jpg', 'jpg', 1, 2, 15),
(594973, 'Bourbon Spice Barbecue Chicken Wings', 'https://spoonacular.com/recipeImages/594973-312x231.jpg', 'jpg', 1, 2, 9106),
(595164, 'Grilled Basil Garlic Chicken Breasts', 'https://spoonacular.com/recipeImages/595164-312x231.jpg', 'jpg', 1, 2, 25144),
(596464, 'chicken BLT sandwiches', 'https://spoonacular.com/recipeImages/596464-312x231.jpg', 'jpg', 4, 3, 4),
(601140, 'Chipotle Mexican Grill Basmati Rice – Known for their freshly made Tex Mex food, their rice is a most requested', 'https://spoonacular.com/recipeImages/601140-312x231.jpg', 'jpg', 1, 2, 156),
(606627, 'All-American Grilled BBQ-Bacon Cheeseburgers', 'https://spoonacular.com/recipeImages/606627-312x231.jpg', 'jpg', 4, 4, 4),
(611371, 'Cheddar Bacon Ranch Sliders', 'https://spoonacular.com/recipeImages/611371-312x231.jpg', 'jpg', 4, 3, 209),
(615204, 'Teriyaki Salmon', 'https://spoonacular.com/recipeImages/615204-312x231.jpg', 'jpg', 1, 2, 405),
(618538, 'Maple-Soy Glazed Salmon', 'https://spoonacular.com/recipeImages/618538-312x231.jpg', 'jpg', 1, 2, 1242),
(619864, 'Sausage Rigatoni with Spinach', 'https://spoonacular.com/recipeImages/619864-312x231.jpg', 'jpg', 2, 2, 0),
(624304, 'set dosa recipe', 'https://spoonacular.com/recipeImages/624304-312x231.jpg', 'jpg', 1, 2, 1),
(624323, 'Chipotles Cilantro Lime Rice in the Pressure Cooker', 'https://spoonacular.com/recipeImages/624323-312x231.jpg', 'jpg', 1, 2, 2396),
(624715, 'Cocido Boyacense (Boyacá Region Stew)', 'https://spoonacular.com/recipeImages/624715-312x231.jpg', 'jpg', 5, 7, 82),
(624960, 'Baked Spinach and Artichoke Dip', 'https://spoonacular.com/recipeImages/624960-312x231.jpg', 'jpg', 2, 2, 1),
(626033, 'dairy free Rice Pudding', 'https://spoonacular.com/recipeImages/626033-312x231.jpg', 'jpg', 1, 2, 17),
(626238, 'M’Juddarah – Lentils and Rice with Caramelized Onions', 'https://spoonacular.com/recipeImages/626238-312x231.jpg', 'jpg', 1, 2, 30),
(626279, 'Crock-Pot Sausage and Rice', 'https://spoonacular.com/recipeImages/626279-312x231.jpg', 'jpg', 1, 2, 16),
(626293, 'Chinese Almond Dessert', 'https://spoonacular.com/recipeImages/626293-312x231.jpg', 'jpg', 1, 2, 40),
(626988, 'Portuguese Sweet Rice', 'https://spoonacular.com/recipeImages/626988-312x231.jpg', 'jpg', 1, 2, 145),
(627173, 'Barbecue Grilled Chicken Sandwich', 'https://spoonacular.com/recipeImages/627173-312x231.jpg', 'jpg', 4, 3, 3),
(627376, 'Fast Rice Pudding', 'https://spoonacular.com/recipeImages/627376-312x231.jpg', 'jpg', 1, 2, 154),
(627928, 'Chinese Spinach Soup With Wolfberries And Garlic', 'https://spoonacular.com/recipeImages/627928-312x231.jpg', 'jpg', 2, 2, 33),
(629590, 'Spam Musubi', 'https://spoonacular.com/recipeImages/629590-312x231.jpg', 'jpg', 1, 2, 8),
(629916, 'Chipotle Cilantro-Lime Rice {Copycat }', 'https://spoonacular.com/recipeImages/629916-312x231.jpg', 'jpg', 1, 2, 1680),
(635679, 'Borani Esfanaaj', 'https://spoonacular.com/recipeImages/635679-312x231.jpg', 'jpg', 2, 2, 1),
(649183, 'Lamb and Fresh Goat Cheese Roulade', 'https://spoonacular.com/recipeImages/649183-312x231.jpg', 'jpg', 2, 2, 74),
(659316, 'Saucy Shredded Barbecue Chicken', 'https://spoonacular.com/recipeImages/659316-312x231.jpg', 'jpg', 1, 2, 1),
(666035, 'idli -soft idli , how to make idli', 'https://spoonacular.com/recipeImages/666035-312x231.jpg', 'jpg', 1, 2, 19),
(666102, 'Broiled Salmon with Spiced Baharat Butter', 'https://spoonacular.com/recipeImages/666102-312x231.jpg', 'jpg', 1, 2, 1135),
(667523, 'Divine Salmon--baked Or Grilled', 'https://spoonacular.com/recipeImages/667523-312x231.jpg', 'jpg', 1, 2, 1),
(672038, 'Ultimate BBQ Chicken Burger', 'https://spoonacular.com/recipeImages/672038-312x231.jpg', 'jpg', 4, 3, 38),
(674730, 'Perfect Party Appetizer: How to Make Mini Cheeseburgers', 'https://spoonacular.com/recipeImages/674730-312x231.jpg', 'jpg', 4, 4, 235),
(675793, 'Egg in a Hole Burger', 'https://spoonacular.com/recipeImages/675793-312x231.jpg', 'jpg', 4, 5, 381),
(689423, 'Salmon with Brown Butter Sauce', 'https://spoonacular.com/recipeImages/689423-312x231.jpg', 'jpg', 1, 2, 6),
(697154, 'Sesame-Seasoned Spinach', 'https://spoonacular.com/recipeImages/697154-312x231.jpg', 'jpg', 2, 1, 2499),
(697239, 'Dressed-Up Rice', 'https://spoonacular.com/recipeImages/697239-312x231.jpg', 'jpg', 1, 2, 1),
(697427, 'Fillet of Sole with Spinach & Tomatoes', 'https://spoonacular.com/recipeImages/697427-312x231.jpg', 'jpg', 2, 2, 90),
(698534, 'Rice Pilaf', 'https://spoonacular.com/recipeImages/698534-312x231.jpg', 'jpg', 1, 2, 26),
(706409, 'Classic Bacon Cheeseburger Sliders', 'https://spoonacular.com/recipeImages/706409-312x231.jpg', 'jpg', 4, 4, 0),
(714210, 'Mushroom Spinach and Swiss French Bread Pizzas', 'https://spoonacular.com/recipeImages/714210-312x231.jpg', 'jpg', 2, 2, 1257),
(721493, 'Ranch Fried Chicken Tenders', 'https://spoonacular.com/recipeImages/721493-312x231.jpg', 'jpg', 1, 2, 361),
(721669, 'Barbecue teriyake salmon by Nick Nairn', 'https://spoonacular.com/recipeImages/721669-312x231.jpg', 'jpg', 1, 2, 2),
(748258, 'Maple-Glazed Salmon', 'https://spoonacular.com/recipeImages/748258-312x231.jpeg', 'jpeg', 1, 2, 1203),
(763787, 'Lemongrass Coconut Rice', 'https://spoonacular.com/recipeImages/763787-312x231.jpg', 'jpg', 1, 2, 106),
(767720, 'Spinach, Bacon and Goat Cheese Squash', 'https://spoonacular.com/recipeImages/767720-312x231.jpg', 'jpg', 2, 2, 0),
(780749, '6-Ingredient Wild Salmon Fillets', 'https://spoonacular.com/recipeImages/780749-312x231.jpg', 'jpg', 1, 2, 18),
(789690, 'Dark Chocolate Cheesecake Dip', 'https://spoonacular.com/recipeImages/789690-312x231.jpg', 'jpg', 1, 2, 79),
(791491, 'Grilled Chicken Wings with Tamarind Chipotle Barbecue Sauce', 'https://spoonacular.com/recipeImages/791491-312x231.jpg', 'jpg', 1, 2, 12),
(791968, '(Super-Easy!) Smoked Salmon and Cream Cheese Pastries', 'https://spoonacular.com/recipeImages/791968-312x231.jpg', 'jpg', 1, 2, 64),
(795099, 'Hot Melted Caprese Dip', 'https://spoonacular.com/recipeImages/795099-312x231.jpg', 'jpg', 1, 2, 1390),
(795145, 'VIDEO: Chocolate Peanut Butter Brown Rice Crispy Treats', 'https://spoonacular.com/recipeImages/795145-312x231.png', 'png', 1, 2, 344),
(797352, 'Chicken Caesar Wraps', 'https://spoonacular.com/recipeImages/797352-312x231.jpg', 'jpg', 4, 3, 77),
(801607, 'PB&J Sliders', 'https://spoonacular.com/recipeImages/801607-312x231.jpg', 'jpg', 4, 6, 9),
(801741, 'Jalapeno & Blue Cheese Burger', 'https://spoonacular.com/recipeImages/801741-312x231.jpg', 'jpg', 4, 2, 39),
(803026, 'Gluten Free Grilled Cheese Hummus Sandwich with Pumpkin', 'https://spoonacular.com/recipeImages/803026-312x231.jpg', 'jpg', 2, 3, 39),
(821305, 'Rice Cooker Coconut Rice', 'https://spoonacular.com/recipeImages/821305-312x231.jpg', 'jpg', 1, 2, 0),
(852462, 'Salsa Chicken', 'https://spoonacular.com/recipeImages/852462-312x231.jpg', 'jpg', 1, 2, 27),
(854019, 'Instant Pot Hawaiian Chicken', 'https://spoonacular.com/recipeImages/854019-312x231.jpg', 'jpg', 1, 2, 0),
(857216, 'Brown Butter Chicken with Sage and Prosciutto', 'https://spoonacular.com/recipeImages/857216-312x231.jpg', 'jpg', 1, 2, 8),
(861108, 'Sheet Pan Teriyaki Salmon with Green Beans', 'https://spoonacular.com/recipeImages/861108-312x231.jpg', 'jpg', 1, 2, 0),
(863912, 'Sweet Chili Salmon with Garlic Spinach', 'https://spoonacular.com/recipeImages/863912-312x231.jpg', 'jpg', 2, 2, 0),
(871987, 'Sweet Sriracha Rubbed Salmon Skewers with Coconut Rice', 'https://spoonacular.com/recipeImages/871987-312x231.jpg', 'jpg', 1, 2, 0),
(881036, 'Easy Garlic Spinach Hummus', 'https://spoonacular.com/recipeImages/881036-312x231.jpg', 'jpg', 2, 2, 0),
(887036, 'Trailblazer Burger', 'https://spoonacular.com/recipeImages/887036-312x231.jpg', 'jpg', 4, 5, 1),
(895353, 'Herbed Rice With Tomatoes and Feta', 'https://spoonacular.com/recipeImages/895353-312x231.jpg', 'jpg', 1, 2, 2038),
(909964, 'Bacon Cheeseburger Sliders', 'https://spoonacular.com/recipeImages/909964-312x231.jpg', 'jpg', 4, 4, 0),
(919433, 'The Juiciest Grilled Chicken Breast', 'https://spoonacular.com/recipeImages/919433-312x231.jpg', 'jpg', 1, 2, 0),
(921481, 'Italian BBQ Grilled Chicken', 'https://spoonacular.com/recipeImages/921481-312x231.jpg', 'jpg', 1, 2, 0),
(923940, 'Instant Pot Coconut Rice', 'https://spoonacular.com/recipeImages/923940-312x231.jpg', 'jpg', 1, 2, 0),
(925119, 'Bacon, Onion and Cheese Stuffed Burger', 'https://spoonacular.com/recipeImages/925119-312x231.jpeg', 'jpeg', 4, 4, 23),
(928338, 'Crispy Baked Chicken Wings', 'https://spoonacular.com/recipeImages/928338-312x231.jpg', 'jpg', 1, 1, 0),
(933913, 'Creamy Parmesan Polenta', 'https://spoonacular.com/recipeImages/933913-312x231.jpg', 'jpg', 1, 1, 0),
(933995, 'Simple Basmati Rice', 'https://spoonacular.com/recipeImages/933995-312x231.jpeg', 'jpeg', 1, 0, 135),
(936987, 'Delicate French Omelet', 'https://spoonacular.com/recipeImages/936987-312x231.jpg', 'jpg', 1, 1, 0),
(937023, 'Bacon Brown Sugar Chicken Tenders', 'https://spoonacular.com/recipeImages/937023-312x231.jpg', 'jpg', 1, 1, 1),
(944490, 'Slow Cooker Rotisserie Chicken', 'https://spoonacular.com/recipeImages/944490-312x231.jpg', 'jpg', 1, 1, 246),
(947062, 'Roasted Brussels Sprouts with Asiago', 'https://spoonacular.com/recipeImages/947062-312x231.jpg', 'jpg', 1, 1, 67),
(951694, 'Broiled Thai Sweet Chili Salmon', 'https://spoonacular.com/recipeImages/951694-312x231.jpg', 'jpg', 1, 2, 31),
(953269, 'Parmesan-Roasted Green Beans', 'https://spoonacular.com/recipeImages/953269-312x231.jpg', 'jpg', 1, 1, 44),
(955054, 'Roasted Parmesan Broccoli', 'https://spoonacular.com/recipeImages/955054-312x231.jpg', 'jpg', 1, 1, 42),
(956194, 'Bacon Brown Sugar Chicken Bites', 'https://spoonacular.com/recipeImages/956194-312x231.jpg', 'jpg', 1, 1, 215),
(958884, 'Garlic Sauteed Spinach', 'https://spoonacular.com/recipeImages/958884-312x231.jpg', 'jpg', 2, 2, 521),
(960251, 'Broiled Thai Sweet Chili Salmon', 'https://spoonacular.com/recipeImages/960251-312x231.jpg', 'jpg', 1, 2, 1),
(962037, 'Instant Pot Brown Rice', 'https://spoonacular.com/recipeImages/962037-312x231.jpg', 'jpg', 1, 0, 7),
(962602, 'Coconut Rice', 'https://spoonacular.com/recipeImages/962602-312x231.jpg', 'jpg', 1, 1, 57),
(963814, 'The Best Baked Chicken Breast', 'https://spoonacular.com/recipeImages/963814-312x231.jpg', 'jpg', 1, 1, 77),
(964344, 'Southern Fried Chicken', 'https://spoonacular.com/recipeImages/964344-312x231.jpg', 'jpg', 1, 1, 110),
(969423, 'Beer Braised Chicken', 'https://spoonacular.com/recipeImages/969423-312x231.jpg', 'jpg', 1, 1, 211),
(969668, 'How to Cook Frozen Chicken Breasts in the Instant Pot', 'https://spoonacular.com/recipeImages/969668-312x231.jpg', 'jpg', 1, 1, 109),
(970626, 'Edamame Noodles with Salmon', 'https://spoonacular.com/recipeImages/970626-312x231.jpg', 'jpg', 1, 1, 1),
(970867, 'Sweet Fermented Rice (??, Jiu Niang)', 'https://spoonacular.com/recipeImages/970867-312x231.jpg', 'jpg', 1, 1, 23),
(972917, 'Instant Pot Salmon (Fresh or Frozen)', 'https://spoonacular.com/recipeImages/972917-312x231.jpg', 'jpg', 1, 0, 39),
(974461, 'Brown Sugar Italian Chicken', 'https://spoonacular.com/recipeImages/974461-312x231.jpg', 'jpg', 1, 1, 323),
(978723, 'Easy Crusty Asiago Bread', 'https://spoonacular.com/recipeImages/978723-312x231.jpg', 'jpg', 1, 1, 204),
(980745, 'Navajo Tacos', 'https://spoonacular.com/recipeImages/980745-312x231.jpg', 'jpg', 1, 1, 1538),
(980789, 'One Hour Rosemary Focaccia Bread', 'https://spoonacular.com/recipeImages/980789-312x231.jpg', 'jpg', 1, 1, 698),
(981808, 'Instant Pot Orange Chicken', 'https://spoonacular.com/recipeImages/981808-312x231.jpg', 'jpg', 1, 1, 5),
(983256, 'Chicken Adobo', 'https://spoonacular.com/recipeImages/983256-312x231.jpg', 'jpg', 1, 2, 100),
(983395, 'Beer Can Chicken', 'https://spoonacular.com/recipeImages/983395-312x231.jpeg', 'jpeg', 1, 2, 10),
(986153, 'Korean Fried Chicken', 'https://spoonacular.com/recipeImages/986153-312x231.jpg', 'jpg', 1, 0, 209),
(986172, 'Fried Chicken', 'https://spoonacular.com/recipeImages/986172-312x231.jpg', 'jpg', 1, 1, 499),
(987181, 'Honey Cheddar Scones', 'https://spoonacular.com/recipeImages/987181-312x231.jpg', 'jpg', 1, 1, 164),
(988787, 'Crispy Baked Salt and Pepper Chicken Wings', 'https://spoonacular.com/recipeImages/988787-312x231.jpg', 'jpg', 1, 1, 108),
(989531, 'Baked Asparagus with Parmesan', 'https://spoonacular.com/recipeImages/989531-312x231.jpg', 'jpg', 1, 1, 216),
(989736, 'Oven Roasted Chicken Legs', 'https://spoonacular.com/recipeImages/989736-312x231.jpg', 'jpg', 1, 1, 3682),
(991414, 'Parmesan Roasted Carrot Fries', 'https://spoonacular.com/recipeImages/991414-312x231.jpg', 'jpg', 1, 1, 220),
(991497, 'The Best Grilled Chicken Breast', 'https://spoonacular.com/recipeImages/991497-312x231.jpg', 'jpg', 1, 1, 38),
(993356, 'Roasted Asparagus with Mozzarella', 'https://spoonacular.com/recipeImages/993356-312x231.jpg', 'jpg', 1, 1, 529),
(996532, 'Einkorn Deep-Dish Focaccia Bread', 'https://spoonacular.com/recipeImages/996532-312x231.jpg', 'jpg', 1, 1, 1),
(996818, 'Roasted Broccoli with Parmesan', 'https://spoonacular.com/recipeImages/996818-312x231.jpeg', 'jpeg', 1, 1, 105),
(997170, 'Perfect Rice in a Rush', 'https://spoonacular.com/recipeImages/997170-312x231.jpeg', 'jpeg', 1, 1, 3),
(1001735, 'Carrot Top Pesto', 'https://spoonacular.com/recipeImages/1001735-312x231.jpg', 'jpg', 2, 2, 51),
(1004844, 'Crispy Air Fryer Chicken Tenders', 'https://spoonacular.com/recipeImages/1004844-312x231.jpeg', 'jpeg', 1, 1, 13),
(1009580, 'How to Make Shredded Chicken in the Instant Pot', 'https://spoonacular.com/recipeImages/1009580-312x231.png', 'png', 1, 0, 1),
(1009908, 'Instant Pot Chicken Breast', 'https://spoonacular.com/recipeImages/1009908-312x231.png', 'png', 1, 1, 64),
(1012651, 'Instant Pot Jasmine Rice - Rachel Cooks', 'https://spoonacular.com/recipeImages/1012651-312x231.jpg', 'jpg', 1, 0, 36),
(1013083, 'Perfect Instant Pot Chicken Breasts (Fresh or Frozen!)', 'https://spoonacular.com/recipeImages/1013083-312x231.jpg', 'jpg', 1, 0, 25),
(1013523, '4 Ingredient Grilled Pepper Chicken', 'https://spoonacular.com/recipeImages/1013523-312x231.jpg', 'jpg', 1, 0, 12),
(1016387, 'Crispy Skin Salmon', 'https://spoonacular.com/recipeImages/1016387-312x231.jpg', 'jpg', 1, 0, 1),
(1017068, 'How to Grill Salmon in Foil', 'https://spoonacular.com/recipeImages/1017068-312x231.jpg', 'jpg', 1, 2, 1),
(1021030, 'Roasted Pesto Salmon', 'https://spoonacular.com/recipeImages/1021030-312x231.jpg', 'jpg', 1, 1, 1),
(1022983, 'Chivito (Uruguayan Steak and Egg Sandwich)', 'https://spoonacular.com/recipeImages/1022983-312x231.jpg', 'jpg', 4, 5, 1),
(1026907, 'Chicken Bone Broth', 'https://spoonacular.com/recipeImages/1026907-312x231.jpg', 'jpg', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` mediumint(9) NOT NULL,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(40) NOT NULL,
  `user_email` varchar(30) NOT NULL,
  `user_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_status`) VALUES
(0, '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `recipes`
--
ALTER TABLE `recipes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`title`,`image`,`imageType`),
  ADD UNIQUE KEY `id_2` (`id`,`title`,`image`,`imageType`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
