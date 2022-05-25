/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Email;
import utils.EmailUtils;

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
           String emailAddress = request.getParameter("txtEmail");
//           String userName = request.getParameter("txtName");
           
            //NguoiDungDao dao = new NguoiDungDao();
            //NguoiDung objNguoiDung = dao.findByUserNameAndEmail(emailAddress);
//            if (objNguoiDung == null) {
//                request.setAttribute("error", "Username or email are incorrect");
//            } else {
           if (emailAddress != null) {
               String newPass = generateRandomPassword(6);
                Email email = new Email();
                email.setFrom("hieunvhe153769@fpt.edu.vn");
                email.setFromPassword("Skynet.com");
                email.setTo(emailAddress);
                email.setSubject("Forgot Password Function");
                StringBuilder sb = new StringBuilder();
                sb.append("Dear hieu").append("<br>");
                sb.append("You are used the forgot password function. <br> ");
                sb.append("Your password is <b>").append(newPass).append("</b>");
                sb.append("regards<br>");
                sb.append("Administrator");
                
                email.setContent(sb.toString());
                EmailUtils.send(email);
                
                request.setAttribute("mess", "Email sent to the email Address. Please check and get your password");
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
    
    public static String generateRandomPassword(int len) {
		String chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghi"
          +"jklmnopqrstuvwxyz!@#$%&";
		Random rnd = new Random();
		StringBuilder sb = new StringBuilder(len);
		for (int i = 0; i < len; i++)
			sb.append(chars.charAt(rnd.nextInt(chars.length())));
		return sb.toString();
	}

}
