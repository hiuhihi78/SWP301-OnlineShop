/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

/**
 *
 * @author DELL
 */
public class UserDBContext extends DBContext {

    public User getUserById(int id) {
        try {
            String sql = "Select * From [User]\n"
                    + "Where id = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setPassword(rs.getString(2));
                user.setAvatar(rs.getString(3));
                user.setFullname(rs.getString(4));
                user.setGender(rs.getBoolean(5));
                user.setMobile(rs.getString(6));
                user.setAddress(rs.getString(7));
                Role role = new Role();
                role.setId(rs.getInt(8));
                user.setRole(role);
                user.setStatus(rs.getBoolean(9));
                user.setUsername(rs.getString(10));
                user.setEmail(rs.getString(11));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
