<html>
    <head>
        <title>
            update user passwords
        </title>
        <link href="https://fonts.googleapis.com/css?family=Montserrat:600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
        <script>
            function checkPassword(form)
            {
                password1 = form.password.value;
                password2 = form.confirmpassword.value;
                if(password1 == ' ')
                    alert ("Please enter the password");
                else if (password2 == ' ')
                    alert ("Please enter confirm password");
                else if( password1 != password2)
                {
                    alert("\n Password did not match: please try again...");
                    document.getElementById("password").value = '';
                    form.confirmpassword.value = '';
                    return false;
                }
                else
                {
                    alert("Password is updated");
                    return true;
                }
            }
        </script>
        <style>
            .header {
            overflow: hidden;
            /*background-color:#71DF57;*/
            background-image: linear-gradient(#40ED40, #8BF48B);
            padding: 20px 10px;
            }

            .header a {
            float: left;
            color: grey;
            text-align: center;
            padding: 12px;
            text-decoration: none;
            font-size: 18px;
            line-height: 25px;
            border-radius: 4px;
            font-family: 'Roboto', sans-serif;
            }

            .header a.logo {
            font-size: 30px;
            font-weight: bold;
            letter-spacing: 2.5px;
            color: white;
            font-family: 'Roboto', sans-serif;
            }
            .alignment
            {
                text-align: center;
                margin-top: 100px;
            }
            input[type = submit]:hover
            {
            background-color: #D5984E;
            box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
            color: #fff;
            transition: 0.5s;
            transform: translateY(-7px);
            }
            input[type = submit]
            {
            width: 150px;
            height: 50px;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
            letter-spacing: 2.5px;
            font-weight: 500;
            font-family: 'Roboto', sans-serif;
            /*background-image: linear-gradient(#41D21D,#33A218);*/
            background-color:#F89D30;
            border-radius: 25px;
            border-style: none;
            text-align: center;
            line-height: 1px;
            font-size: 15px;
            color: white;
            }
            span
            {
                font-size: 15px;
                font-family: 'Open Sans', sans-serif;
                display: inline-block;
                float: left;
                clear: left;
                width: 250px;
                text-align: right;

            }
            .inputAlign
            {
            display: inline-block;
            float: left;
            border-style: none;
            border-bottom: 1px solid black;
            margin-left: 10px;
            }
            .inputAlign:focus
            {
            outline: none;
            }
            .dataAlign
            {
            margin-left: 400px;
            }
        </style>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">Agro Grocer</a>
        </div>
        <div class="alignment">
        <form action="UpdateUserCredentials" method="post" onsubmit="return checkPassword(this)">
            <div class="dataAlign">
            <span>Enter email id :</span>
            <input type="text" name="emailid" id="emailid" class="inputAlign">
            <br><br>
            <span>Enter the new password :</span>
            <input type="password" name="password" id="password" class="inputAlign">
            <br><br>
            <span>Confirm password :</span>
            <input type="password" name="confirmpassword" id="confirmpassword" class="inputAlign">
            <br><br>
            </div>
            <input type="submit" value="Update" name="update" id="update" >
        </form>
        </div>
    </body>
</html>