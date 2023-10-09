<?php
// Set cookies
if(isset($_POST['submit'])) {  //this block will execute when clicked on submit button.
    $firstName = $_POST['firstName'];
    $location = $_POST['location'];

    // Set cookies to expire in 1 hour
    setcookie('firstName', $firstName, time() + 3600,"/");
    setcookie('location', $location, time() + 3600,"/");

    //Disply data stored in cookies 
    echo '<h2>Remembering User\'s information with Cookies.<h2>';
    echo "<h3>HI ". $_COOKIE['firstName']. ". What's going on in ". $_COOKIE['location']. '</h3>';
    '<br><br><br>';
    echo '<a href="?remove=true">Forget about me</a>';
    exit();
}


// Delete cookies
if(isset($_GET['remove'])) {  //will execute when clicked on forget about me.  
    setcookie('firstName', '', time() - 3600);
    setcookie('location', '', time() - 3600); 
    echo 'Cookies deleted successfully!';
    exit();
}
?>

