/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Role;

/**
 *
 * @author Admin
 */
public class RoleDBContext extends DBContext {

    public ArrayList<Role> getAllRole() {
        ArrayList<Role> roles = new ArrayList<>();
        String sql = "SELECT [id]\n"
                + "      ,[name]\n"
                + "  FROM [dbo].[Role]";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Role role = new Role();
                role.setId(rs.getInt(1));
                role.setName(rs.getString(2));
                roles.add(role);
            }
        } catch (Exception e) {
        }
        return roles;
    }

    public static void main(String[] args) {
        RoleDBContext db = new RoleDBContext();
        System.out.println(db.getAllRole().size()
        );
    }
}
