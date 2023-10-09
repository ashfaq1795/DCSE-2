<?php
if (isset($_POST['name']) || isset($_POST['email'])) {
    $name = $_POST['name'];
    echo "Welcome Mr. " . $name . "<br>";
    echo "Your Email address is: " . $_POST['email'];
    exit();
} 
?>

<html>
    <head>
        <title>Task01</title>
    </head>
    <body>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
            Name: <input type="text" name="name">
            E-mail: <input type="text" name="email">
            <input type="submit">
        </form>
    </body>
</html>
