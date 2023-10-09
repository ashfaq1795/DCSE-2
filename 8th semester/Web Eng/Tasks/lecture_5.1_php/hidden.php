<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    echo "The Data you provided are: <br>";
    echo "Your name is ".$_POST['fname']. "<br>";
    echo "Your Email Id is ".$_POST['email']. "<br>";
    echo "Your Hidden name is ".$_POST['hname'];
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        Name: <input type="text" name="fname"><br>
        Email: <input type="text" name="email"><br>
        <input type="hidden" name="hname" value="Sara"><br>
        <input type="submit">
    </form>
</body>
</html>
