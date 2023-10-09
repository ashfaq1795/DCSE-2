<?php
 if(!empty($_GET['checklist'])){
    echo 'You selected the following languages: <br>';
    foreach($_GET['checklist'] as $selected){
        echo $selected.'<br>';
    } 
    exit();
 } 
?>
