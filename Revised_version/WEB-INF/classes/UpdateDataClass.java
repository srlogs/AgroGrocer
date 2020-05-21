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

public class UpdateDataClass extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
    {
        PrintWriter pw = response.getWriter();
        Connection con = null;
        Statement stmt = null;
        try 
        {

            HttpSession session = request.getSession();
            ServletContext sc = this.getServletContext();
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
            stmt = con.createStatement();
            String query = "UPDATE userdata set username = '"+request.getParameter("name")+"', emailid = '"+request.getParameter("emailid")+"', doornumber = '"+request.getParameter("doornumber")+"', phone = '"+request.getParameter("phone")+"', street = '"+request.getParameter("street")+"', district = '"+request.getParameter("district")+"' WHERE emailid = '"+request.getParameter("emailid")+"' ";
            stmt.executeUpdate(query);
            RequestDispatcher rd = sc.getRequestDispatcher("/DataListPage.jsp");
            rd.include(request, response);
        }
        catch(Exception e)
        {
            pw.println(e);
        }
    }
}