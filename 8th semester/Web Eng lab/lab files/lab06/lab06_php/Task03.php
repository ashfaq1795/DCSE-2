<?php
session_start();
$validusername='Ashfaq';
$validpassword='12345';

if(isset($_POST['login'])){
    $username=$_POST['username'];
    $password=$_POST['password'];

    if($username ===  $validusername && $password === $validpassword){
        $_SESSION['loggedIn']=true;
        $_SESSION['username']=$username;

        header('Location: dashboard.php');
    }else {
        $error= 'Invalid Username or Password.';
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page</title>
</head>
<body>
    <h3>Login</h3>
    <?php if(isset($error)) : ?>
    <p><?php echo 'Error: '. $error; ?> </p>
    <?php endif; ?>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>"  method="post">
    <label for="username">Username: </label>
    <input type="text" name='username'> <br><br>
    <label for="password">Password: </label>
    <input type="text" name='password'><br><br>
    <input type="submit" name='login'>
    </form>
</body>
</html>
