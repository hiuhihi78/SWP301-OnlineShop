/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import configs.Security;
import configs.SendMail;
import configs.TokenGenerator;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
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
public class SendMailController extends HttpServlet {

    public static final int MAXIMUM_AGE_TOKEN = 60*5;
    
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
        request.getRequestDispatcher("view/public/resetpassword.jsp").forward(request, response);
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
        try {
           
            UserDBContext userDb = new UserDBContext();
            PrintWriter out = response.getWriter();      
           String emailAddress = request.getParameter("txtEmail").trim();  
            User user = userDb.getUserByEmail(emailAddress);
            String token = TokenGenerator.uniqueToken();
            String url = "http://localhost:8080/changePassword?email=" + emailAddress+
                    "&token=" + token;
            
            if (user != null) {
                //userDb.createTokenForUser(emailAddress, token);
                Cookie tokenCookie = new Cookie("tokenSave", token);
                tokenCookie.setMaxAge(MAXIMUM_AGE_TOKEN);
                response.addCookie(tokenCookie);
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(user.getFullname()).append(",<br>");
                sb.append("Someone has requested a password reset for this account. <br> ");
                sb.append("Site Name: Online Shop <br>");
                sb.append(" If this was a mistake, ignore this email and nothing will happen. <br> ");
                sb.append("To reset your your password, visit the following address: <br> ");
                sb.append("<b>").append(url).append("</b>");
                sb.append(" ,regards<br>");
                sb.append("Administrator");
                
                SendMail.send(emailAddress, "Password Reset",  sb.toString() , Security.USERNAME, Security.PASSWORD);
                
                out.println("<script type=\"text/javascript\">");
            out.println("alert('Email sent to the email Address. Please check and get your password!');");
            out.println("location='login';");
            out.println("</script>");
            } else {
                request.setAttribute("mess", "Username or email are incorrect");
            }
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
