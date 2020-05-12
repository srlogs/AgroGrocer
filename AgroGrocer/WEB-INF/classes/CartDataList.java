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

public class CartDataList extends HttpServlet
{
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, NullPointerException, ServletException
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
      DatabaseMetaData dbm = con.getMetaData();
      ResultSet rs = dbm.getTables(null, null, "cartdata", null);
      if(rs.next())
      {
        String query = "SELECT * FROM cartdata WHERE buyername = '"+session.getAttribute("emailId")+"'";
        ResultSet rst = stmt.executeQuery(query);
        while(rst.next())
        {
          jsonObject = new JSONObject();
          jsonObject.put("productName", rst.getString("productname"));
          jsonObject.put("sellername", rst.getString("sellername"));
          jsonObject.put("quantity", rst.getString("quantity"));
          jsonObject.put("price", rst.getString("price"));
          jsonObject.put("status", rst.getString("status"));
          jsonArray.put(jsonObject);
        }
      }
      stmt.close();
      con.close();
      request.setAttribute("cartdata", jsonArray);
      RequestDispatcher rd = sc.getRequestDispatcher("/cartList.jsp");
      rd.include(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
