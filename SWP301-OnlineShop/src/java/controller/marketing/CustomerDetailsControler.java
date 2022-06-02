/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.CustomerDBContext;
import filter.BaseAuthController;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;

/**
 *
 * @author Hoang Quang
 */
public class CustomerDetailsControler extends BaseAuthController {

   @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get id from jsp, when user choice to Edit or View
        String raw_customerID = request.getParameter("id");
        //validate input data
        int customerID = Integer.parseInt(raw_customerID);
        //get infomation of that user in database
        CustomerDBContext customerDBContext  = new CustomerDBContext();
        User customer = customerDBContext.getCustomerByID(customerID);
        request.setAttribute("customer", customer);
        //go to customerDetails.jsp
        request.getRequestDispatcher("/view/marketing/customerDetails.jsp").forward(request, response);
    }


    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        //get value after choice Edit
        String raw_id = request.getParameter("customerID");
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String raw_gender = request.getParameter("gender");
        
        //validate value
        int customerID = Integer.parseInt(raw_id);
        boolean gender = raw_gender.equals("male");
        
        User customer = new User();
        customer.setId(customerID);
        customer.setEmail(email);
        customer.setAddress(address);
        customer.setFullname(fullname);
        customer.setGender(gender);
        customer.setMobile(mobile);
        
        CustomerDBContext customerDBContext = new CustomerDBContext();
        customerDBContext.editCustomer(customer);
        response.sendRedirect("../customer/list");
    }
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
