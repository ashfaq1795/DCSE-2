<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>select</title>
</head>
<body>
    <form action="selectphp.php" method='post'>
        <p>Select Your favourate Color. <br></p>
        <select name="color[]">
            <option value="none"></option>
            <option value="Blue">Blue</option>
            <option value="Green">Green</option>
            <option value="Red">Red</option>
            <option value="White">White</option>
        </select>
        <input type="submit">
    </form>
</body>
</html>