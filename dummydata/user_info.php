<?php

session_start();

header("Access-Control-Allow-Origin: *");

$users = [
    [
        'username'=>'leah',
        'password'=>'abc'
    ]
];


$data = [
    'success'=>false,
];

$total_users = count($users);

$username = $_POST['username'];
$password = $_POST['password'];

if(!empty($_SESSION['username'])){
    $data['success'] = true;
    $data['login_status'] = true;
    $output = json_encode($data);
} else {
    for($i = 0; $i < $total_users; $i++){
        if($users[$i]['username'] === $username && $users[$i]['password'] === $password){
            $_SESSION['username'] = $username;
            $data['username'] = $username;
            $data['success'] = true;
        }
    }
}

$output = json_encode($data);

print_r($output);

//
//if($_POST['logout']){
//    $params = session_get_cookie_params();
//    setcookie(session_name(), '', 0, $params['path'], $params['domain'], $params['secure'], isset($params['httponly']));
//    session_destroy();
//    print('logged out');
//    die();
//}


//

//
////print_r($output);
//
//print_r($output);