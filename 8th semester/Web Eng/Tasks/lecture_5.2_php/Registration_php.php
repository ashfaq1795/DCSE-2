<?php
$studentid = $_POST['regid'];
$firstname = $_POST['firstname'];
$lastname = $_POST['lastname'];
$email = $_POST['email'];
$phone = $_POST['phone'];
$password=$_POST['password'];

$connect = new  mysqli('localhost', 'root', '12345', 'Registration');
//Registration is a database.
if (!$connect) {
    die('Connection failed: ' . mysqli_connect_error());
} 

$db_selected=mysqli_select_db($connect,'Registration');
if(!$db_selected){
    die('Database selection failed. '. mysqli_error($connect));
}
$sql = "INSERT INTO student (studentID, firstName, lastName, email, phoneNo,password) VALUES ('$studentid', '$firstname', '$lastname', '$email', '$phone','$password')";

if (mysqli_query($connect,$sql)){
    echo 'Data inserted successfully...';
} else {
    echo "Error: ". mysql_error($connect);
}

mysqli_close($connect);
 
?>
