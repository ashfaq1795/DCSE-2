<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery selection</title>
    <style>
        .container>img{
            width:200px;
            height: 200px;
            margin: 10px;
            border: 1px solid brown;
        }
    </style>
</head> 
<body>
    <h2>Victoria's Food photo Gallery</h2>
    <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post">
        <select name="food">
            <option value="none">None</option>
            <option value="deserts">deserts</option>
            <option value="fruit">fruit</option>
            <option value="healthy">healthy</option>
        </select>
        <input type="submit" name="submit">
    </form>

<div class="container">
    <?php
        if(isset($_POST['food'])){
            $category=$_POST['food'];
            $foodarray = [
                'deserts' => [
                    'https://images.immediate.co.uk/production/volatile/sites/2/2018/05/Olive_3WaysSemifreddo-7bff59b.jpg?quality=90',
                    'https://i0.wp.com/evanandkatelyn.com/wp-content/uploads/2015/01/Reception-69-700x466.jpg?resize=700%2C466',
                    'https://media.istockphoto.com/id/497959594/photo/fresh-cakes.jpg?s=612x612&w=0&k=20&c=T1vp7QPbg6BY3GE-qwg-i_SqVpstyHBMIwnGakdTTek='
                ],
                'fruit' => [
                    'https://hips.hearstapps.com/hmg-prod/images/assortment-of-colorful-ripe-tropical-fruits-top-royalty-free-image-995518546-1564092355.jpg',
                    'https://images.immediate.co.uk/production/volatile/sites/30/2023/02/Bowl-of-fruit-5155e6f.jpg',
                    'https://www.realsimple.com/thmb/762HJU1apQC6n0YeE5fnDeVXQ7s=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/healthiest-fruits-to-eat-GettyImages-1341556585-19ff7496ef744022b77011b8dc369d3f.jpg'
                ],
                'healthy' => [
                    'https://cdn.shopify.com/s/files/1/1055/2210/articles/Healthy-Eating-Tips.jpg?v=1674535125',
                    'https://post.healthline.com/wp-content/uploads/2020/09/healthy-eating-ingredients-732x549-thumbnail-732x549.jpg',
                    'https://www.eatingwell.com/thmb/088YHsNmHkUQ7iNGP4375MiAXOY=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/article_7866255_foods-you-should-eat-every-week-to-lose-weight_-04-d58e9c481bce4a29b47295baade4072d.jpg'
                ]
            ];      
        if(array_key_exists($category,$foodarray)){
            $images=$foodarray[$category];
            foreach ($images as $image) {
                echo "<img src=\"$image\">";
            }
        } else {
            echo '<br>No images found for selected catagory.';
        }
    }
    ?>
</div>


</body>
</html>