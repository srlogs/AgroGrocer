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
import java.util.Calendar;
import java.util.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.io.*;

public class AddCart extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    PrintWriter pw = response.getWriter();
    Connection con = null;
    Statement stmt = null;
    try
    {
      String query = " ";
      String create = " ";
      Calendar cal = Calendar.getInstance();
      Date dates = cal.getTime();
      DateFormat dateFormat = new SimpleDateFormat("hh:mm:ss");
      String actime = dateFormat.format(dates);
      long millis=System.currentTimeMillis();
      java.sql.Date date=new java.sql.Date(millis);
      HttpSession session = request.getSession();
      ServletContext sc = this.getServletContext();
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
      DatabaseMetaData dbm = con.getMetaData();
      stmt = con.createStatement();
      ResultSet rs = dbm.getTables(null, null, "cartdata", null);
      if(rs.next())
      {
        query = "INSERT INTO cartdata(productname, sellername, buyername, quantity, price, date, time, location, status) VALUES('"+session.getAttribute("dataName")+"', '"+request.getParameter("sellername")+"', '"+session.getAttribute("emailId")+"', '"+request.getParameter("quantity")+"', '"+request.getParameter("price")+"', '"+date+"', '"+actime+"', '"+request.getParameter("district")+"', 'queued')";
        stmt.executeUpdate(query);
      }
      else
      {
        create = "CREATE TABLE cartdata(productname varchar(100), sellername varchar(50), buyername varchar(20), quantity varchar(50), price varchar(20), date varchar(40), time varchar(50), location varchar(50), status varchar(50))";
        stmt.executeUpdate(create);
        query = "INSERT INTO cartdata(productname, sellername, buyername, quantity, price, date, time, location, status) VALUES('"+session.getAttribute("dataName")+"', '"+request.getParameter("sellername")+"', '"+session.getAttribute("emailId")+"', '"+request.getParameter("quantity")+"', '"+request.getParameter("price")+"', '"+date+"', '"+actime+"', '"+request.getParameter("district")+"', 'queued')";
        stmt.executeUpdate(query);
      }
      stmt.close();
      con.close();
      RequestDispatcher rd = sc.getRequestDispatcher("/success.jsp");
      rd.include(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
