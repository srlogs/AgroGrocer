<html>
    <head>
        <title>
            Request emailid
        </title>
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
            .button:hover
    {
      background-color: #D5984E;
      box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
      color: #fff;
      transition: 0.5s;
      transform: translateY(-7px);
    }
    .button
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

        </style>
        <script src="https://smtpjs.com/v3/smtp.js"></script>  
        <script type="text/javascript">
            function sendEmail() {
                var useremail = document.getElementById("emailid").value;
                Email.send({
                    Host: "smtp.gmail.com",
                    Username : "logeshwaran.sr1@gmail.com",
                    Password : "Logiwaran1999!",
                    To : useremail,
                    From : "logeshwaran.sr1@gmail.com",
                    Subject : "Reset user password",
                    Body : "http://localhost:8080/AgroGrocer/updatePassword.jsp",
                })
                .then(function(message){
                    alert("mail sent successfully")
                });
            }
        </script>
    </head>
    <body>
        <div class="header">
            <a href="#default" class="logo">Agro Grocer</a>
        </div>
        <div class="alignment">
        <label> Enter your email id :</label>
        <input type="text" name="emailid" id="emailid">
        <br><br><br>
        <form method="post">
            <input type="button" class="button" value="Send Email" onclick="sendEmail()"/>
        </form> 
        </div>
    </body>
</html>