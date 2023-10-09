
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checklist</title>
</head>
<body>
    <form action="checklst.php" method='get'>
        <p>Which of the following languages do you know?</p>
        <input type="checkbox" name='checklist[]' value='C'>C <br>
        <input type="checkbox" name='checklist[]' value='C++'>C++ <br>
        <input type="checkbox" name='checklist[]' value='JavaScript'>JavaScript <br>
        <input type="checkbox" name='checklist[]' value='Python'>Python <br>
        <input type="submit">
    </form>
</body>
</html>