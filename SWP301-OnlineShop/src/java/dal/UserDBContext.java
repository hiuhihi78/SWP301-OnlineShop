/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

/**
 *
 * @author Admin
 */
public class UserDBContext extends DBContext {

    public ArrayList<User> getAllUser() {
        ArrayList<User> users = new ArrayList<>();
        String sql = "SELECT [fullname]\n"
                + "      ,[password]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[mobile]\n"
                + "      ,[address]\n"
                + "      ,[roleId]\n"
                + "      ,Role.name\n"
                + "      ,[User].[status]\n"
                + "      ,[User].id\n"
                + "  FROM [User] join Role on roleId = Role.id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setFullname(rs.getString(1));
                user.setGender(rs.getBoolean(3));
                user.setEmail(rs.getString(4));
                user.setMobile(rs.getString(5));
                user.setAddress(rs.getString(6));
                Role role = new Role();
                role.setId(rs.getInt(7));
                role.setName(rs.getString(8));
                user.setRole(role);
                user.setStatus(rs.getBoolean(9));
                user.setId(rs.getInt(10));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public ArrayList<User> getListByPage(ArrayList<User> list, int start, int end) {
        ArrayList<User> arr = new ArrayList<>();
        for (int i = start; i < end; i++) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public ArrayList<User> getListUserFilter(int roleId, String gender, String status, String search) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "SELECT [fullname]\n"
                    + "      ,[password]\n"
                    + "      ,[gender]\n"
                    + "      ,[email]\n"
                    + "      ,[mobile]\n"
                    + "      ,[address]\n"
                    + "      ,[roleId]\n"
                    + "      ,Role.name\n"
                    + "      ,[User].[status]\n"
                    + "      ,[User].id\n"
                    + "  FROM [User] join Role on roleId = Role.id\n"
                    + "  WHERE (1=1)\n";
            int paramIndex = 0;
            HashMap<Integer, Object[]> params = new HashMap<>();
            if (roleId != 0) {
                sql += " and roleId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = roleId;
                params.put(paramIndex, param);
            }
            if (!gender.equals("all")) {
                sql += " and gender = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getName();
                param[1] = gender.equals("male");
                params.put(paramIndex, param);
            }
            if (!status.equals("all")) {
                sql += " and [User].[status] = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getName();
                param[1] = status.equals("active");
                params.put(paramIndex, param);
            }

            if (!search.equals("")) {
                sql += " and (fullname like ?\n"
                        + "or email like ?\n"
                        + "or mobile like ?)\n";
                paramIndex++;
                Object[] paramUsername = new Object[2];
                paramUsername[0] = String.class.getName();
                paramUsername[1] = "%" + search + "%";
                params.put(paramIndex, paramUsername);
                paramIndex++;
                Object[] paramEmail = new Object[2];
                paramEmail[0] = String.class.getName();
                paramEmail[1] = "%" + search + "%";
                params.put(paramIndex, paramEmail);
                paramIndex++;
                Object[] paramMobile = new Object[2];
                paramMobile[0] = String.class.getName();
                paramMobile[1] = "%" + search + "%";
                params.put(paramIndex, paramMobile);
            }

            PreparedStatement ps = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    ps.setInt(index, (Integer) value[1]);
                }
                if (type.equals(Boolean.class.getName())) {
                    ps.setBoolean(index, (Boolean) value[1]);
                }
                if (type.equals(String.class.getName())) {
                    ps.setString(index, (String) value[1]);
                }
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setFullname(rs.getString(1));
                user.setGender(rs.getBoolean(3));
                user.setEmail(rs.getString(4));
                user.setMobile(rs.getString(5));
                user.setAddress(rs.getString(6));
                Role role = new Role();
                role.setId(rs.getInt(7));
                role.setName(rs.getString(8));
                user.setRole(role);
                user.setStatus(rs.getBoolean(9));
                user.setId(rs.getInt(10));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;
    }

