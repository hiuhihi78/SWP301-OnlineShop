/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package configs;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

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
        String subject = "[OnlineShop] Please verify your email.";
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

    public static void sendMailOrder(String email, int idOrder, int idPayment) {
        String subject = "[OnlineShop] Order Has Been Sucessfully.";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n "
                + "\n"
                + "<head>\n "
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Xin chào " + "" + " !</h3>\n"
                + "    <div>Link xác minh tài khoản của bạn là : <a href=\"" + "" + "\">VERIFY</a></div>\n"
                + "    <div>Thư này được tạo ra tự động.</div>\n"
                + "    <div>Nếu bạn cần trợ giúp hoặc có câu hỏi, hãy gửi email đến doctris.care@gmail.com bất cứ lúc nào.</div>\n"
                + "    <h3 style=\"color: blue;\">Trân trọng!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        SendMail.send(email, subject, message, Security.USERNAME, Security.PASSWORD);
    }

    public static void main(String[] args) {
        String subject = "Test";
        String message = "tesing";
        SendMail.sendPassword("hieuldhe150703@fpt.edu.vn", "hello", Security.USERNAME, Security.PASSWORD);
    }
}
