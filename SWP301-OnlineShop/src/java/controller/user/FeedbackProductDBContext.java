/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.user;

import configs.UploadImage;
import static configs.UploadImage.extractFileName;
import static controller.marketing.AddNewPostController.SAVE_DIRECTORY;
import controller.marketing.PostListController;
import dal.FeedbackDBContext;
import dal.OrderDBContext;
import dal.ProductCategoryDBContext;
import dal.ProductListDBContext;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
import model.Category;
import model.Order;
import model.Product;
import model.User;

/**
 *
 * @author Hoang Quang
 */
@WebServlet(name = "FeedbackProductDBContext", urlPatterns = {"/feedbackProduct"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 30, // 30MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class FeedbackProductDBContext extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final long serialVersionUID = 1L;

    public static final String SAVE_DIRECTORY = "img";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        ProductCategoryDBContext productCategoryDBContext = new ProductCategoryDBContext();
        ProductListDBContext productListDBContext = new ProductListDBContext();
        OrderDBContext orderDBContext = new OrderDBContext();
        
        int productID = Integer.parseInt(request.getParameter("productID"));
        System.out.println("ProductID " + productID);
        request.setAttribute("productID", productID);
        
        //get value from request
        String raw_orderID = request.getParameter("orderID");
        //validate value
        int orderID = Integer.parseInt(raw_orderID);

        //GET SIDER INFOR
        //get list subcategory
        ArrayList<Category> listCategorys = productCategoryDBContext.getAllCategory();
        //get least post
        ArrayList<Product> leastProduct = productListDBContext.getListLeastProduct();

        //GET ORDER ID, ORDER DATE, Total, status
        Order informationOrder = orderDBContext.getInformationOfOrderByID(orderID);
        //GET RECIVER INFOR OF USER
        User userOrderInfioramtion = orderDBContext.getUserOrderInformation(orderID);
        //GET LIST ORDERED BY ORDER ID
        ArrayList<Product> listOrderProductOfUser = orderDBContext.getListOrderProductOfUser(orderID);

        String alter = request.getParameter("alter");
        request.setAttribute("alter", alter);
        request.setAttribute("listOrderProductOfUser", listOrderProductOfUser);
        request.setAttribute("informationOrder", informationOrder);
        request.setAttribute("userOrderInfioramtion", userOrderInfioramtion);
        request.setAttribute("listCategorys", listCategorys);
        request.setAttribute("leastProduct", leastProduct);
        request.getRequestDispatcher("/view/public/feedbackForProduct.jsp").forward(request, response);
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

//        String fullname = request.getParameter("fullname");
//        boolean gender = request.getParameter("gender").equals("Male");
//        String email = request.getParameter("email");
//        String mobile = request.getParameter("mobile");

        int userID = Integer.parseInt(request.getParameter("userID"));
        int productID = Integer.parseInt(request.getParameter("productID"));
        int star = Integer.parseInt(request.getParameter("star"));
        String commnent = request.getParameter("commnet").trim();
        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("uuuu/MM/dd");
        LocalDate localDate = LocalDate.now();
        Date dateNow = Date.valueOf(dtf.format(localDate).replaceAll("/", "-"));
        boolean status = true;

        FeedbackDBContext feedbackDB = new FeedbackDBContext();

        // Đường dẫn tuyệt đối tới thư mục gốc của web app.
        String appPath = request.getServletContext().getRealPath("");
        appPath = appPath.replace('\\', '/');
        int indexFolderRoot = appPath.indexOf("/build");
        appPath = appPath.substring(0, indexFolderRoot) + "/web/assets/";
        // Thư mục để save file tải lên.
        String fullSavePath = null;
        if (appPath.endsWith("/")) {
            fullSavePath = appPath + SAVE_DIRECTORY;
        } else {
            fullSavePath = appPath + "/" + SAVE_DIRECTORY;
        }

        // Tạo thư mục nếu nó không tồn tại.
        File fileSaveDir = new File(fullSavePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        Part partAttachedImg1 = request.getPart("attachedImg1");
        String fileAttachedImg1 = extractFileName(partAttachedImg1, fullSavePath);
        if (fileAttachedImg1 != null && fileAttachedImg1.length() > 0) {
            String filePath = fullSavePath + File.separator + fileAttachedImg1;
            System.out.println("Write attachment to file: " + filePath);
            // Ghi vào file.
            partAttachedImg1.write(filePath);
            String fileUrl = "/assets/img/" + fileAttachedImg1;
            System.out.println("File: " + fileUrl);
            feedbackDB.addFeedback(userID, productID, star, commnent, fileUrl ,status, dateNow );
        }

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
