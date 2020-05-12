import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class ProcessPage extends HttpServlet
{
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, NullPointerException
  {
    PrintWriter pw = response.getWriter();
    HttpSession session = request.getSession();
    try
    {

      String img = request.getParameter("imageSrc");
      String imgName = request.getParameter("imageName");
      session.setAttribute("data", img);
      session.setAttribute("dataName", imgName);
      ServletContext sc = this.getServletContext();
      //pw.println(session.getAttribute("role"));
      if(session.getAttribute("role").equals("sell"))
      {
        RequestDispatcher rd = sc.getRequestDispatcher("/sellProduct.jsp");
        rd.include(request, response);
      }
      else if(session.getAttribute("role").equals("buy"))
      {
        pw.println("helloworld");
        RequestDispatcher rd = sc.getRequestDispatcher("/SellersList");
        rd.forward(request, response);
      }
    }
    catch(Exception e)
    {
      pw.println(e);
    }
  }
}
