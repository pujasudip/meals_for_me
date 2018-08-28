SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";

-- /*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT* /;
-- /*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS* /;
-- /*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION* /;
-- /*!40101 SET NAMES utf8mb4* /;


DROP TABLE IF EXISTS `favorites`;
CREATE TABLE `favorites` (
 `favorite_id` mediumint(9) NOT NULL,
 `recipe_id` mediumint(9) NOT NULL,
 `user_id` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `ingredients`;
CREATE TABLE `ingredients` (
 `ingredient_ID` mediumint(9) NOT NULL,
 `ingredient_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `recipes`;
CREATE TABLE `recipes` (
 `recipe_id` mediumint(9) NOT NULL,
 `recipe_name` varchar(30) NOT NULL,
 `recipe_img` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `recipe_ingredients`;
CREATE TABLE `recipe_ingredients` (
 `recipe_ingredient_id` mediumint(9) NOT NULL,
 `recipe_id` mediumint(9) NOT NULL,
 `ingredient_id` mediumint(9) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
 `user_id` mediumint(9) NOT NULL,
 `user_name` varchar(20) NOT NULL,
 `user_password` varchar(40) NOT NULL,
 `user_email` varchar(30) NOT NULL,
 `user_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `users` (`user_id`, `user_name`, `user_password`, `user_email`, `user_status`) VALUES
(0, '', 'da39a3ee5e6b4b0d3255bfef95601890afd80709', '', '');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT* /;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS* /;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION* /;