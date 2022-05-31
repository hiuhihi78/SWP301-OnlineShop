/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configs;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;


import java.io.*;
import java.net.*;
import javax.naming.*; 
import javax.naming.directory.*;        

/**
 *
 * @author Admin
 */
public class SendMail {

    public static void send(String to, String subject, String msg, final String user, final String pass) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(subject, "text/html; charset=UTF-8");
            message.setContent(msg, "text/html; charset=UTF-8");
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void sendPassword(String email, String fullname, String password, String url) {
        String subject = "[OnlineShop]";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en-UTF-8\">\n"
                + "<head>\n"
                + "</head>\n"
                + "<body>\n"
                + "    <h3 style=\"color:blue\">Xin chào " + fullname + "</h3>\n"
                + "    <p>Tài khoản của bạn dã được khởi tạo thành công bằng tài khoản email này</p>\n"
                + "    <p>Password: <span style=\"color:red\">" + password + "</span></p>\n"
                + "    <p>Lưu ý không chia sẻ mật khẩu cho bất kì ai</p>\n"
                + "    <p>Click vào linh này để đồi mật khẩu mới an toàn hơn <a href=\"" + url + "\">Nhấp vào đây</a></p>\n"
                + "</body>\n"
                + "</html>";
        SendMail.send(email, subject, message, Security.USERNAME, Security.PASSWORD);
    }

    public static void setContent(String username, String code, String email) {
        String subject = "[Doctris] Please verify your email.";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n "
                + "\n"
                + "<head>\n "
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Xin chào " + username + " !</h3>\n"
                + "    <div>Link xác minh tài khoản của bạn là : <a href=\"" + code + "\">VERIFY</a></div>\n"
                + "    <div>Thư này được tạo ra tự động.</div>\n"
                + "    <div>Nếu bạn cần trợ giúp hoặc có câu hỏi, hãy gửi email đến doctris.care@gmail.com bất cứ lúc nào.</div>\n"
                + "    <h3 style=\"color: blue;\">Trân trọng!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        SendMail.send(email, subject, message, Security.USERNAME, Security.PASSWORD);
    }
    
    private static int hear( BufferedReader in ) throws IOException {
      String line = null;
      int res = 0;
      while ( (line = in.readLine()) != null ) {
          String pfx = line.substring( 0, 3 );
          try {
             res = Integer.parseInt( pfx );
          } 
          catch (Exception ex) {
             res = -1;
          }
          if ( line.charAt( 3 ) != '-' ) break;
      }
      return res;
      }
    private static void say( BufferedWriter wr, String text ) 
       throws IOException {
      wr.write( text + "\r\n" );
      wr.flush();
      return;
      }
    private static ArrayList getMX( String hostName )
          throws NamingException {
      // Perform a DNS lookup for MX records in the domain
      Hashtable env = new Hashtable();
      env.put("java.naming.factory.initial",
              "com.sun.jndi.dns.DnsContextFactory");
      DirContext ictx = new InitialDirContext( env );
      Attributes attrs = ictx.getAttributes
                            ( hostName, new String[] { "MX" });
      Attribute attr = attrs.get( "MX" );
      // if we don't have an MX record, try the machine itself
      if (( attr == null ) || ( attr.size() == 0 )) {
        attrs = ictx.getAttributes( hostName, new String[] { "A" });
        attr = attrs.get( "A" );
        if( attr == null ) 
             throw new NamingException
                      ( "No match for name '" + hostName + "'" );
      }
      // Huzzah! we have machines to try. Return them as an array list
      // NOTE: We SHOULD take the preference into account to be absolutely
      //   correct. This is left as an exercise for anyone who cares.
      ArrayList res = new ArrayList();
      NamingEnumeration en = attr.getAll();
      while ( en.hasMore() ) {
         String x = (String) en.next();
         String f[] = x.split( " " );
         if ( f[1].endsWith( "." ) ) 
             f[1] = f[1].substring( 0, (f[1].length() - 1));
         res.add( f[1] );
      }
      return res;
      }
    public static boolean isAddressValid( String address ) {
      // Find the separator for the domain name
      int pos = address.indexOf( '@' );
      // If the address does not contain an '@', it's not valid
      if ( pos == -1 ) return false;
      // Isolate the domain/machine name and get a list of mail exchangers
      String domain = address.substring( ++pos );
      ArrayList mxList = null;
      try {
         mxList = getMX( domain );
      } 
      catch (NamingException ex) {
         return false;
      }
      // Just because we can send mail to the domain, doesn't mean that the
      // address is valid, but if we can't, it's a sure sign that it isn't
      if ( mxList.size() == 0 ) return false;
      // Now, do the SMTP validation, try each mail exchanger until we get
      // a positive acceptance. It *MAY* be possible for one MX to allow
      // a message [store and forwarder for example] and another [like
      // the actual mail server] to reject it. This is why we REALLY ought
      // to take the preference into account.
      for ( int mx = 0 ; mx < mxList.size() ; mx++ ) {
          boolean valid = false;
          try {
              int res;
              Socket skt = new Socket( (String) mxList.get( mx ), 25 );
              BufferedReader rdr = new BufferedReader
                 ( new InputStreamReader( skt.getInputStream() ) );
              BufferedWriter wtr = new BufferedWriter
                 ( new OutputStreamWriter( skt.getOutputStream() ) );
              res = hear( rdr );
              if ( res != 220 ) throw new Exception( "Invalid header" );
              say( wtr, "EHLO orbaker.com" );
              res = hear( rdr );
              if ( res != 250 ) throw new Exception( "Not ESMTP" );
              // validate the sender address  
              say( wtr, "MAIL FROM: <tim@orbaker.com>" );
              res = hear( rdr );
              if ( res != 250 ) throw new Exception( "Sender rejected" );
              say( wtr, "RCPT TO: <" + address + ">" );
              res = hear( rdr );
              // be polite
              say( wtr, "RSET" ); hear( rdr );
              say( wtr, "QUIT" ); hear( rdr );
              if ( res != 250 ) 
                 throw new Exception( "Address is not valid!" );
              valid = true;
              rdr.close();
              wtr.close();
              skt.close();
          } 
          catch (Exception ex) {
            // Do nothing but try next host
          } 
          finally {
            if ( valid ) return true;
          }
      }
      return false;
      }
    public  String call_this_to_validate( String email ) {
        String testData[] = {email};
        String return_string="";
        for ( int ctr = 0 ; ctr < testData.length ; ctr++ ) {
        	return_string=( testData[ ctr ] + " is valid? " + 
                 isAddressValid( testData[ ctr ] ) );
        }
        return return_string;
        }
}

    public static void main(String[] args) {
        String subject = "Test";
        String message = "tesing";
        SendMail.sendPassword("hieuldhe150703@fpt.edu.vn", "hello", Security.USERNAME, Security.PASSWORD);
    }
}
