/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.ProductCategoryDBContext;
import dal.ProductListDBContext;
import java.io.IOException;
import java.io.PrintWriter;
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
 * @author DELL
 */
@WebServlet(name = "CartCompletionController", urlPatterns = {"/cartCompletion"})
public class CartCompletionController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductCategoryDBContext productCategoryDBContext = new ProductCategoryDBContext();
        ProductListDBContext productListDBContext = new ProductListDBContext();
        
        //get Parameter value
        String searchBy = request.getParameter("searchBy");
        String raw_subCategory = request.getParameter("subCategory");
        String page = request.getParameter("page");
        
        System.out.println(searchBy);
        System.out.println("---");
        
        //get list subcategory
        ArrayList<Category> listCategorys = productCategoryDBContext.getAllCategory();

        //get least post
        ArrayList<Product> leastProduct = productListDBContext.getListLeastProduct();

        //get list product sort by date
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pagesize = 9;
        int pageindex = Integer.parseInt(page);

        //check search
        if (searchBy == null || searchBy.length() == 0 || searchBy.equals("-1")) {
            searchBy = "";
        }
        //check subCategory
        if (raw_subCategory == null || raw_subCategory.length() == 0 || raw_subCategory.equals("-1")) {
            raw_subCategory = "0";
        }
        int subCategory = Integer.parseInt(raw_subCategory);
        
        int numofrecords = productListDBContext.countSizeOfListProduct(searchBy, subCategory);
        int totalpage = (numofrecords % pagesize == 0) ? (numofrecords / pagesize)
                : (numofrecords / pagesize) + 1;

        ArrayList<Product> listProducts = productListDBContext.getListProductsPagging(searchBy, subCategory, pageindex, pagesize);
        
        
        request.setAttribute("listCategorys", listCategorys);
        request.setAttribute("leastProduct", leastProduct);
        request.setAttribute("listProducts", listProducts);
        request.setAttribute("searchBy", searchBy);
        request.setAttribute("subCategory", subCategory);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("view/public/CartCompletion.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
