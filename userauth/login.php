<?php
session_start();
if(isset($_POST['submit'])){
    include_once 'mysqliconnect.php';
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $userPassword = mysqli_real_escape_string($conn, $_POST['password']);

    //check if inputs are empty
    if(empty($username) || empty($userPassword)){
        header("login=error");
        exit();
    }else{
        //create query and query the database with info given to us and does some error checking
        $query = "SELECT * FROM `users` WHERE `user_username`=`$username` OR `user_email`=$username";
        $result = mysqli_query($conn, $query);
        $queryCheck = mysqli_num_rows($result);
        if($queryCheck < 1){
            header("login=error");
            exit();
        }else{
            //grabs data returned after the query and stores it into an array
            if($row = mysqli_fetch_assoc($result)){
                $passwordCheck = password_verify($userPassword, $row['user_password']);
                //checking if password check will return a true or false statement , elseif to make sure we got returned a truth value and not some other value
                if($passwordCheck === false){
                    header("login=error");
                    exit();
                }elseif ($passwordCheck === true){
                    //gonna log in the user , grab the data and from sessions and store that.
                    $_SESSION['user_username']=$row['user_username'];
                    $_SESSION['user_firstName']=$row['user_firstName'];
                    $_SESSION['user_lastName']=$row['user_lastName'];
                    $_SESSION['user_email']=$row['user_email'];
                    $_SESSION['user_id']=$row['user_id'];
                    header("login=success")//Location: ../
                    exit();

                }
            }
        }
    }
}else{
    header("login=error");
    exit();
}
