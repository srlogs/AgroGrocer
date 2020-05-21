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

public class UpdateDelivery extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
    {
        PrintWriter pw = response.getWriter();
        Statement stmt = null;
        Connection con = null;
        try 
        {
            HttpSession session = request.getSession();
            ServletContext sc = this.getServletContext();
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
            stmt = con.createStatement();
            DatabaseMetaData dbm = con.getMetaData();
            String queryForStatus = "UPDATE productdata SET status = '2' WHERE emailid ='"+session.getAttribute("emailId")+"' AND name = '"+request.getParameter("productname")+"' AND quantity = '"+request.getParameter("quantity")+"' AND price = '"+request.getParameter("price")+"' ";
            stmt.executeUpdate(queryForStatus);
            String queryForcartStatus = "UPDATE cartdata SET status = 'accepted' WHERE buyername = '"+request.getParameter("buyerid")+"' AND productname = '"+request.getParameter("productname")+"' AND quantity = '"+request.getParameter("quantity")+"' AND price = '"+request.getParameter("price")+"' ";
            stmt.executeUpdate(queryForcartStatus);
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