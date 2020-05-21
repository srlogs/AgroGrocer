<%@page import = "java.io.*"%>
<%@page import = "org.json.JSONObject"%>
<%@page import = "org.json.JSONArray"%>
<html>
  <head>
    <title>
      Product data list
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
      background-color: #E9F3E7;
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
      width: 500px;
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
    <script type="text/javascript">
        function sendEmail() {
                var useremail = document.getElementById("buyerid").value;
                var productName = document.getElementById("productname").value;
                var quantity = document.getElemetById("quantity").value;
                var price = document.getElementById("price").value;
                Email.send({
                    Host: "smtp.gmail.com",
                    Username : "logeshwaran.sr1@gmail.com",
                    Password : "Logiwaran1999!",
                    To : useremail,
                    From : "logeshwaran.sr1@gmail.com",
                    Subject : "Purchase successfull",
                    Body : "Product name:" +productName+"\n"+"Quantity: "+quantity+"\n"+ "Price"+price+"\n"+"Product purchased",
                })
                .then(function(message){
                    // alert("mail sent successfully")
                    document.form.submit();
                });
            }
    </script>
  </head>
  <body>
    <% JSONArray jsonarray = (JSONArray) request.getAttribute("userData"); %>
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
        <%-- <tr>
          <th>User Name</th>
          <th>Phone Number</th>
          <th>Door number</th>
          <th>Street Name</th>
          <th>District</th>
        </tr> --%>
        <tr>
          <th> Product name</th>
          <th> Quantity </th>
          <th> Price </th>
          <th> Status </th>
        </tr>

        <% for(int i = 0 ; i<jsonarray.length() ; i++)
          {
            JSONObject jsonobj = jsonarray.getJSONObject(i);
            %>
            <tr>
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
                <% 
                  String val = (String) jsonobj.getString("status");
                  String emailval = (String) request.getAttribute("buyername");
                  String data = "";
                  String buyer_email_id = "";
                  if(emailval != null)
                  {
                    buyer_email_id = emailval;
                  }
                  if(val != null)
                  {
                    if(val.equals("0"))
                    {
                      data = "not sold";
                    }
                    else if(val.equals("1"))
                    {
                      data = "Requested";
                    }
                    else if(val.equals("2"))
                    {
                      data = "sold out";
                    }
                  }
                %>
                <!-- action="UpdateDelivery" method="POST" -->
                <form action="UpdateDelivery" method="POST" name="updatedeliveryform" onsubmit="sendEmail();"> 
                  <input type="hidden" id="productname" name="productname" value="<%=jsonobj.getString("productName")%>">
                  <input type="hidden" id="buyerid" name="buyerid" value="<%=buyer_email_id%>">
                  <input type="hidden" id="quantity" name="quantity" value="<%=jsonobj.getString("quantity")%>">
                  <input type="hidden" id="price" name="price" value="<%=jsonobj.getString("price")%>">
                  <input type="submit" id="status" name="status" value="<%=data%>" >
                </form>
              </td>
              </tr>
            <% } %>

          </table>
          <% } %>
          <br><br>
          <form action="DataListPage.jsp" method="post">
          <input type="submit" name="submit" value="back" class="button">
          </form>
        </center>
  </body>
</html>
