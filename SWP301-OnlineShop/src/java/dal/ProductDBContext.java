/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
                    + "where featured = 1 \n"
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
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }

}
