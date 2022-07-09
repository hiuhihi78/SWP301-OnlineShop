/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import configs.KeyValuePair;
import configs.KeyValuePair1;
import static configs.Security.CUSTOMER_ROLL_ID;
import dal.CartDBContext;
import dal.CustomerDBContext;
import dal.FeedbackDBContext;
import dal.OrderDBContext;
import dal.PostDBContext;
import dal.ProductDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Admin
 */
public class MarketingDashboardController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response, Date from, Date to)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        CustomerDBContext cusDb = new CustomerDBContext();
        ProductDBContext proDb = new ProductDBContext();
        PostDBContext posDb = new PostDBContext();
        FeedbackDBContext feedDb = new FeedbackDBContext();
        OrderDBContext orderDb = new OrderDBContext();
        
        //Get number
        int customerNumber = cusDb.count(CUSTOMER_ROLL_ID);
        int productNumber = proDb.getProductNumber();
        int postNumber = posDb.getPostNumber();
        int feedbackNumber = feedDb.getFeedbackNumber();
        
        //Get list
        ArrayList<KeyValuePair1> list = proDb.getProductsTrend(from, to);
        List<KeyValuePair1> lstUserTop3 = orderDb.getTop3BestCustomer();
        
        //Set attribute
        request.setAttribute("customerNumber", customerNumber);
        request.setAttribute("productNumber", productNumber);
        request.setAttribute("postNumber", postNumber);
        request.setAttribute("feedbackNumber", feedbackNumber);
        request.setAttribute("list", list);
        request.setAttribute("lstUserTop3", lstUserTop3);

        request.getRequestDispatcher("/view/marketing/dashboard.jsp").forward(request, response);
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

        processRequest(request, response, null, null);
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
     
            String strStart = request.getParameter("txtStart");
            String strEnd = request.getParameter("txtEnd");
            DateFormat df = new SimpleDateFormat("yyyy/MM/dd");
            java.sql.Date s = java.sql.Date.valueOf(strStart);
            java.sql.Date e = java.sql.Date.valueOf(strEnd);

        processRequest(request, response, s, e);
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
