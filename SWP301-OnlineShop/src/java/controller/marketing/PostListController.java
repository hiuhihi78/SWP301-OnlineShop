/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.marketing;

import dal.CategoryPostDBContext;
import dal.PostDBContext;
import dal.UserDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.CategoryPost;
import model.Post;
import model.User;

/**
 *
 * @author DELL
 */
@WebServlet(name = "PostListController", urlPatterns = {"/marketing/postlist"})
public class PostListController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idCategoryStr = request.getParameter("category");
//        String idAuthorStr = request.getParameter("author");
        String status = request.getParameter("status");
        String sortBy = request.getParameter("sort");
        String orderBy = request.getParameter("orderBy");
        String searchBy = request.getParameter("search");
        String pageStr = request.getParameter("page");
        
        if(idCategoryStr == null || idCategoryStr.trim().length() == 0) {
            idCategoryStr = "-1";
        }
//        if(idAuthorStr == null || idAuthorStr.trim().length() == 0) {
//            idAuthorStr = "-1";
//        }
        if(status == null || status.trim().length() == 0) {
            status = "-1";  
        }
        if(sortBy == null || sortBy.trim().length() == 0) {
            sortBy = "title";
        }
        if(orderBy == null || orderBy.trim().length() == 0) {
            orderBy = "asc";
        }
        if(searchBy == null || searchBy.trim().length() == 0) {
            searchBy = "";
        }
        if(pageStr == null || pageStr.trim().length() == 0) {
            pageStr = "1";
        }
        PostDBContext postDB = new PostDBContext();
        int idCategory = Integer.parseInt(idCategoryStr);
//        int idAuthor = Integer.parseInt(idAuthorStr);
        int idStatus = Integer.parseInt(status);
        int page = Integer.parseInt(pageStr);
        
        CategoryPostDBContext categoryPostDB = new CategoryPostDBContext();
        UserDBContext userDB = new UserDBContext();
        ArrayList<CategoryPost> listCateogry = categoryPostDB.getAllCategoryPost();
        ArrayList<User> listUserMarketing = userDB.getUserMarketing();
        ArrayList<Post> listPosts = postDB.getAllPostFiltered(idCategory, -1, idStatus, searchBy, sortBy, orderBy);
        int numbersRowPerPage = 5;
        int totalPage = ((listPosts.size() % numbersRowPerPage) == 0)
                ?
                (listPosts.size() / numbersRowPerPage)
                :
                ((listPosts.size() / numbersRowPerPage) + 1);
        int start =(page-1)*numbersRowPerPage;
        int end = Math.min(page * numbersRowPerPage, listPosts.size());
        ArrayList<Post> listPagingFiltered = postDB.listPostPaging(listPosts,start, end);

        request.setAttribute("idCategory", idCategory);
//        request.setAttribute("idAuthor", idAuthor);
        request.setAttribute("idStatus", idStatus);
        request.setAttribute("searchContent", searchBy);
        request.setAttribute("sortBy", sortBy);
        request.setAttribute("orderBy", orderBy);
        request.setAttribute("listPosts", listPagingFiltered);
        request.setAttribute("listCateogry", listCateogry);
        request.setAttribute("listUserMarketing", listUserMarketing);
        request.setAttribute("page", page);
        request.setAttribute("totalPage", totalPage);
        request.getRequestDispatcher("../view/marketing/postList.jsp").forward(request, response);
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
