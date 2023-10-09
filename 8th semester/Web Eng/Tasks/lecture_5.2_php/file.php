<?php 
    if(isset($_FILES['pic'])) {
        echo 'The name of the uploaded file is: '. $_FILES['pic']['name']. '<br>';
        echo 'The type of the uploaded file is: '. $_FILES['pic']['type']. '<br>';
        echo 'The size of the uploaded file is: '. $_FILES['pic']['size']. '<br>';
        echo 'The temprary name of the uploaded file is: '. $_FILES['pic']['tmp_name']. '<br>';
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
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data">
    <p>Chose your file:</p>
    <input type="file" name="pic">
    <br>
    <input type="submit">
</form>
</body>
</html>

    