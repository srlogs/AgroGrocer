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

public class SellersList extends HttpServlet
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
      stmt = con.createStatement();
      String query = "SELECT userdata.username, productdata.emailId, productdata.status, productdata.name, productdata.quantity, productdata.price, userdata.district FROM userdata, productdata WHERE productdata.name = '"+session.getAttribute("dataName")+"' AND productdata.emailId = userdata.emailId";
      ResultSet rs = stmt.executeQuery(query);
      while(rs.next())
      {
        if(rs.getString("emailId").equals(session.getAttribute("emailId")) && (rs.getString("status").equals("1") || rs.getString("status").equals("2")))
        {
          continue;
        }
        else if(rs.getString("status").equals("0"))
        {
          jsonObject = new JSONObject();
          jsonObject.put("username", rs.getString("username"));
          jsonObject.put("emailid", rs.getString("emailId"));
          jsonObject.put("productName", rs.getString("name"));
          jsonObject.put("quantity", rs.getString("quantity"));
          jsonObject.put("price", rs.getString("price"));
          jsonObject.put("district", rs.getString("district"));
          jsonArray.put(jsonObject);
          }
      }
    stmt.close();
    con.close();
    request.setAttribute("sellData", jsonArray);
    RequestDispatcher rd = sc.getRequestDispatcher("/sellersList.jsp");
    rd.include(request, response);
  }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
