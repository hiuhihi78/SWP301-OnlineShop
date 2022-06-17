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
import javax.servlet.http.HttpSession;
import model.Cart;
import model.Category;
import model.Feedback;
import model.Product;
import model.User;

/**
 *
 * @author Hoang Quang
 */
@WebServlet(name = "ProductDetailsControler", urlPatterns = {"/productdetails"})
public class ProductDetailsControler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductCategoryDBContext productCategoryDBContext = new ProductCategoryDBContext();
        ProductListDBContext productListDBContext = new ProductListDBContext();

        //get list subcategory
        ArrayList<Category> listCategorys = productCategoryDBContext.getAllCategory();

        //get least post
        ArrayList<Product> leastProduct = productListDBContext.getListLeastProduct();

        //GET PRODUCT DETAILS, FEEDBACK OF THAT PRODUCT
        //get value from jsp
        String raw_productID = request.getParameter("productID");
        String page = request.getParameter("page");

        // validate value
        int productID = Integer.parseInt(raw_productID);

        //get list product sort by date
        if (page == null || page.trim().length() == 0) {
            page = "1";
        }
        int pagesize = 5;
        int pageindex = Integer.parseInt(page);

        //get pageSize
        int numofrecords = productListDBContext.countSizeOfFeedback(productID);
        int totalpage = (numofrecords % pagesize == 0) ? (numofrecords / pagesize)
                : (numofrecords / pagesize) + 1;

        //get product with that id
        Product productInfomation = productListDBContext.getProductByID(productID);
        //get all feedback of that product
        ArrayList<Feedback> listFeedbacks = productListDBContext.getListFeedbackByProductID(productID, pageindex, pagesize);

        //check value
        System.out.println(numofrecords);
        System.out.println(listFeedbacks.size());

        //pass to jsp
        request.setAttribute("productInfomation", productInfomation);
        request.setAttribute("listCategorys", listCategorys);
        request.setAttribute("listFeedbacks", listFeedbacks);
        request.setAttribute("leastProduct", leastProduct);
        request.setAttribute("pagesize", pagesize);
        request.setAttribute("pageindex", pageindex);
        request.setAttribute("totalpage", totalpage);
        request.getRequestDispatcher("/view/public/productDetails.jsp").forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductListDBContext productListDBContext = new ProductListDBContext();
        HttpSession session = request.getSession();

        //get user Id
        User user = (User) session.getAttribute("user");
        int userBuyId = user.getId();
//        int userBuyId = 76;

        //get value from form
//        <input type = "hidden" value = "${product.id}" name = "productId"
//                > <input type = "hidden" value = "${product.name}" name = "productName"
//                > <input type = "hidden" value = "${product.quantity}" name = "quantity"
//                > <input type = "hidden" value = "${product.priceDiscount}" name = "price"
//                > <input type = "hidden" value = "${product.user.id}" name = "sellerId"
//                > <input type = "hidden" value = "${product.thumbnail}" name = "thumbnail" >

        String productName = request.getParameter("productName");
        String raw_productId = request.getParameter("productId");
        String raw_quantity = request.getParameter("quantity");
        String raw_quantityOrder = request.getParameter("quantityOrder");
        String raw_price = request.getParameter("price");
        String raw_sellerId = request.getParameter("sellerId");
        String thumbnail  = request.getParameter("thumbnail");
        
        //validate value
        int productId = Integer.parseInt(raw_productId);
        int quantity = Integer.parseInt(raw_quantity);
        int quantityOrder = Integer.parseInt(raw_quantityOrder);
        long price = Integer.parseInt(raw_price);
        int sellerId = Integer.parseInt(raw_sellerId);
        
        Product product = new Product();
        product.setId(productId);
        product.setName(productName);
        
        Cart cart = new Cart();
        cart.setProduct(product);
        cart.setQuantityOrder(quantityOrder);
        cart.setPrice(price);

        User userBuyId2 = new User();
        userBuyId2.setId(userBuyId);
        
        cart.setUserBuy(userBuyId2);
        
        User userSeller = new User();
        userSeller.setId(sellerId);
        
        cart.setUserSeller(userSeller);
        cart.setThumbnail(thumbnail);
        
        //check userBuyId exist or not
        //if exist, tang so quantity order, tang gia theo gia moi nhat
        //if not, add new information
        boolean check = true;
        ArrayList<Cart> productIdList = productListDBContext.getAllProductIdInCart();
        for (Cart cartlist : productIdList) {
            //check userBuyId exist or not
            if(cartlist.getUserBuy().getId() == userBuyId && cartlist.getProduct().getId() == productId ){
                //update infomation here
                productListDBContext.editQuantityOrderOfCart(quantityOrder, productId, userBuyId);
                check = false;
            }
        }
        //if dont have any userBuyId in list, add new infomation
        if(check){
            productListDBContext.addNewCartInfomation(cart);
        }
        
        response.sendRedirect("cartlist");
        
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
