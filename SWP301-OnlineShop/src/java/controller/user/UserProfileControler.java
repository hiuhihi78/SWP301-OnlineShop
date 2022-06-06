/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

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
 * @author Hoang Quang
 */
public class UserProfileControler extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //get infomation by id of user
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        //get id of user after login here...
        User user = (User) session.getAttribute("user");
        //get infomation of user
        UserDBContext userDBContext = new UserDBContext();
        User userProfile = userDBContext.getUserByIDLogin(user.getId());
        request.setAttribute("user", userProfile);

        request.getRequestDispatcher("/view/public/userProfile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        //get paramester
        String raw_id = request.getParameter("id");
        String fullname = request.getParameter("fullname");
        String mobile = request.getParameter("mobile");
        String address = request.getParameter("address");
        String raw_gender = request.getParameter("gender");

        //validate value
        int id = Integer.parseInt(raw_id);
        boolean gender = raw_gender.equals("male");

        User user = new User();
        user.setId(id);
        user.setAddress(address);
        user.setFullname(fullname);
        user.setGender(gender);
        user.setMobile(mobile);
        //edit in db
        UserDBContext userDBContext = new UserDBContext();
        userDBContext.editUserProfile(user);
        //home
        //LINK HOME HERE
//        response.sendRedirect(".....");
        response.sendRedirect("../user/profile");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
