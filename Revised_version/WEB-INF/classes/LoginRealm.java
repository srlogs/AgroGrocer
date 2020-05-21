import java.security.Principal;
import java.util.ArrayList;
import java.util.List;
import org.apache.catalina.realm.RealmBase;
import org.apache.catalina.realm.GenericPrincipal;
import java.util.logging.Logger;
import java.sql.*;
import java.io.*;

public class LoginRealm extends RealmBase {
    private static final Logger log = Logger.getLogger(LoginRealm.class.getName());
    private String username;
    private String password;

    @Override
    public Principal authenticate(String username, String password) {
        Algorithms s = new Algorithms();
        this.username = username;
        this.password = password;
        Connection con = null;
        Statement stmt = null;
        int flag = 0;
        try
        {
          String psw = " ";
          Class.forName("org.postgresql.Driver");
          con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/agrogrocer","user","password");
          stmt = con.createStatement();
          String query = "SELECT userdata.username, pswdata.password, pswdata.type, pswdata.key FROM  userdata, pswdata WHERE userdata.username = pswdata.usrname";
          ResultSet resultset = stmt.executeQuery(query);
          while(resultset.next())
          {
            if(resultset.getString("type").equals("AES"))
            {
              psw = s.decrypt_aes(resultset.getString("password"), resultset.getString("key"));
            }
            else if(resultset.getString("type").equals("DES"))
            {
              psw = s.decrypt_des(resultset.getString("password"), resultset.getString("key"));
            }
            else if(resultset.getString("type").equals("Blowfish"))
            {
              psw = s.decrypt_Blowfish(resultset.getString("password"), resultset.getString("key"));
            }
            if(username.equals(resultset.getString("username")) && password.equals(psw))
            {
              //log.warning(resultset.getString("username")+" "+psw);
              return getPrincipal(username);
            }
          }
          stmt.close();
          con.close();
        }
        catch(Exception e)
        {}
        return null;
    }
    @Override
    protected String getName() {
        return username;
    }

    @Override
    protected String getPassword(String username) {
        return password;
    }

    @Override
    protected Principal getPrincipal(String string) {
        List<String> roles = new ArrayList<String>();
        roles.add("user");
        log.info("Realm: "+this);
        Principal principal = new GenericPrincipal(username, password, roles);
        log.info("Principal: "+principal);
        return principal;
    }
}
