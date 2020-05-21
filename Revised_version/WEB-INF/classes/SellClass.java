import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.Random;
import java.lang.Math;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class SellClass extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    PrintWriter pw = response.getWriter();
    Connection con = null;
    Statement stmt = null;
    try
    {
      HttpSession session = request.getSession();
      String create = " ";
      String query = " ";
      ServletContext sc = this.getServletContext();
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
      DatabaseMetaData dbm = con.getMetaData();
      stmt = con.createStatement();
      ResultSet rs = dbm.getTables(null, null, "productdata", null);
      if(rs.next())
      {
        query = "INSERT INTO productdata(emailId, name, quantity, price, status) VALUES('"+session.getAttribute("emailId")+"', '"+session.getAttribute("dataName")+"', '"+request.getParameter("quantity")+"', '"+request.getParameter("price")+"', '0')";
        stmt.executeUpdate(query);
      }
      else
      {
        create = "CREATE TABLE productdata(emailId varchar(150) NOT NULL REFERENCES userdata(emailId) ON DELETE CASCADE, name varchar(50), quantity varchar(50), price varchar(50), status varchar(50))";
        stmt.executeUpdate(create);
        query = "INSERT INTO productdata(emailId, name, quantity, price, status) VALUES('"+session.getAttribute("emailId")+"', '"+session.getAttribute("dataName")+"', '"+request.getParameter("quantity")+"', '"+request.getParameter("price")+"', '0')";
        stmt.executeUpdate(query);
      }
      ResultSet rst = dbm.getTables(null, null, "userdata", null);
      if(rst.next())
      {
        query = "UPDATE userdata SET latitude = '"+request.getParameter("latitude")+"', longitude = '"+request.getParameter("longitude")+"' WHERE emailId = '"+session.getAttribute("emailId")+"'";
        stmt.executeUpdate(query);
      }
      stmt.close();
      con.close();
      RequestDispatcher rd = sc.getRequestDispatcher("/StatusReport");
      rd.forward(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
