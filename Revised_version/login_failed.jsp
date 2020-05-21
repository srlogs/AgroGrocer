<html>
  <body>
    <% session.setAttribute("value","Incorrect username or password!");
    response.sendRedirect("LoginPage.jsp");%>
  </body>
</html>
