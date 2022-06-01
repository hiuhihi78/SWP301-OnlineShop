/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

    public ArrayList<Feature> getPublicFeature() {
        String sql = "SELECT id, [name], [url] FROM Feature\n"
                + "WHERE isPublic = 1";
        try {
            ArrayList<Feature> publicFeatures = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(sql);;
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feature f = new Feature();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setUrl(rs.getString("url"));
                publicFeatures.add(f);
            }
            return publicFeatures;
        } catch (Exception e) {
        }
        return null;
    }

    public ArrayList<Feature> getFeatureByGroup(String groupName) {
        String sql = "SELECT [Feature].[id]\n"
                + "      ,[Feature].[name]\n"
                + "      ,[url]\n"
                + "      ,[isPublic]\n"
                + "	  ,[Feature_Group].[name]\n"
                + "  FROM [dbo].[Feature] inner join [Feature_Group] on [Feature].groupID = [Feature_Group].id\n"
                + "  WHERE Feature_Group.[name] = ?";
        try {
            ArrayList<Feature> features = new ArrayList<>();
            PreparedStatement ps = connection.prepareStatement(sql);;
            ps.setString(1, groupName);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feature f = new Feature();
                f.setId(rs.getInt("id"));
                f.setName(rs.getString("name"));
                f.setUrl(rs.getString("url"));
                features.add(f);
            }
            return features;
        } catch (Exception e) {
        }
        return null;
    }

    public void insertNewRole(String[] permissionID, String roleName) throws SQLException {    
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Role]\n"
                    + "           ([status]\n"
                    + "           ,[name])\n"
                    + "     VALUES\n"
                    + "           (1, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, roleName);
            ps.executeUpdate();
            String sql1 = "Select @@IDENTITY as roleId";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet r = ps1.executeQuery();
            int roleID = -1;
            if(r.next())
            {
               roleID = r.getInt("roleId");
            }
            String sql2 = "INSERT INTO [dbo].[Role_Feature]\n"
                    + "           ([roleId]\n"
                    + "           ,[enable]\n"
                    + "           ,[featureId])\n"
                    + "     VALUES\n"
                    + "           (?, 1, ?)";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            System.out.println(sql2);
            for(String permission : permissionID)
            {
                System.out.println(permission);
                ps2.setInt(1, roleID);
                ps2.setInt(2, Integer.parseInt(permission));
                ps2.executeUpdate();
            }
            connection.commit();
        } catch (SQLException e) {
            e.printStackTrace();
            connection.rollback();
        }
        finally{
            connection.setAutoCommit(true);
            connection.close();
        }
    }
}
