<%@page import = "java.io.*"%>
<%@page import = "org.json.JSONObject"%>
<%@page import = "org.json.JSONArray"%>
<html>
  <head>
    <title>
      User data
    </title>
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

    li {
      float: left;
    }


    li a {
      display: block;
      color: white;
      text-align: center;
      width:150px;

      padding: 14px 16px;

      text-decoration: none;
    }

    li a:hover {
      background-color: #2EE59D;
      transition: 0.5s;


    }
    body
    {
      background-color: white;
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
    .button
    {
      margin-top: 20px;
      margin-bottom: 20px;
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
    .button:hover
    {
        background-color: #2EE59D;
        box-shadow: 0px 15px 20px rgba(46, 229, 157, 0.4);
        color: #fff;
        transition: 0.5s;
        transform: translateY(-7px);
    }
    .imageAlign
    {
      text-align: center;
      margin-top: 50px;
    }
    .textAlign
    {
      text-align:center;
      font-size: 30px;
      border: none;
      margin-left: 550px;
      margin-top: 50px;
    }
    .buyButton
    {
      width: 60px;
      height: 30px;
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

    }
    label 
    {
      margin-top: 10px;
			text-align: center;
			font-size: 15px;
			font-family:  'Roboto', sans-serif;
			font-weight: 500;
			color: grey;
    }
    </style>
  </head>
  <body>
    <% JSONArray jsonarray = (JSONArray) request.getAttribute("sellData"); %>
    <div class="header">
      <a href="#default" class="logo">Agro Grocer</a>
  <div class="header-right">
    <a class="active" href="DataListPage.jsp">Home</a>
    <a href="UserDataList">User</a>
    <a href="CartDataList">Cart </a>
    <a href="#about">Contact</a>
    <a href="LoginPage.jsp"> Log out </a>
  </div>
  </div>
  <% String s = (String) session.getAttribute("data");
  // session.setAttribute("data", s);
      String m = (String) session.getAttribute("dataName");
      // session.setAttribute("dataName", m);
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
  <center>
    <% if(jsonarray.length() == 0)
    {
        %>
        <label>No records found</label>
        <%
    } 
    else { 
      %>
      <table>
        <tr>
          <th>Seller Name</th>
          <th>Product Name</th>
          <th>Quantity</th>
          <th>Price</th>
          <th>Location</th>
          <th>
        </tr>
        <% for(int i = 0 ; i<jsonarray.length() ; i++)
          {
            JSONObject jsonobj = jsonarray.getJSONObject(i);
            %>
            <tr>

              <td>
                <% out.println(jsonobj.getString("username")); %>
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
                <% out.println(jsonobj.getString("district")); %>
              </td>
              <td>
                <form action="AddCart" method="post">
                  <input type="hidden" value="<%=jsonobj.getString("username")%>" name="sellername">
                  <input type="hidden" value="<%=jsonobj.getString("emailid")%>" name = "emailid">
                  <input type="hidden" value="<%=jsonobj.getString("quantity")%>" name="quantity">
                  <input type="hidden" value="<%=jsonobj.getString("price")%>" name="price">
                  <input type="hidden" value="<%=jsonobj.getString("district")%>" name="district">
                  <input type="submit" value="Buy" name="buy" class="buyButton">
                </form>
              </td>
            </tr>
            <% } %>
          </table>
          <% } %>
          <br><br>
          <form action="DataListPage.jsp" method="post">
          <input type="submit" name="submit" value="Back" class="button">
          </form>
        </center>
  </body>
</html>
