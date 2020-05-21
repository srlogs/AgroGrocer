
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

public class RegistrationClass extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    Algorithms a = new Algorithms();
    Algo algo[] = Algo.values();
    PrintWriter pw = response.getWriter();
    Connection con = null;
    Statement stmt = null;
    try
    {
      Random rand = new Random();
      int x = rand.nextInt((3-1)+1)+1;
      String password = request.getParameter("password");
      String key = " ";
      String epassword = " ";
      String query = " ";
      String insertdata = " ";
      if(x == 1)
      {
        key = a.aeskeygenerate();
        epassword = a.encrypt_aes(password, key);
      }
      else if(x == 2)
      {
        key = a.deskeygenerate();
        epassword = a.encrypt_des(password, key);
      }
      else if(x == 3)
      {
        key = a.Blowfishkeygenerate();
        epassword = a.encrypt_Blowfish(password, key);
      }
      ServletContext sc = this.getServletContext();
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
      DatabaseMetaData dbm = con.getMetaData();
      stmt = con.createStatement();
      ResultSet rs = dbm.getTables(null, null, "userdata", null);
      if(rs.next())
      {
        query = "INSERT INTO userdata(username, emailId, phone, latitude, longitude, doornumber, street, district) values('"+request.getParameter("username")+"', '"+request.getParameter("emailId")+"', '"+request.getParameter("phone")+"', '"+request.getParameter("latitude")+"', '"+request.getParameter("longitude")+"', '"+request.getParameter("doornumber")+"', '"+request.getParameter("street")+"', '"+request.getParameter("district")+"')";
        stmt.executeUpdate(query);
      }
      else
      {
        query = "CREATE TABLE userdata(username varchar(50), emailId varchar(100) NOT NULL, phone varchar(50), latitude varchar(150), longitude varchar(150), doornumber varchar(10), street varchar(100), district varchar(100), PRIMARY KEY(emailId))";
        stmt.executeUpdate(query);
        insertdata = "INSERT INTO userdata(username, emailId, phone, latitude, longitude, doornumber, street, district) values('"+request.getParameter("username")+"', '"+request.getParameter("emailId")+"', '"+request.getParameter("phone")+"', '"+request.getParameter("latitude")+"', '"+request.getParameter("longitude")+"', '"+request.getParameter("doornumber")+"', '"+request.getParameter("street")+"', '"+request.getParameter("district")+"')";
        stmt.executeUpdate(insertdata);
      }
      ResultSet rst = dbm.getTables(null, null, "pswdata", null);
      if(rst.next())
      {
        query = "INSERT INTO pswdata(emailId, password, type, key)" + "VALUES('"+request.getParameter("emailId")+"', '"+epassword+"', '"+algo[x-1]+"', '"+key+"')";
        stmt.executeUpdate(query);
      }
      else
      {
        query = "CREATE TABLE pswdata(emailId varchar(50) NOT NULL REFERENCES userdata(emailId) ON DELETE CASCADE, password varchar(50),type varchar(50), key varchar(50))";
        stmt.executeUpdate(query);
        insertdata = "INSERT INTO pswdata(emailId, password, type, key)" + "VALUES('"+request.getParameter("emailId")+"', '"+epassword+"', '"+algo[x-1]+"', '"+key+"')";
        stmt.executeUpdate(insertdata);
      }
      stmt.close();
      con.close();
      RequestDispatcher rd = sc.getRequestDispatcher("/LoginPage.jsp");
      rd.forward(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
  public enum Algo
  {
    AES, DES, Blowfish;
  }
}
