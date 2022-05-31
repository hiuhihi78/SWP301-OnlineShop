/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;
import model.Feature;
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

    public LinkedHashMap<Feature, Boolean> getAllowFeatures(int role) {
        String sql = "SELECT [Feature].id, [Feature].url, [Feature].name, [Role_Feature].enable\n"
                + "from [Role]\n"
                + "inner join Role_Feature on [Role].id = Role_Feature.roleId\n"
                + "inner join Feature on [Role_Feature].featureId = [Feature].id\n"
                + "WHERE Role_Feature.roleId = ?";
        try {
            LinkedHashMap<Feature, Boolean> features = new LinkedHashMap<Feature, Boolean>();
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, role);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feature f = new Feature();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setUrl(rs.getString("url"));
                features.put(f, rs.getBoolean("enable"));
            }
            return features;
        } catch (Exception e) {
        }
        return null;
    }
}
