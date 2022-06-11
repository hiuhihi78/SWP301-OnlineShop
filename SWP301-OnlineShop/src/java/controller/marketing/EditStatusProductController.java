/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.ProductDBContext;
import filter.BaseAuthController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
@WebServlet(name = "EditStatusProductController", urlPatterns = {"/marketing/editStatusProduct"})
public class EditStatusProductController extends BaseAuthController {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductDBContext productDB = new ProductDBContext();
        boolean status = request.getParameter("newStatus").equals("active");
        int id = Integer.parseInt(request.getParameter("id"));
        String xpage = request.getParameter("xpage");
        productDB.changeStatus(id, status);
        if (xpage == null) {
            xpage = "1";
        } else {
            xpage = request.getParameter("xpage");
        }
//        request.setAttribute("xpage", xpage);
//        request.setAttribute("alter", "Update status sucess");
//        request.getRequestDispatcher("userList");
        response.sendRedirect("productlist?alter=Update status sucess!&search=" + id);
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
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
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
