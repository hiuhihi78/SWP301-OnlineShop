/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import dal.ProductCategoryDBContext;
import dal.ProductListDBContext;
import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.Product;

/**
 *
 * @author Hoang Quang
 */
@WebServlet(name = "OrderInformationControler", urlPatterns = {"/orderInfor"})
public class OrderInformationControler extends HttpServlet {

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

        ProductCategoryDBContext productCategoryDBContext = new ProductCategoryDBContext();
        ProductListDBContext productListDBContext = new ProductListDBContext();
        //get list subcategory
        ArrayList<Category> listCategorys = productCategoryDBContext.getAllCategory();
        //get least post
        ArrayList<Product> leastProduct = productListDBContext.getListLeastProduct();

        //GET SIDER INFOR
        //GET ORDER ID, ORDER DATE
        //GET RECIVER INFOR OF USER
        //GET LIST ORDER BY ORDER ID
        
        
        request.setAttribute("listCategorys", listCategorys);
        request.setAttribute("leastProduct", leastProduct);
        request.getRequestDispatcher("/view/public/orderInfor.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
