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

public class UpdateUserCredentials extends HttpServlet
{
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
    {
        Algorithms a = new Algorithms();
        Algo algo[] = Algo.values();
        PrintWriter pw = response.getWriter();
        Statement stmt = null;
        Connection con = null;
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
            HttpSession session = request.getSession();
            ServletContext sc = this.getServletContext();
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
            stmt = con.createStatement();
            query = "UPDATE pswdata set password = '"+epassword+"', type = '"+algo[x-1]+"', key = '"+key+"'";
            stmt.executeUpdate(query);
            RequestDispatcher rd = sc.getRequestDispatcher("/LoginPage.jsp");
            rd.include(request, response);
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
