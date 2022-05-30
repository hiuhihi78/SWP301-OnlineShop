/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import configs.Security;
import configs.SendMail;
import configs.TokenGenerator;
import static controller.common.SendMailController.MAXIMUM_AGE_TOKEN;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class RegisterController extends HttpServlet {

    public static final int MAXIMUM_AGE_TOKEN_REGISTER = 60 * 5;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("./view/public/register.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            String name = "", strGender = "", email = "", mobile = "", address = "", password = "";
            UserDBContext userDb = new UserDBContext();
            PrintWriter out = response.getWriter();
            name = request.getParameter("txtName");
            strGender = request.getParameter("rd");
            email = request.getParameter("txtEmail");
            mobile = request.getParameter("txtMobile");
            address = request.getParameter("txtAddress");
            password = request.getParameter("txtPassword1");
            String token = TokenGenerator.uniqueToken();
            String url = "http://localhost:8080/veryfi?email=" + email
                    + "&token=" + token;
            User user = new User();
            user.setPassword(password);
            user.setFullname(name);
            user.setGender(Boolean.parseBoolean(strGender));
            user.setEmail(email);
            user.setMobile(mobile);
            user.setAddress(address);
            Cookie userRegister = new Cookie("userRegister", user.toString());
            userRegister.setMaxAge(MAXIMUM_AGE_TOKEN);
            response.addCookie(userRegister);
            LocalDateTime fiveMinutesLater  = LocalDateTime.now().plusMinutes(5);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
            String formatted = fiveMinutesLater.format(formatter);
            Cookie tokenCookieRegister = new Cookie("tokenSaveRegister", token);
            tokenCookieRegister.setMaxAge(MAXIMUM_AGE_TOKEN_REGISTER);
            response.addCookie(tokenCookieRegister);
            StringBuilder sb = new StringBuilder();
            sb.append("Dear ").append(name).append(",<br>");
            sb.append("Please click the link below to verify your email address. <br> ");
            sb.append("<b>").append(url).append("</b>");
            sb.append(" ,regards<br>");
            sb.append("Administrator");

            SendMail.send(email, "Please verify your email", sb.toString(), Security.USERNAME, Security.PASSWORD);

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Email is sent to Email Address. Please check, this verification is valid until "+ formatted+"');");
            out.println("location='register';");
            out.println("</script>");


        } catch (Exception e) {
            e.printStackTrace();

            request.setAttribute("error", e.getMessage());
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
