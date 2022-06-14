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
import model.Category;
import model.Revenue;
import model.SubCategory;

/**
 *
 * @author Admin
 */
public class DashboardDBContext extends DBContext {

    public int getCancelledOrders() {
        String sql = "select count(*) as CancelledOrders from [Order] where [status] = 0";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int cancelledCount = rs.getInt("CancelledOrders");
                return cancelledCount;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getProcessingOrders() {
        String sql = "select count(*) as ProcessingOrders from [Order] where [status] = 1";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int processingCount = rs.getInt("ProcessingOrders");
                return processingCount;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public int getSuccessOrders() {
        String sql = "select count(*) as SuccessOrders from [Order] where [status] = 2";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int successCount = rs.getInt("SuccessOrders");
                return successCount;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Revenue> getRevenueByProductCategory() {
        String sql = "with t as\n"
                + "(\n"
                + "select Category.id as CategoryID, SUM([Product].price) as totalPrice \n"
                + "from [Order] inner join [OrderDetail] on [Order].id = [OrderDetail].orderId\n"
                + "inner join Product on [OrderDetail].productId = [Product].id\n"
                + "inner join SubCategory on Product.subCategoryId = SubCategory.id\n"
                + "inner join Category on SubCategory.categoryId = Category.id\n"
                + "where [Order].[status] = 2\n"
                + "group by Category.id\n"
                + ")\n"
                + "select Category.id, isnull(t.totalPrice, 0) as totalPrice, Category.[name] from t right outer join [Category] on Category.id = t.CategoryID";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            ArrayList<Revenue> re = new ArrayList<>();
            while (rs.next()) {
                Revenue r = new Revenue();
                r.setCategoryid(rs.getInt("id"));
                r.setRevenue(rs.getInt("totalPrice"));
                r.setCategoryname(rs.getString("name"));
                re.add(r);

            }
            return re;
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int getTotalRevenue() {
        String sql = "select SUM([Order].totalPrice) as totalRevenue \n"
                + "from [Order] inner join [OrderDetail] on [Order].id = [OrderDetail].orderId\n"
                + "inner join Product on [OrderDetail].productId = [Product].id\n"
                + "inner join SubCategory on Product.subCategoryId = SubCategory.id\n"
                + "inner join Category on SubCategory.categoryId = Category.id\n"
                + "where [Order].[status] = 2\n"
                + "group by Category.id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                int totalRevenue = rs.getInt("totalRevenue");
                return totalRevenue;
            }
        } catch (SQLException ex) {
            Logger.getLogger(DashboardDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }
}
