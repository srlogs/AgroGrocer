import java.util.*;  
import javax.mail.*;  
import javax.mail.internet.*;  
import javax.activation.*;  
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
  
public class ForgetPasswordHandler extends HttpServlet
{  
 protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException
 {  
     PrintWriter pw = response.getWriter();
     String host="smtp.gmail.com";  
  final String user="logeshwaran.sr1@gmail.com";//change accordingly  
  final String password="Logiwaran1999!";//change accordingly  
    
  String to="logeshwaran.sr1@gmail.com";//change accordingly  
  
   //Get the session object  
   Properties props = new Properties();  
   props.put("mail.smtp.starttls.enable", "true");
   props.put("mail.smtp.host",host);  
   props.put("mail.smtp.auth", "true");  
   props.put("mail.smtp.port", "587");

     
   Session session = Session.getDefaultInstance(props,  
    new javax.mail.Authenticator() {  
      protected PasswordAuthentication getPasswordAuthentication() {  
    return new PasswordAuthentication(user,password);  
      }  
    });  
  
   //Compose the message  
    try {  
     MimeMessage message = new MimeMessage(session);  
     message.setFrom(new InternetAddress(user));  
     message.addRecipient(Message.RecipientType.TO,new InternetAddress(to));  
     message.setSubject("javatpoint");  
     message.setText("This is simple program of sending email using JavaMail API","text/plain");  
     //message.setHeader("Content-Type", "text/plain; charset=\"us-ascii\"; name=\"mail.txt\"");
       
    //send the message  
     Transport.send(message);  
  
     System.out.println("message sent successfully...");  
   
     } catch (MessagingException e) {pw.println(e);}    
   }  
}  