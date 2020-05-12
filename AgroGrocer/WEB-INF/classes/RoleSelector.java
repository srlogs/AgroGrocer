import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class RoleSelector extends HttpServlet
{
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    PrintWriter pw = response.getWriter();
    try
    {
      String val = request.getParameter("role");
      HttpSession session = request.getSession();
      session.setAttribute("role", val);
      ServletContext sc = this.getServletContext();
      RequestDispatcher rd = sc.getRequestDispatcher("/DataListPage.jsp");
      rd.forward(request, response);
    }
    catch(Exception  e)
    {
      pw.println(e);
    }
  }
}
