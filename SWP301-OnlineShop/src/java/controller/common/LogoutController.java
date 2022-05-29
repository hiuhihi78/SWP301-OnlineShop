/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.common;

import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

/**
 *
 * @author Admin
 */
public class LogoutController extends HttpServlet {

<<<<<<< HEAD:SWP301-OnlineShop/src/java/controller/user/LoginController.java
=======
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
        response.sendRedirect("home");
    }

>>>>>>> 6a0acfc0e8f1f1eed079f6a275b85c5625ff74f8:SWP301-OnlineShop/src/java/controller/common/LogoutController.java
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
<<<<<<< HEAD:SWP301-OnlineShop/src/java/controller/user/LoginController.java
        /*HttpSession session = request.getSession();
        if (session.getAttribute("checked") != null) {

        }*/
        response.setContentType("text/html;charset=UTF-8");
        request.getRequestDispatcher("./view/public/login.jsp").forward(request, response);

=======
        HttpSession session = request.getSession();
        session.setAttribute("user", null);
        processRequest(request, response);
>>>>>>> 6a0acfc0e8f1f1eed079f6a275b85c5625ff74f8:SWP301-OnlineShop/src/java/controller/common/LogoutController.java
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
<<<<<<< HEAD:SWP301-OnlineShop/src/java/controller/user/LoginController.java
        String username = "", pass = "";
        username = request.getParameter("username");
        pass = request.getParameter("password");
        UserDBContext userDB = new UserDBContext();
        User u = userDB.login(username, pass);
        if (u != null) {
            request.getSession().setAttribute("user", u);
           request.getRequestDispatcher("./view/test/dashboard.jsp").forward(request, response);
        } else {
            response.getWriter().println("Login failed");
        }
=======
        processRequest(request, response);
>>>>>>> 6a0acfc0e8f1f1eed079f6a275b85c5625ff74f8:SWP301-OnlineShop/src/java/controller/common/LogoutController.java
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
