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
import model.Role;
import model.User;

/**
 *
 * @author Hoang Quang
 */
public class AddCustomerControler extends BaseAuthController {

    @Override
    protected void processGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/view/marketing/addCustomer.jsp").forward(request, response);
    }

//xin chào các b?n nha    
    @Override
    protected void processPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
//        String avatar = request.getParameter("avatar");
        String password = "abc";
        String fullname = request.getParameter("fullname");
        String email = request.getParameter("email");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String raw_id = request.getParameter("roleID");
        String raw_gender = request.getParameter("gender");
        String raw_status = request.getParameter("status");

        //validate value
        int roleId = Integer.parseInt(raw_id);
        boolean gender = raw_gender.equals("male");
        boolean status = raw_status.equals("active");

        User cusomter = new User();
        cusomter.setPassword(password);
        cusomter.setFullname(fullname);
        cusomter.setEmail(email);
        cusomter.setMobile(mobile);
        cusomter.setAddress(address);
        Role role = new Role();
        role.setId(roleId);
        cusomter.setRole(role);
        cusomter.setGender(gender);
        cusomter.setStatus(status);

        CustomerDBContext customerDBContext = new CustomerDBContext();
        customerDBContext.addCustomer(cusomter);

        response.sendRedirect("../customer/list");
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
