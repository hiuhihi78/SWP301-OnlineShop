/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.common;

import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
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
public class LoginController extends HttpServlet {
    
    public static final int ADMIN_ROLL_ID = 1;
    public static final int MAKETING_ROLL_ID = 2;
    public static final int SALE_ROLL_ID = 3;
    public static final int CUSTOMER_ROLL_ID = 4;
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
        request.getRequestDispatcher("view/public/login.jsp").forward(request, response);     
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
        HttpSession session = request.getSession();
        Object obj = null;
        obj = session.getAttribute("signed");
        if (obj != null) {
            User user = (User) obj;
            request.setAttribute("email", user.getEmail());
            request.setAttribute("password", user.getPassword());
            request.setAttribute("checkbox", "checked");
        }else {
            request.setAttribute("checkbox", "");
        }
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
        String email = "", password = "", check = "";
        User user = null; 
        UserDBContext userDb = new UserDBContext();
        HttpSession session = request.getSession();
        PrintWriter out = response.getWriter();        
        check = request.getParameter("cboSigned");     
        email = request.getParameter("txtEmail");
        password = request.getParameter("txtPassword");
        user = userDb.getUserByEmailAndPassword(email, password);
        if (check != "" && check != null && user != null) {
            session.setAttribute("signed", user);           
        }else {
            session.setAttribute("signed", null);
        }
        
        if (user != null && user.getRole().getId() == ADMIN_ROLL_ID) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Logged in successfully!');");
            out.println("location='dashboard';");
            out.println("</script>");
        }

//        if (obj != null && obj.isIsAdmin() == false && session.getAttribute("cart") != null) {
//            session.setAttribute("user", obj);
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Logged in successfully!');");
//            out.println("location='order';");
//            out.println("</script>");
//        } else if (obj != null && obj.isIsAdmin() == false && !(session.getAttribute("cart") != null)) {
//            session.setAttribute("user", obj);
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Logged in successfully!');");
//            out.println("location='home';");
//            out.println("</script>");
//        } else if (obj != null && obj.isIsAdmin() == true) {
//            session.setAttribute("admin", obj);
//            out.println("<script type=\"text/javascript\">");
//            out.println("alert('Logged in successfully!');");
//            out.println("location='homeAdmin';");
//            out.println("</script>");
//        }
//        else {
//            request.setAttribute("mess", "Login failed!");
//            processRequest(request, response);
//        }
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