<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>login page</title>
    <style>
        .container {
            width: 300px;
            padding: 10px;
            margin: 20px auto;
            border: 1px solid #f5efef;
            border-radius: 5px;
            background-color: rgb(230, 225, 225);   
        }
        label {
            font-weight:bold;
        }
        input {
            padding: 8px;
            border-radius: 5px;
            margin-bottom: 5px;
            width: 280px;
        }
        button {
            padding: 8px;
            margin-top: 8px;
            margin-bottom: 10px;
            border-radius: 5px;
            background-color: #4CAF50; 
            color: white;
            font-weight: bold;
            border: none;
            cursor: pointer;
            width: 300px;
        }
        button:hover {
            background-color: #318f36;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <p>Doesn't have an account yet? <a href="#">Sign Up</a></p>
        <form action="Registration_php.php" method="post">
            <label for="regid"> Student ID</label><br>
            <input type="text" placeholder="Student ID" name="regid">
            <br>
            <label for="firstname">First Name</label><br>
            <input type="text" placeholder="First name:" name="firstname">
            <br>
            <label for="lastname">Last Name</label><br>
            <input type="text" placeholder="Last name:" name="lastname">
            <br>
            <label for="email">Email</label><br>
            <input type="text" placeholder="asd@gmail.com" name="email">
            <br>
            <label for="phone">Phone Number</label><br>
            <input type="text" placeholder="034xxxxxxxx" name="phone">
            <br>
            <div style='width:420px; display: flex; flex-direction: row; justify-content: space-between;'>
            <label for="password">Password</label>
            <input type="checkbox" name="show"  onclick="showPassword()">
            </div>
            <input type="password" placeholder="******" name="password" id="password">
            <br>

            <button>Login</button>
        </form>
    </div>


    <script>
        function showPassword(){
            let password=document.getElementById('password');
            if(password.type==='password'){
                password.type='text';
            } else {
                password.type='password';
            }
        }
    </script>
</body>
</html>
