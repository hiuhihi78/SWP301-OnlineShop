/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.home;

import dal.FeedbackDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Image;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HandleGetDataController", urlPatterns = {"/handlegetdata"})
public class HandleGetDataController extends HttpServlet {

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

        String action = request.getParameter("action");
        String tempFeedbackId = request.getParameter("feedbackId");
        int feedbackId = Integer.parseInt(tempFeedbackId);
        if (action.trim().equals("getFeedbackImageModal") || action != null) {
            FeedbackDBContext feedbackDB = new FeedbackDBContext();
            ArrayList<Image> images = feedbackDB.getFeedbackImage(feedbackId);
            PrintWriter out = response.getWriter();
            String print = "";

            print += "";

            print += "<div id=\"myCarousel"+ feedbackId +"\" class=\"carousel slide\" data-ride=\"carousel\" style = \"width : 250px;height:300px\">\n";
            print += "<div class=\"close-btn-image\" onclick=\"closeFeedbackImage("+ feedbackId +")\" style='font-size: 20px; color: red;margin-left: 90%;position: absolute; z-index: 100;\n" +
                        "'><i class=\"fa-solid fa-xmark\" ></i></div>\n" +
                        "";
            print += "<ol class=\"carousel-indicators\">\n"
                    + " <li data-target=\"#myCarousel"+feedbackId+"\" data-slide-to=\"0\" class=\"active\"></li>\n";
            for (int i = 1; i < images.size(); i++) {
                print += "<li data-target=\"#myCarousel"+feedbackId+"\" data-slide-to=\"" + i + "\"></li>\n";
            }
            print += "</ol>\n";
            print += "<div class=\"carousel-inner\">\n"
                    + " <div class=\"item active\">\n"
                    + " <img src=\"" + images.get(0).getImage() + "\" alt=\"thumbnail\" style=\"width : 250px;height:300px;\">\n"
                    + " </div>\n";
            for (int i = 1; i < images.size(); i++) {
                print += " <div class=\"item\">\n"
                        + " <img src=\"" + images.get(i).getImage() + "\" alt=\"thumbnail\" style=\"width : 250px;height:300px;\">\n"
                        + " </div>\n";
            }

            print += "<!-- Left and right controls -->\n"
                    + " <a class=\"left carousel-control\" href=\"#myCarousel"+ feedbackId +"\" data-slide=\"prev\">\n"
                    + " <span class=\"glyphicon glyphicon-chevron-left\"></span>\n"
                    + " <span class=\"sr-only\">Previous</span>\n"
                    + " </a>\n"
                    + " <a class=\"right carousel-control\" href=\"#myCarousel"+feedbackId+"\" data-slide=\"next\">\n"
                    + " <span class=\"glyphicon glyphicon-chevron-right\"></span>\n"
                    + " <span class=\"sr-only\">Next</span>\n"
                    + " </a>\n"
                    + " </div>";

            out.println(print);
        }
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
