package controller.home;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import dal.PostDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Post;
import model.PostCategory;

/**
 *
 * @author DELL
 */
public class PostListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        String page = request.getParameter("page");
        String idCategory_raw = request.getParameter("category");
        String searchContent = request.getParameter("search");
        if(searchContent == null || searchContent.length() == 0) {
            searchContent = "";
        }
        if(idCategory_raw == null || idCategory_raw.length() == 0) {
            idCategory_raw = "-1";
        }
        if(page == null || page.length() == 0) {
            page = "1";
        }
        int idCategory = Integer.parseInt(idCategory_raw);
        PostDBContext postDB = new PostDBContext();
        int pageIndex = Integer.parseInt(page);
        int totalPosts = postDB.numberRowListPost();
        int pageSize = 3;
        int totalPage = (totalPosts % pageSize == 0) ? (totalPosts / pageSize) : ((totalPosts / pageSize) + 1);
        ArrayList<PostCategory> listAllCateogry = postDB.getAllCategory();
        ArrayList<Post> listPostFiltered = postDB.getListPostFiltered(searchContent, idCategory, pageIndex, pageSize);
        request.setAttribute("searchContent", searchContent);
        request.setAttribute("category", idCategory);
        request.setAttribute("totalPage", totalPage);
        request.setAttribute("page", page);
        request.setAttribute("listPostFiltered", listPostFiltered);
        request.setAttribute("listAllCateogry", listAllCateogry);
        request.getRequestDispatcher("view/public/bloglist.jsp").forward(request, response);

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
