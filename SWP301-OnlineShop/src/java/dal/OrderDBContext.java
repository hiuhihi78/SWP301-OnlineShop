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
import model.Order;
import model.Product;
import model.Role;
import model.User;

/**
 *
 * @author hoan
 */
public class OrderDBContext extends DBContext {

    public ArrayList<Order> getUserOrders(int uid) {
        try {
            String sql = "SELECT [Order].id as OrderID, [Order].id, totalPrice, [Order].[date], [Order].totalPrice, [Product].[name] as ProductName, [Order].[status] as OrderStatus\n"
                    + "FROM [Order] inner join OrderDetail ON [Order].id = OrderDetail.orderId\n"
                    + "inner join Product ON OrderDetail.productId = Product.id\n"
                    + "WHERE [Order].userId = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, uid);
            ResultSet rs = stm.executeQuery();
            ArrayList<Order> orders = new ArrayList<>();
            while (rs.next()) {
                Order o = new Order();
                o.setId(rs.getInt("OrderID"));
                o.setDate(rs.getDate("date"));
                o.setTotalcost(rs.getDouble("totalPrice"));
                o.setStatus(rs.getInt("OrderStatus"));
                ArrayList<Product> products = new ArrayList<>();
                Product p = new Product();
                p.setName(rs.getString("ProductName"));
                products.add(p);
                o.setProducts(products);
                orders.add(o);
            }
            return orders;
        } catch (SQLException ex) {
            Logger.getLogger(UserDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
}
