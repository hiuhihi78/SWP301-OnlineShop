/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.ProductCategoryDBContext;
import dal.ProductListDBContext;
import filter.BaseAuthController;
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
import model.User;

/**
 *
 * @author DELL
 */
@WebServlet(name = "CartCompletionController", urlPatterns = {"/cartCompletion"})
public class CartCompletionController extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductCategoryDBContext productCategoryDBContext = new ProductCategoryDBContext();
        ProductListDBContext productDB = new ProductListDBContext();
        
        //get Parameter value
        String[] listIdProductCart_raw = request.getParameterValues("id");
        String raw_subCategory = request.getParameter("subCategory");
        
        //get list subcategory
        ArrayList<Category> listCategorys = productCategoryDBContext.getAllCategory();

        //check subCategory
        if (raw_subCategory == null || raw_subCategory.length() == 0 || raw_subCategory.equals("-1")) {
            raw_subCategory = "0";
        }
        int subCategory = Integer.parseInt(raw_subCategory);
        int[] listIdProduct = new int[listIdProductCart_raw.length];
        for (int i = 0; i < listIdProductCart_raw.length; i++) {
            listIdProduct[i] = Integer.parseInt(listIdProductCart_raw[i].trim());
            System.out.print(listIdProduct[i] + " ");
        }
        ArrayList<Product> leastProduct = productDB.getListLeastProduct();
        User user = (User)request.getSession().getAttribute("user");
        ArrayList<Product> listProduct = productDB.getListProductById(listIdProduct, user.getId());
        long total = totalPrice(listProduct);
        request.setAttribute("listCategorys", listCategorys);
        request.setAttribute("subCategory", subCategory);
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("leastProduct", leastProduct);
        request.setAttribute("total", total);
        request.getRequestDispatcher("view/public/CartCompletion.jsp").forward(request, response);
    }

    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private long totalPrice(ArrayList<Product> listProduct) {
        long sum = 0;
        for (Product product : listProduct) {
            sum += product.getPrice();
        }
        return sum;
    }

}
