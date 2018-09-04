<?php

//security measure to make sure the submit button was clicked
    if(isset($_POST['submit'])){
        include_once 'mysqliconnect.php';
        //obtain the information that was sent
        $firstName = mysqli_real_escape_string($conn, $_POST['first']);
        $lastName = mysqli_real_escape_string($conn, $_POST['lastName']);
        $username = mysqli_real_escape_string($conn, $_POST['username']);
        $email = mysqli_real_escape_string($conn, $_POST['email']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);
        //make sure everything was filled out
        if(empty($firstName) || empty($lastName) || empty($username) || empty($email) || empty($password)){
            //will pass along an error message if a field is empty
            header("signup=empty")//"Locattion: ../signup.php?
            exit();
        }else{
            //checking if the name is valid if so return user to signup with error message
            if (!preg_match("/^[a-zA-Z]*$/",$firstName) || !preg_match("/^[a-zA-Z]*$/",$lastName)){
                header("invalidname")//"Location: ../sign_up.js?signup
                exit();
            }else{
                //checking if email is valid if so return user to signup with error message invalid email
                if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
                    header("invalidemail")//Location: ../sign_up.js?signup=
                    exit();
                }else{
                    //checking if username is taken if it does return user to signup page with error username taken
                    $query = "SELECT * FROM `users` WHERE `user_name`=$username";
                    $result = mysqli_query($conn, $query);
                    $queryResult = mysqli_num_rows($result);
                    if($queryResult > 0){
                        header("usernametaken")//Location: ../sign_up.js?signup=
                        exit();
                    }else{
                        //encrypt password then insert user into database
                        $hidePassword = password_hash($password, PASSWORD_BCRYPT);
                        $query = "INSERT INTO `users` (`user_firstname`,`user_lastname`,`user_username`,`user_email`,`user_password`) VALUES ('$firsname','$lastName','$username','$email','$hidePassword');";
                        $result = mysqli_query($conn , $query);
                        header("success")//Location: ../sign_up.js?signup=
                    }
                }
            }
        }

    }else{
        // if they wrote address in the url send them back to the sign up page
        header("Locattion: ../sign_up.js")
        exit();
    }




?>