<?php
if(isset($_GET['gender'])){
    echo "You Selected Gender: ". $_GET['gender'];
    exit();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Radio</title>
</head>
<body>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="get">
    Please Select Your Gender:<br>
    <input type="radio" name="gender" value="Male">Male <br>
    <input type="radio" name="gender" value="Female">Female <br>
    <input type="submit">
    </form>
</body>
</html>