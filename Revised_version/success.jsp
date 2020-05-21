<html>

  <head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
    .suc{

      margin-top: 350px;
      margin-left: 600px;
      width: 250px;
  padding: 25px;
  box-sizing: border-box;
  background-color: #71DF57;
  color:  white;
  border-radius: 20px;
    }

    body
    {
    background-color: #E9F3E7;
    }

      </style>
  </head>

  <body>
    <div class="header">
      <a href="#default" class="logo">Agro Grocer</a>
      
  <div class="header-right">
    <a class="active" href="DataListPage.jsp">Home</a>
    <a href="UserDataList" method="post">User</a>
    <a href="CartDataList">Cart </a>
    <a href="#about">Contact</a>
    <a href="LoginPage.jsp"> Log out </a>
  </div>
  </div>
  <div class="suc">
    <h2>ordered sucessfully<h2>
    </div>

    <%-- <button onClick="summa()"> click me</button> --%>
  </body>
</html>
