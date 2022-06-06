/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.CategoryDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Category;
import model.SubCategory;

/**
 *
 * @author Admin
 */
@WebServlet(name = "AddNewProductController", urlPatterns = {"/marketing/addproduct"})
public class AddNewProductController extends HttpServlet {

    

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
        CategoryDBContext categoryDB = new CategoryDBContext();
        ArrayList<Category> categorys = categoryDB.getAllCategory();
        String tempCategoryId = request.getParameter("categoryId");
        int categoryId;
        if(tempCategoryId == null){
            categoryId = categorys.get(0).getId()  ;
        }else{
            categoryId = Integer.parseInt(tempCategoryId);
        }
        ArrayList<SubCategory> subCatgorys = categoryDB.getSubCatgory(categoryId);
        request.setAttribute("categorys", categorys);
        request.setAttribute("subCategorys", subCatgorys);
        request.getRequestDispatcher("../view/marketing/addNewProduct.jsp").forward(request, response);
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
