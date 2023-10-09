<?php
    foreach ($_POST['color'] as $selected) {
        if($selected=='none'){
            echo 'You have not select any your favorate color.';
        } else{
        echo 'Your Favorate color is '.$selected;
    }
}
?>