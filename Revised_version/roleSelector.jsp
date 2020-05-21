<html>
  <head>
    <title>
      Role Selector
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <link href="https://fonts.googleapis.com/css?family=Montserrat:600&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Open+Sans&display=swap" rel="stylesheet">
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
          .header a:hover {
            background-color: #ddd;
            color: grey;
          }

          .header a.active {
            /*background-color: dodgerblue;*/
            color: grey;
          }

          .header-right {
            float: right;
          }

          @media screen and (max-width: 500px) {
            .header a {
              float: none;
              display: block;
              text-align: left;
            }

            .header-right {
              float: none;
            }
          }
          img
          {
            margin-top: 150px;
            margin-left: 310px;
          }
          #mycontainer
          {
            /* text-align:center; */
            margin-top: 40px;
            margin-left: 300px;
          }
          form
          {
            display:inline-block;
          }
          .buttonbuy
          {
            margin-left: 270px;
            width: 240px;
    				height: 50px;
    				box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.3);
    				letter-spacing: 2.5px;
    				font-weight: 500;
    				font-family: 'Roboto', sans-serif;
    				/*background-image: linear-gradient(#41D21D,#33A218);*/
    				background-color:#71DF57;
    				border-radius: 25px;
    				border-style: none;
    				text-align: center;
    				line-height: 1px;
    				padding: 0px;
    				color: white;
            font-size: 20px;
          }
          .buttonsell
          {
            margin-left: 0px;
            width: 240px;
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
    				padding: 0px;
    				color: white;
            font-size: 20px;
          }
          .buttonbuy:hover
          {
            background-color: #2EE59D;
            box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
            color: #fff;
            transition: 0.5s;
            transform: translateY(-7px);
          }
          .buttonsell:hover
          {
            background-color: #D5984E;
            box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
            color: #fff;
            transition: 0.5s;
            transform: translateY(-7px);
          }
          .sellImage
          {
            border-radius: 50%;
          }
          </style>
  </head>
  <body>
    <div class="header">
      <a href="#default" class="logo">Agro Grocer</a>
      <%-- <input type="text" id="myFilter" class="form-control" onkeyup="myFunction()" placeholder="Search for names.."> --%>
  <div class="header-right">
    <a href="#about">Contact</a>
    <a href="LoginPage.jsp"> Log out </a>
  </div>
  </div>

  <img src="images/seller.jpeg" alt="seller" height="200px" width="200px" class="sellImage">
    <img src ="images/consumer.jpeg" alt="buyer" height="200px" width="200px">
      <br><br>
      <div id="mycontainer">
      <form action="RoleSelector" method="post" class="outer">
        <input type="submit" value="Sell" name="sell" class="buttonsell" id="hoverButton">
          <input type="hidden" value="sell" name="role" >
      </form>
      <form action="RoleSelector" method="post" class="outer">
        <input type="submit" value="Buy" name="buy" class="buttonbuy" id="hoverButton">
          <input type="hidden" value="buy" name="role">
      </form>
    </div>
  </body>
</html>
