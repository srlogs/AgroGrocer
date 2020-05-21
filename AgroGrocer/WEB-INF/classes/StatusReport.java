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
import org.json.JSONArray;
import org.json.JSONObject;

public class StatusReport extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
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
      ResultSet rs = dbm.getTables(null, null, "productdata", null);
      if(rs.next())
      {
        stmt = con.createStatement();
        String query = "SELECT * FROM productdata WHERE emailId = '"+session.getAttribute("emailId")+"';";
        ResultSet resultset = stmt.executeQuery(query);
        while(resultset.next())
        {
          jsonObject = new JSONObject();
          jsonObject.put("productName", resultset.getString("name"));
          jsonObject.put("quantity", resultset.getString("quantity"));
          jsonObject.put("price", resultset.getString("price"));
          jsonObject.put("status", resultset.getString("status"));
          jsonArray.put(jsonObject);
        }
      }
      RequestFunction(request, response, jsonObject.getString("productName"), jsonObject.getString("quantity"), jsonObject.getString("price"));
      stmt.close();
      con.close();
      
      request.setAttribute("userData", jsonArray);
      RequestDispatcher rd = sc.getRequestDispatcher("/productStatusList.jsp");
      rd.include(request, response);
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
  public void RequestFunction(HttpServletRequest request, HttpServletResponse response, String productname, String quantity, String price) throws IOException, NullPointerException, ServletException
  {
      Connection con = null;
      Statement stmt = null;
      PrintWriter pw = response.getWriter();
      try 
      {
        Class.forName("org.postgresql.Driver");
        con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
        stmt = con.createStatement();
        DatabaseMetaData dbm = con.getMetaData();
        ResultSet rst = dbm.getTables(null, null, "cartdata", null);
        if(rst.next())
        {
          String emailquery = "SELECT buyername FROM cartdata WHERE productname = '"+productname+"' AND quantity = '"+quantity+"' AND price = '"+price+"' ";
          ResultSet rSet = stmt.executeQuery(emailquery);
          while(rSet.next())
          {
            request.setAttribute("buyername", rSet.getString("buyername"));
          }
        }
      }
      catch(Exception e)
      {
        pw.println(e);
      }
  }
}
