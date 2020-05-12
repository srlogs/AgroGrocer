<html>
  <head>
    <title>
      picture
    </title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <%-- <script type="text/javascript">
      window.onload = function()
      {
        var x = sessionStorage.getItem("source");
        document.getElementById("myImg").src = x;
        sessionStorage.clear();
      }
    </script> --%>
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
    .imageAlign
    {
      text-align: center;
      margin-top: 50px;
    }
    .button
    {
      margin-left: 630px;
    }
    .buttonAlign
    {
      margin-top: 20px;
      margin-bottom: 20px;
      width: 150px;
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
      font-size: 15px;
    }
    .buttonAlign:hover{
      background-color: #2EE59D;
      box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
      color: #fff;
      transition: 0.5s;
      transform: translateY(-7px);
    }
    .buttonbuyAlign:hover
    {
      background-color: #D5984E;
      box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
      color: #fff;
      transition: 0.5s;
      transform: translateY(-7px);
    }
    .buttonbuyAlign
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
    .textAlign
    {
      text-align:center;
      font-size: 30px;
      border: none;
      margin-left: 550px;
      margin-top: 50px;
    }
    </style>
  </head>
  <body>
    <div class="header">
      <a href="#default" class="logo">Agro Grocer</a>
      <%-- <input type="text" id="myFilter" class="form-control" onkeyup="myFunction()" placeholder="Search for names.."> --%>
  <div class="header-right">
    <a class="active" href="DataListPage.jsp">Home</a>
    <a href="UserDataList" method="post">User</a>
    <a href="#cart">Cart </a>
    <a href="#about">Contact</a>
    <a href="LoginPage.jsp"> Log out </a>
  </div>
  </div>
    <% String s = (String) request.getAttribute("data");
    session.setAttribute("data", s);
        String m = (String) request.getAttribute("dataName");
        session.setAttribute("dataName", m);
        if(m != null)
        {
          %>
          <input type="text" value="<%=m%>" class="textAlign">
          <%
        }
    if(s != null)
    {
      %>
      <div class="imageAlign">
      <img  src="<%=s%>" alt="image" height="200px" width="250px">
    </div>
      <%
    }
    %>
    <br><br>
      <form action="sellProduct.jsp" method="post" class="button">
        <input type="submit" id="submitButton" name="sell" value="Sell" class="buttonAlign">
      </form>
      <form action="BuyClass" method="post" class="button">
        <input type="submit" id="submitButton" name="buy" value="Buy" class="buttonbuyAlign">
      </form>
  </body>
</html>
