/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Post;
import model.PostCategory;
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
                PostCategory category = new PostCategory();
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
                PostCategory category = new PostCategory();
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

    public ArrayList<Post> getListPostFiltered(String searchContent, int idCategory, int pageIndex, int pageSize) {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "Select * from\n"
                    + "(Select p.* , ROW_NUMBER() over(order by dateUpdated DESC) as row_index\n"
                    + "from Post p join PostCategory c\n"
                    + "on p.categoryId = c.id and p.status = 1\n";
            if (idCategory != -1) {
                sql += "and p.categoryId = ? "; 
            }
            if (!searchContent.isEmpty()) {
                sql += "and (p.title like ? or p.briefInfo like ?)"; 
            }
            sql += ") PostPaging\n"
                    + "where row_index >= (?-1)*?+1 and row_index <= ? * ?"; 

            PreparedStatement stm = connection.prepareStatement(sql);
            if (idCategory != -1 && searchContent.trim().isEmpty()) {
                stm.setInt(1, idCategory);
                stm.setInt(2, pageIndex);
                stm.setInt(3, pageSize);
                stm.setInt(4, pageIndex);
                stm.setInt(5, pageSize);
            } else if (idCategory == -1 && !searchContent.trim().isEmpty()) {
                stm.setString(1, "%" + searchContent + "%");
                stm.setString(2, "%" + searchContent + "%");
                stm.setInt(3, pageIndex);
                stm.setInt(4, pageSize);
                stm.setInt(5, pageIndex);
                stm.setInt(6, pageSize);
            } else if (idCategory == -1 && searchContent.trim().isEmpty()) {
                stm.setInt(1, pageIndex);
                stm.setInt(2, pageSize);
                stm.setInt(3, pageIndex);
                stm.setInt(4, pageSize);
            } else {
                stm.setInt(1, idCategory);
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
                PostCategory category = new PostCategory();
                category.setId(rs.getInt(4));
                post.setBriefInfo(rs.getString(5));
                post.setDescription(rs.getString(6));
                post.setFeatured(rs.getBoolean(7));
                post.setDate(rs.getDate(8));
                post.setStatus(rs.getBoolean(9));
                User user = new UserDBContext().getUserById(rs.getInt(10));
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

    public ArrayList<PostCategory> getAllCategory() {
        ArrayList<PostCategory> listCategory = new ArrayList<>();
        try {
            String sql = "Select id, name from PostCategory";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                PostCategory category = new PostCategory();
                category.setId(rs.getInt("id"));
                category.setName(rs.getString("name"));
                listCategory.add(category);
            }
        } catch (SQLException e) {
        }
        return listCategory;
    }

}
