/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Post;
import model.CategoryPost;
import model.SubCategoryPost;
import model.User;

/**
 *
 * @author DELL
 */
public class PostDBContext extends DBContext {

    public ArrayList<Post> getHotPost() {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "select top 3 * from Post\n"
                    + "where feature = 1 and status = 1\n"
                    + "order by dateUpdated desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt(1));
                post.setThumbnail(rs.getString(2));
                post.setTitle(rs.getString(3));
                SubCategoryPost category = new SubCategoryPost();
                category.setId(rs.getInt(4));
                post.setPostCategory(category);
                post.setBriefInfo(rs.getString(5));
                post.setDescription(rs.getString(6));
                post.setFeatured(rs.getBoolean(7));
                post.setDate(rs.getDate(8));
                post.setStatus(rs.getBoolean(9));
                User user = new User();
                user.setId(rs.getInt(10));
                post.setUser(user);
                listPost.add(post);
            }
        } catch (SQLException e) {
        }
        return listPost;
    }

    public ArrayList<Post> getLatestPost() {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "select top 3 * from Post\n"
                    + "where status = 1\n"
                    + "order by dateUpdated desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt(1));
                post.setThumbnail(rs.getString(2));
                post.setTitle(rs.getString(3));
                SubCategoryPost category = new SubCategoryPost();
                category.setId(rs.getInt(4));
                post.setPostCategory(category);
                post.setBriefInfo(rs.getString(5));
                post.setDescription(rs.getString(6));
                post.setFeatured(rs.getBoolean(7));
                post.setDate(rs.getDate(8));
                post.setStatus(rs.getBoolean(9));
                User user = new User();
                user.setId(rs.getInt(10));
                post.setUser(user);
                listPost.add(post);
            }
        } catch (SQLException e) {
        }
        return listPost;
    }

    public ArrayList<Post> getListPostFiltered(String searchContent, int idSubCategory, int pageIndex, int pageSize) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "Select * from\n"
                    + "(Select p.*, c.name, c.idcategory , ROW_NUMBER() over(order by dateUpdated DESC) as row_index\n"
                    + "from Post p join SubCategoryPost c\n"
                    + "on p.categoryId = c.id and p.status = 1\n";
            if (idSubCategory != -1) {
                sql += "and p.categoryId = ? "; 
            }
            if (!searchContent.isEmpty()) {
                sql += "and (p.title like ? or p.briefInfo like ?)"; 
            }
            sql += ") PostPaging\n"
                    + "where row_index >= (?-1)*?+1 and row_index <= ? * ?"; 

            PreparedStatement stm = connection.prepareStatement(sql);
            if (idSubCategory != -1 && searchContent.trim().isEmpty()) {
                stm.setInt(1, idSubCategory);
                stm.setInt(2, pageIndex);
                stm.setInt(3, pageSize);
                stm.setInt(4, pageIndex);
                stm.setInt(5, pageSize);
            } else if (idSubCategory == -1 && !searchContent.trim().isEmpty()) {
                stm.setString(1, "%" + searchContent + "%");
                stm.setString(2, "%" + searchContent + "%");
                stm.setInt(3, pageIndex);
                stm.setInt(4, pageSize);
                stm.setInt(5, pageIndex);
                stm.setInt(6, pageSize);
            } else if (idSubCategory == -1 && searchContent.trim().isEmpty()) {
                stm.setInt(1, pageIndex);
                stm.setInt(2, pageSize);
                stm.setInt(3, pageIndex);
                stm.setInt(4, pageSize);
            } else {
                stm.setInt(1, idSubCategory);
                stm.setString(2, "%" + searchContent + "%");
                stm.setString(3, "%" + searchContent + "%");
                stm.setInt(4, pageIndex);
                stm.setInt(5, pageSize);
                stm.setInt(6, pageIndex);
                stm.setInt(7, pageSize);
            }
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setId(rs.getInt(1));
                post.setThumbnail(rs.getString(2));
                post.setTitle(rs.getString(3));
                SubCategoryPost subCategory = new SubCategoryPost();
                subCategory.setId(rs.getInt(4));
                post.setBriefInfo(rs.getString(5));
                post.setDescription(rs.getString(6));
                post.setFeatured(rs.getBoolean(7));
                post.setDate(rs.getDate(8));
                post.setStatus(rs.getBoolean(9));
                User user = new UserDBContext().findUserById(rs.getInt(10));
                subCategory.setName(rs.getString(11));
                CategoryPost categoryPost = new CategoryPost();
                categoryPost.setId(rs.getInt(12));
                subCategory.setCategory(categoryPost);
                post.setPostCategory(subCategory);
                if(user == null) {
                    post.setUser(new User());
                } else {
                    post.setUser(user);
                }
                listPost.add(post);
            }
        } catch (SQLException e) {
        }
        return listPost;
    }

    public int numberRowListPost(String searchContent, int idCategory) {
        try {
            String sql = "Select count(*) as numberRow from Post\n";
            if (!searchContent.trim().isEmpty() && idCategory == -1) {
                sql += "where (title like ? or briefInfo like ?)";
            } else if (searchContent.trim().isEmpty() && idCategory != -1) {
                sql += "where categoryId = ?";
            }else if(!searchContent.trim().isEmpty() && idCategory != -1) {
                sql += "where (title like ? or briefInfo like ?) and categoryId = ?";
            }

            PreparedStatement stm = connection.prepareStatement(sql);

            if (!searchContent.trim().isEmpty() && idCategory == -1) {
                stm.setString(1, "%" + searchContent + "%");
                stm.setString(2, "%" + searchContent + "%");
            } else if (searchContent.trim().isEmpty() && idCategory != -1) {
                stm.setInt(1, idCategory);
            } else if(!searchContent.trim().isEmpty() && idCategory != -1) {
                stm.setString(1, "%" + searchContent + "%");
                stm.setString(2, "%" + searchContent + "%");
                stm.setInt(3, idCategory);
            }
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public ArrayList<CategoryPost> getAllCategory() {
        ArrayList<CategoryPost> listCategory = new ArrayList<>();
        try {
            String sql = "Select id, name from CategoryPost";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                CategoryPost category = new CategoryPost();
                category.setId(rs.getInt(1));
                category.setName(rs.getString(2));
                ArrayList<SubCategoryPost> listSubPost = getListSubPostById(rs.getInt(1));
                category.setListSubPost(listSubPost);
                listCategory.add(category);
            }
        } catch (SQLException e) {
        }
        return listCategory;
    }
    public ArrayList<SubCategoryPost> getListSubPostById(int idCategory) {
        ArrayList<SubCategoryPost> listCategory = new ArrayList<>();
        try {
            String sql = "Select * from SubCategoryPost Where idCategory = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, idCategory);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                SubCategoryPost subCategory = new SubCategoryPost();
                subCategory.setId(rs.getInt(1));
                subCategory.setName(rs.getString(2));
                listCategory.add(subCategory);
            }
        } catch (SQLException e) {
        }
        return listCategory;
    }

    public Post getPostById(int id) {
        String sql = "SELECT Post.id\n"
                + "	  ,[thumbnail]\n"
                + "      ,[title]\n"
                + "      ,[briefInfo]\n"
                + "      ,[description]\n"
                + "      ,[feature]\n"
                + "      ,[dateUpdated]\n"
                + "      ,Post.[status]\n"
                + "      ,[UserId]\n"
                + "	  ,[User].fullname\n"
                + "	  ,SubCategoryPost.id\n"
                + "	  ,SubCategoryPost.name\n"
                + "  FROM [dbo].[Post] join SubCategoryPost on Post.categoryId = SubCategoryPost.id\n"
                + "					join [User] on Post.UserId = [User].id\n"
                + "  WHERE Post.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                Post post = new Post();
                User user = new User();
                SubCategoryPost postCategory = new SubCategoryPost();
                post.setId(rs.getInt(1));
                post.setThumbnail(rs.getString(2));
                post.setTitle(rs.getString(3));
                post.setBriefInfo(rs.getString(4));
                post.setDescription(rs.getString(5));
                post.setFeatured(rs.getBoolean(6));
                post.setDate(rs.getDate(7));
                post.setStatus(rs.getBoolean(8));
                user.setId(rs.getInt(9));
                user.setFullname(rs.getString(10));
                post.setUser(user);
                postCategory.setId(rs.getInt(11));
                postCategory.setName(rs.getString(12));
                post.setPostCategory(postCategory);
                        
                return post;
            }
        } catch (SQLException ex) {
            Logger.getLogger(PostDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public int getPostNumber() {
        int postNumber = 0;
        try {
            String sql = "select COUNT(*) num from post";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                postNumber = rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return postNumber;
    }
    
    public static void main(String[] args) {
        PostDBContext db =new PostDBContext();
        System.out.println(db.getPostNumber());
    }
}
