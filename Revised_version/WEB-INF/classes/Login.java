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

public class Login extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    Algorithms s = new Algorithms();
    PrintWriter pw = response.getWriter();
    Connection con = null;
    Statement stmt = null;
    try
    {
      String username = request.getParameter("emailId");
      String password = request.getParameter("password");
      String psw = " ";
      HttpSession session = request.getSession();
      ServletContext sc = this.getServletContext();
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
      stmt = con.createStatement();
      String query = "SELECT userdata.emailId, pswdata.password, pswdata.type, pswdata.key FROM  userdata, pswdata WHERE userdata.emailId = pswdata.emailId";
      ResultSet resultset = stmt.executeQuery(query);
      while(resultset.next())
      {
        if(resultset.getString("type").equals("AES"))
        {
          psw = s.decrypt_aes(resultset.getString("password"), resultset.getString("key"));
        }
        else if(resultset.getString("type").equals("DES"))
        {
          psw = s.decrypt_des(resultset.getString("password"), resultset.getString("key"));
        }
        else if(resultset.getString("type").equals("Blowfish"))
        {
          psw = s.decrypt_Blowfish(resultset.getString("password"), resultset.getString("key"));
        }
        if(username.equals(resultset.getString("emailId")) && password.equals(psw))
        {
          //log.warning(resultset.getString("username")+" "+psw);
          session.setAttribute("emailId", username);
          RequestDispatcher rd = sc.getRequestDispatcher("/roleSelector.jsp");
          rd.forward(request, response);
        }
      }
      RequestDispatcher rd = sc.getRequestDispatcher("/login_failed.jsp");
      rd.forward(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
