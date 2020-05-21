import java.io.*;
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
import org.json.JSONArray;
import org.json.JSONObject;

public class UserDataList extends HttpServlet
{
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    PrintWriter pw = response.getWriter();
    Connection con = null;
    Statement stmt = null;
    try
    {
      HttpSession session = request.getSession();
      JSONArray jsonArray = new JSONArray();
      JSONObject jsonObject = new JSONObject();
      ServletContext sc = this.getServletContext();
      Class.forName("org.postgresql.Driver");
      con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
      DatabaseMetaData dbm = con.getMetaData();
      ResultSet rs = dbm.getTables(null, null, "userdata", null);
      if(rs.next())
      {
        stmt = con.createStatement();
        String query = "SELECT * FROM userdata WHERE emailId = '"+session.getAttribute("emailId")+"';";
        ResultSet resultset = stmt.executeQuery(query);
        while(resultset.next())
        {
          jsonObject = new JSONObject();
          jsonObject.put("username", resultset.getString("username"));
          jsonObject.put("phone", resultset.getString("phone"));
          jsonObject.put("doornumber", resultset.getString("doornumber"));
          jsonObject.put("street", resultset.getString("street"));
          jsonObject.put("district", resultset.getString("district"));
          jsonArray.put(jsonObject);
        }
      }
      stmt.close();
      con.close();
      request.setAttribute("userData", jsonArray);
      RequestDispatcher rd = sc.getRequestDispatcher("/userList.jsp");
      rd.include(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
