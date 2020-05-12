<%@page import = "java.io.*"%>
<%@page import = "org.json.JSONObject"%>
<%@page import = "org.json.JSONArray"%>
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
    table, td
    {
      border: 1px solid #ddd;
      padding: 20px;
    }
    table
    {
      margin-top: 50px;
      text-align: center;
      border-collapse: collapse;
      width: 300px;
    }
    th
    {
      padding-top: 12px;
      padding-bottom: 12px;
      text-align: center;
      background-color: #4CAF50;
      color: white;
    }
    </style>
  </head>
  <body>
    <% JSONArray jsonarray = (JSONArray) request.getAttribute("cartdata"); %>
    <div class="header">
      <a href="#default" class="logo">Agro Grocer</a>
      <%-- <input type="text" id="myFilter" class="form-control" onkeyup="myFunction()" placeholder="Search for names.."> --%>
  <div class="header-right">
    <a class="active" href="DataListPage.jsp">Home</a>
    <a href="UserDataList" method="post">User</a>
    <a href="CartDataList">Cart </a>
    <a href="#about">Contact</a>
    <a href="LoginPage.jsp"> Log out </a>
  </div>
  </div>

  <center>
      <table>
        <tr>
          <th>Seller Name</th>
          <th>Product Name</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Status</th>
        </tr>
        <% for(int i = 0 ; i<jsonarray.length() ; i++)
          {
            JSONObject jsonobj = jsonarray.getJSONObject(i);
            %>
            <tr>

              <td>
                <% out.println(jsonobj.getString("sellername")); %>
              </td>
              <td>
                <% out.println(jsonobj.getString("productName")); %>
              </td>

              <td>
                <% out.println(jsonobj.getString("quantity")); %>
              </td>

              <td>
                <% out.println(jsonobj.getString("price")); %>
              </td>

              <td>
                <% out.println(jsonobj.getString("status")); %>
              </td>
            </tr>
            <% } %>
          </table>
          <br><br>
          <form action="DataListPage.jsp" method="post">
          <input type="submit" name="submit" value="Back" class="buttonAlign">
          </form>
        </center>
  </body>
</html>
