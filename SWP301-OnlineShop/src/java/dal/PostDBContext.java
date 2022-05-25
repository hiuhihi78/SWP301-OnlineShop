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

/**
 *
 * @author DELL
 */
public class PostDBContext extends DBContext {

    public ArrayList<Post> getHotPost() {
        ArrayList<Post> listPost = new ArrayList<>();
        try {
            String sql = "";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Post post = new Post();

                listPost.add(post);
            }
        } catch (SQLException e) {
        }
        return listPost;
    }

}