    public void changeStatus(int id, boolean status) {
        try {
            String sql = "UPDATE [dbo].[User]\n"
                    + "   SET [status] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ArrayList<User> getListUserFilter(int roleId, String gender, String status, String search, String sort, String orderBy) {
        ArrayList<User> users = new ArrayList<>();
        try {
            String sql = "DECLARE @Col_Name VARCHAR(128) = " + "'" + sort + "'" + "\n";
            sql += "SELECT [fullname]\n"
                    + "      ,[password]\n"
                    + "      ,[gender]\n"
                    + "      ,[email]\n"
                    + "      ,[mobile]\n"
                    + "      ,[address]\n"
                    + "      ,[roleId]\n"
                    + "      ,Role.name\n"
                    + "      ,[User].[status]\n"
                    + "      ,[User].id\n"
                    + "  FROM [User] join [Role] on roleId = [Role].id\n"
                    + "  WHERE (1=1)\n";
            int paramIndex = 0;
            HashMap<Integer, Object[]> params = new HashMap<>();
            if (roleId != 0) {
                sql += " and roleId = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Integer.class.getName();
                param[1] = roleId;
                params.put(paramIndex, param);
            }
            if (!gender.equals("all")) {
                sql += " and gender = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getName();
                param[1] = gender.equals("male");
                params.put(paramIndex, param);
            }
            if (!status.equals("all")) {
                sql += " and [User].status = ?\n";
                paramIndex++;
                Object[] param = new Object[2];
                param[0] = Boolean.class.getName();
                param[1] = status.equals("active");
                params.put(paramIndex, param);
            }

            if (!search.equals("")) {
                sql += " and (fullname like ?\n"
                        + "or email like ?\n"
                        + "or mobile like ?)\n";
                paramIndex++;
                Object[] paramUsername = new Object[2];
                paramUsername[0] = String.class.getName();
                paramUsername[1] = "%" + search + "%";
                params.put(paramIndex, paramUsername);
                paramIndex++;
                Object[] paramEmail = new Object[2];
                paramEmail[0] = String.class.getName();
                paramEmail[1] = "%" + search + "%";
                params.put(paramIndex, paramEmail);
                paramIndex++;
                Object[] paramMobile = new Object[2];
                paramMobile[0] = String.class.getName();
                paramMobile[1] = "%" + search + "%";
                params.put(paramIndex, paramMobile);
            }
            // sort
            sql += "ORDER BY CASE \n"
                    + "    WHEN @Col_Name = 'id' THEN CAST([User].id AS SQL_VARIANT)\n"
                    + "    WHEN @Col_Name = 'fullname' THEN CAST(fullname AS SQL_VARIANT)\n"
                    + "    WHEN @Col_Name = 'gender' THEN CAST(gender AS SQL_VARIANT)\n"
                    + "    WHEN @Col_Name = 'email' THEN CAST(email AS SQL_VARIANT)\n"
                    + "    WHEN @Col_Name = 'mobile' THEN CAST(mobile AS SQL_VARIANT)\n"
                    + "    WHEN @Col_Name = 'role' THEN CAST(roleId AS SQL_VARIANT)\n"
                    + "    WHEN @Col_Name = 'status' THEN CAST([User].status AS SQL_VARIANT)"
                    + " END " + orderBy;

            PreparedStatement ps = connection.prepareStatement(sql);
            for (Map.Entry<Integer, Object[]> entry : params.entrySet()) {
                Integer index = entry.getKey();
                Object[] value = entry.getValue();
                String type = value[0].toString();
                if (type.equals(Integer.class.getName())) {
                    ps.setInt(index, (Integer) value[1]);
                }
                if (type.equals(Boolean.class.getName())) {
                    ps.setBoolean(index, (Boolean) value[1]);
                }
                if (type.equals(String.class.getName())) {
                    ps.setString(index, (String) value[1]);
                }
            }
            System.out.println(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setFullname(rs.getString(1));
                user.setGender(rs.getBoolean(3));
                user.setEmail(rs.getString(4));
                user.setMobile(rs.getString(5));
                user.setAddress(rs.getString(6));
                Role role = new Role();
                role.setId(rs.getInt(7));
                role.setName(rs.getString(8));
                user.setRole(role);
                user.setStatus(rs.getBoolean(9));
                user.setId(rs.getInt(10));
                users.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return users;

    }

    public User getUserById(int id) throws IOException {
        String sql = "SELECT [fullname]\n"
                + "	  ,[gender]\n"
                + "      ,[avatar]\n"
                + "      ,[email]\n"
                + "      ,[mobile]\n"
                + "      ,[address]\n"
                + "      ,[roleId]\n"
                + "	  ,[Role].[name]\n"
                + "      ,[User].[status]\n"
                + "  FROM [dbo].[User] join  [Role] on [User].roleId  = [Role].id\n"
                + "  WHERE [User].id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setFullname(rs.getString(1));
                u.setGender(rs.getBoolean(2));
                //setting image
                String base64Image = null;
                Blob blob = rs.getBlob(3);
                if (blob != null) {
                    InputStream inputStream = blob.getBinaryStream();
                    ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                    byte[] buffer = new byte[4096];
                    int bytesRead = -1;
                    while ((bytesRead = inputStream.read(buffer)) != -1) {
                        outputStream.write(buffer, 0, bytesRead);
                    }
                    byte[] imageBytes = outputStream.toByteArray();
                    base64Image = Base64.getEncoder().encodeToString(imageBytes);
                    inputStream.close();
                    outputStream.close();
                } else {
                    base64Image = "default";
                }
                u.setAvatar(base64Image);
                //
                u.setEmail(rs.getString(4));
                u.setMobile(rs.getString(5));
                u.setAddress(rs.getString(6));
                Role role = new Role();
                role.setId(rs.getInt(7));
                role.setName(rs.getString(8));
                u.setRole(role);
                u.setStatus(rs.getBoolean(9));
                u.setId(id);
                return u;

            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editUserProfile(int id, int roleId, boolean status) {
        try {
            String sql = "UPDATE [User]\n"
                    + "   SET \n"
                    + "      [status] = ?\n"
                    + "      ,roleId = ?\n"
                    + " WHERE id= ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setBoolean(1, status);
            ps.setInt(2, roleId);
            ps.setInt(3, id);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void main(String[] args) {
        UserDBContext db = new UserDBContext();
//        for (User u : db.getListUserFilter(1, "male", "all", "", "id", "asc")) {
//            System.out.println(u);
//        }
//        for(User u : db.getAllUser()){
//            System.out.println(u);
//        }
////        
    }

    public boolean checkEmailOrMobileExisted(String email, String mobile) {String sql = "SELECT *\n"
                + "FROM [User]\n"
                + "WHERE email = ? or mobile = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, mobile);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return true;
            } else {
                return false;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    public void inserUser(String name, String password, boolean gender, String email, String mobile, String address, int role, boolean status) {
        try {
            String sql = "INSERT INTO [dbo].[User]\n"
                    + "           ([fullname]\n"
                    + "           ,[password]\n"
                    + "           ,[gender]\n"
                    + "           ,[email]\n"
                    + "           ,[mobile]\n"
                    + "           ,[address]\n"
                    + "           ,[roleId]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, password);
            ps.setBoolean(3, gender);
            ps.setString(4, email);
            ps.setString(5, mobile);
            ps.setString(6, address);
            ps.setInt(7, role);
            ps.setBoolean(8, status);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
