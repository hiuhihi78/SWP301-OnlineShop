/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import configs.GeneratePassword;
import static configs.GeneratePassword.generateRandomPassword;
import configs.Security;
import configs.SendMail;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Admin
 */
public class ResetPasswordController extends HttpServlet {

    
    
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
            String newPassword = GeneratePassword.generateRandomPassword(GeneratePassword.LENGTH_PASSWORD);
            UserDBContext userDb = new UserDBContext();
           String emailAddress = request.getParameter("txtEmail").trim();  
            User user = userDb.getUserByEmail(emailAddress);
            if (user != null) {
                StringBuilder sb = new StringBuilder();
                sb.append("Dear ").append(user.getFullname()).append("<br>");
                sb.append("You are used the forgot password function. <br> ");
                sb.append("Your password is <b>").append(newPassword).append("</b>");
                sb.append(" regards<br>");
                sb.append("Administrator");
                user.setPassword(newPassword);
                userDb.updateUser(user);
                
                SendMail.send(emailAddress, "Reset Password",  sb.toString() , Security.USERNAME, Security.PASSWORD);
                
                request.setAttribute("mess", "Email sent to the email Address. Please check and get your password");
            } else {
                request.setAttribute("error", "Username or email are incorrect");
            }
        } catch (Exception e) {
            e.printStackTrace();
            
            request.setAttribute("error", e.getMessage());
        }
        response.sendRedirect("login");
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
