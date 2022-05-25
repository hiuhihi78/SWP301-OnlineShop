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

/**
 *
 * @author DELL
 */
public class ProductDBContext extends DBContext {

    public ArrayList<Product> getProductsFeatured() {
        ArrayList<Product> listProduct = new ArrayList<>();
        try {
            String sql = "";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while(rs.next()) {
                Product product = new Product();
                
                listProduct.add(product);
            }
        } catch (SQLException e) {
        }
        return listProduct;
    }
    
}
