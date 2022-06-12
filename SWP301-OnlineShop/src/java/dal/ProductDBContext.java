/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import configs.KeyValuePair;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import model.Product;
import model.SubCategory;
import model.User;

/**
 *
 * @author DELL
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getProductsFeatured() {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            String sql = "Select top 6 * from Product\n"
                    + "where featured = 1 and status = 1 and quantity > 0 \n"
                    + "order by date desc";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getLong(4));
                product.setDiscount(rs.getInt(5));
                User user = new User();
                user.setId(rs.getInt(6));
                product.setUser(user);
                product.setFeatured(rs.getBoolean(7));
                product.setThumbnail(rs.getString(8));
                product.setDate(rs.getDate(9));
                SubCategory subCategory = new SubCategory();
                subCategory.setId(rs.getInt(10));
                product.setSubCategory(subCategory);
                product.setQuantity(rs.getInt(11));
                product.setStatus(rs.getBoolean(12));
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }
    public ArrayList<KeyValuePair> getProductsTrend(Date from, Date to) {
        ArrayList<KeyValuePair> list = new ArrayList<>();
        try {
            String sql = "select p.*, p1.number from product as p,"
                    + " (select top (10) od.productId, sum(od.quantity) as number from OrderDetail as [od] , [Order] as [o] where od.orderId = o.id"
                    + " and o.userid in (select id from [User] where MONTH(dateCreated) = MONTH(GETDATE()) and YEAR(dateCreated) = YEAR(GETDATE()))";
            if (from != null) {
                sql += " and o.[date] >= '" + from + "'";
            }
            if (to != null) {
                sql += " and o.[date] <= '" + to + "'";
            }
            if (from == null && to == null) {
                sql += " and o.[date] >= DATEADD(day,-7, GETDATE())";
            }
            sql += " group by  od.productId";
            sql += " order by number desc) as p1 where p.id = p1.productId";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getLong(4));
                product.setDiscount(rs.getInt(5));
                User user = new User();
                user.setId(rs.getInt(6));
                product.setUser(user);
                product.setFeatured(rs.getBoolean(7));
                product.setThumbnail(rs.getString(8));
                product.setDate(rs.getDate(9));
                SubCategory subCategory = new SubCategory();
                subCategory.setId(rs.getInt(10));
                product.setSubCategory(subCategory);
                product.setQuantity(rs.getInt(11));
                product.setStatus(rs.getBoolean(12));
                list.add(new KeyValuePair(product, rs.getInt("number")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getProductNumber() {
        int productNumber = 0;
        try {
            String sql = "select COUNT(*) num from product";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                productNumber = rs.getInt("num");
            }
        } catch (SQLException e) {
        }
        return productNumber;
    }
    
    public static void main(String[] args) {
        ProductDBContext db = new ProductDBContext();
        ArrayList<KeyValuePair> list = db.getProductsTrend(null, null);
        for (KeyValuePair keyValuePair : list) {
            System.out.println("Name: " + keyValuePair.getKey().getName() + "\tNumber: " + keyValuePair.getValue());
        }
    }

    public ArrayList<KeyValuePair> getProductsTrend(java.util.Date from, java.util.Date to) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
