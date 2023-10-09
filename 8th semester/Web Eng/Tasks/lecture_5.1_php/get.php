<?php
if (isset($_GET['name']) && isset($_GET['email'])) {
    $name = $_GET['name'];
    echo "Welcome Mr. " . $name . "<br>";
    echo "Your Email address is: " . $_GET['email'];
    exit();
} 
?>

<html>
    <head>
        <title>Task01</title>
    </head>
    <body>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="GET">
            Name: <input type="text" name="name">
            E-mail: <input type="text" name="email">
            <input type="submit">
        </form>
    </body>
</html>
