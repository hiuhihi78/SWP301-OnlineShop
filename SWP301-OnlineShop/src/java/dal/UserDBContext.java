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
                + "      ,[status]\n"
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
                    + "      ,[status]\n"
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
                sql += " and status = ?\n";
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
<<<<<<< HEAD

    public User login(String username, String password) {
        String sql = "SELECT [User].id"
                + "         ,[username] "
                + "       ,[fullname]\n"
                + "      ,[gender]\n"
                + "      ,[email]\n"
                + "      ,[mobile]\n"
                + "      ,[address]\n"
                + "      ,[roleId]\n"
                + "      ,Role.name\n"
                + "      ,[user].[status]\n"
                + "  FROM [User] join Role on roleId = Role.id"
                + "       WHERE username = ? AND password = ?";
        
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setFullname(rs.getString(3));
                user.setGender(rs.getBoolean(4));
                user.setEmail(rs.getString(5));
                user.setMobile(rs.getString(6));
                user.setAddress(rs.getString(7));
                
                Role role = new Role();
                role.setId(rs.getInt(8));
                role.setName(rs.getString(9));
                role.setAllowFeatures(new RoleDBContext().getAllowFeatures(role.getId()));
                
                user.setRole(role);
                user.setStatus(rs.getBoolean(10));
                return user;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
=======
    
    public User getUserByEmailAndPassword(String email, String password) {  
        User user = null;
        try {
            String sql = "select u.*, r.name rname from [User] u, [role] r where email = ? and password = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt("id"),
                        rs.getString("password"), 
                        rs.getString("avatar"), 
                        rs.getString("email"), 
                        rs.getString("fullname"),
                        rs.getBoolean("gender"), 
                        rs.getString("mobile"),
                        rs.getString("address"),
                        rs.getBoolean("Status"));
                
               user.setRole(new Role(rs.getInt("roleId"), rs.getString("rname")));
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public User getUserByEmail(String email) {  
        User user = null;
        try {
            String sql = "select u.*, r.name rname from [User] u, [role] r where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, email);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                user = new User(rs.getInt("id"),
                        rs.getString("password"), 
                        rs.getString("avatar"), 
                        rs.getString("email"), 
                        rs.getString("fullname"),
                        rs.getBoolean("gender"), 
                        rs.getString("mobile"),
                        rs.getString("address"),
                        rs.getBoolean("Status"));
                
               user.setRole(new Role(rs.getInt("roleId"), rs.getString("rname")));
            }
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public boolean updateUser(User user) {
        try {
            String sql = "update [User] set password=? where email = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setString(1, user.getPassword());
            stm.setString(2, user.getEmail());

            return stm.executeUpdate() > 0;
        } catch (Exception ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return false;
    }

    
    
    
    
    
     public static void main(String[] args) {
        UserDBContext db = new UserDBContext();
//        User u =  db.getUserByEmail("leduchieu2001x@gmail.com");
//         System.out.println(u.getFullname());
    User u = new User();
    u.setId(11);
    u.setEmail("lbada2001x@gmail.com");
    u.setPassword("abc");
    u.setRole(new Role(1, "admin"));
    db.updateUser(u);
    
        
>>>>>>> 6a0acfc0e8f1f1eed079f6a275b85c5625ff74f8
    }
}
