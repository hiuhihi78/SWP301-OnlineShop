/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Role;
import model.User;

/**
 *
 * @author Hoang Quang
 */
public class CustomerDBContext extends DBContext {

    public ArrayList<User> getListCustomer(int userRole, String searchBy, String statusBy) {
        ArrayList<User> listCustomer = new ArrayList<>();
        String sql1 = "SELECT [fullname] ,[password],[gender], [email], [mobile],[address] ,[roleId] ,Role.name ,[User].[status] ,[User].id\n"
                + "FROM [User] join Role on roleId = Role.id\n"
                + "WHERE roleId = ?\n"
                + "AND   \n"
                + "(fullname like ?\n"
                + "OR email LIKE ?\n"
                + "OR mobile LIKE ?)";
        //check status is empty or not
        if (!statusBy.isEmpty()) {
            sql1 += "AND [User].status LIKE ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            //check status is empty or not
            if (!statusBy.isEmpty()) {
                ps.setInt(1, userRole);
                ps.setString(2, "%" + searchBy + "%");
                ps.setString(3, "%" + searchBy + "%");
                ps.setString(4, "%" + searchBy + "%");
                ps.setString(5, "%" + statusBy + "%");

            } else {
                ps.setInt(1, userRole);
                ps.setString(2, "%" + searchBy + "%");
                ps.setString(3, "%" + searchBy + "%");
                ps.setString(4, "%" + searchBy + "%");
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
                listCustomer.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCustomer;
    }

    public User getCustomerByID(int customerID) {
        String sql = "SELECT [fullname]\n"
                + "                      ,[password]\n"
                + "                      ,[gender]\n"
                + "                      ,[email]\n"
                + "                      ,[mobile]\n"
                + "                      ,[address]\n"
                + "                      ,[roleId]\n"
                + "                      ,Role.name\n"
                + "                      ,[User].[status]\n"
                + "                      ,[User].id\n"
                + "                  FROM [User] join Role on roleId = Role.id\n"
                + "                WHERE [User].id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                User customer = new User();
                customer.setFullname(rs.getString(1));
                customer.setGender(rs.getBoolean(3));
                customer.setEmail(rs.getString(4));
                customer.setMobile(rs.getString(5));
                customer.setAddress(rs.getString(6));
                Role role = new Role();
                role.setId(rs.getInt(7));
                role.setName(rs.getString(8));
                customer.setRole(role);
                customer.setStatus(rs.getBoolean(9));
                customer.setId(rs.getInt(10));
                return customer;
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void editCustomer(User customer) {
        String sql = "UPDATE [dbo].[User] \n"
                + "SET [fullname] = ?\n"
                + "      ,[gender] = ?\n"
                + "      ,[mobile] = ?\n"
                + "      ,[address] = ?\n"
                + "      ,[email] = ?\n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, customer.getFullname());
            stm.setBoolean(2, customer.isGender());
            stm.setString(3, customer.getMobile());
            stm.setString(4, customer.getAddress());
            stm.setString(5, customer.getEmail());
            stm.setInt(6, customer.getId());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void addCustomer(User cusomter) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([password]\n"
                + "           ,[avatar]\n"
                + "           ,[fullname]\n"
                + "           ,[gender]\n"
                + "           ,[mobile]\n"
                + "           ,[address]\n"
                + "           ,[roleId]\n"
                + "           ,[status]\n"
                + "           ,[email])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(sql);
            stm.setString(1, cusomter.getPassword());
            stm.setString(2, cusomter.getAvatar());
            stm.setString(3, cusomter.getFullname());
            stm.setBoolean(4, cusomter.isGender());
            stm.setString(5, cusomter.getMobile());
            stm.setString(6, cusomter.getAddress());
            stm.setInt(7, cusomter.getRole().getId());
            stm.setBoolean(8, cusomter.isStatus());
            stm.setString(9, cusomter.getEmail());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void editStatus(int id, boolean status) {
        String spl1 = "UPDATE [dbo].[User]\n"
                + "   SET [status] = ?\n"
                + " WHERE id = ?";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(spl1);
            stm.setInt(2, id);
            stm.setBoolean(1, status);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public ArrayList<User> getListCustomerSortBy(ArrayList<User> listCustomer2, String sortBy) {
        //check list customer is empty or not
        if (!listCustomer2.isEmpty()) {
            //sort by fullname
            if (sortBy.equals("fullname")) {
                Collections.sort(listCustomer2, new Comparator<User>() {
                    @Override
                    public int compare(User o1, User o2) {
                        return o1.getFullname().compareTo(o2.getFullname());
                    }
                });
            }
            //sort by email
            if (sortBy.equals("email")) {
                Collections.sort(listCustomer2, new Comparator<User>() {
                    @Override
                    public int compare(User o1, User o2) {
                        return o1.getEmail().compareTo(o2.getEmail());
                    }
                });
            }
            //sort by mobile
            if (sortBy.equals("mobile")) {
                Collections.sort(listCustomer2, new Comparator<User>() {
                    @Override
                    public int compare(User o1, User o2) {
                        return o1.getMobile().compareTo(o2.getMobile());
                    }
                });
            }
            //sort by mobile
            if (sortBy.equals("status")) {
                Collections.sort(listCustomer2, new Comparator<User>() {
                    @Override
                    public int compare(User o1, User o2) {
                        boolean b1 = o1.isStatus();
                        boolean b2 = o2.isStatus();
                        if (b1 == !b2) {
                            return 1;
                        }
                        if (!b1 == b2) {
                            return -1;
                        }
                        return 0;
                    }
                });
            }
        }
        return listCustomer2;
    }

    

    public int count(int userRole) {
        try {
            String sql = "SELECT count(*) as Total FROM [User] WHERE [User].RoleId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, userRole);
            ResultSet rs = stm.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<User> getCustomerByPage(int userRole, String searchBy, String statusBy, int pageindex, int pagesize) {
        ArrayList<User> listCustomer = new ArrayList<>();
        String sql1 = "SELECT * FROM (SELECT *,ROW_NUMBER() OVER (ORDER BY [User].id desc) as row_index FROM [User]) userList\n"
                + "                    WHERE row_index >= (? - 1)* ? +1 AND row_index <= ? * ?\n"
                + "					AND roleId = ?\n"
                + "                AND  \n"
                + "               (fullname like ?\n"
                + "                OR email LIKE ?\n"
                + "                OR mobile LIKE ?)";
        //check status is empty or not
        if (!statusBy.isEmpty()) {
            sql1 += "AND status = ?";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            //check status is empty or not
            ps.setInt(1, pageindex);
            ps.setInt(2, pagesize);
            ps.setInt(3, pageindex);
            ps.setInt(4, pagesize);
            ps.setInt(5, userRole);
            ps.setString(6, "%" + searchBy + "%");
            ps.setString(7, "%" + searchBy + "%");
            ps.setString(8, "%" + searchBy + "%");
            if (!statusBy.isEmpty()) {
                ps.setString(9, statusBy);

            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User();
                user.setFullname(rs.getString("fullname"));
                user.setGender(rs.getBoolean("gender"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("mobile"));
                user.setAddress(rs.getString("address"));
                Role role = new Role();
                role.setId(rs.getInt("roleId"));
                user.setRole(role);
                user.setStatus(rs.getBoolean("status"));
                user.setId(rs.getInt("id"));
                listCustomer.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCustomer;
    }
}
