/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
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

    public Product addProduct(String name, String description, int sellerId, int subCategoryId, long price, int discount, long quantity, boolean featured, boolean status) {

        Product product = new Product();
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Product]\n"
                    + "           ([name]\n"
                    + "           ,[description]\n"
                    + "           ,[price]\n"
                    + "           ,[discount]\n"
                    + "           ,[sellerId]\n"
                    + "           ,[featured]\n"
                    + "           ,[date]\n"
                    + "           ,[subCategoryId]\n"
                    + "           ,[quantity]\n"
                    + "           ,[status])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, name);
            ps.setString(2, description);
            ps.setLong(3, price);
            ps.setInt(4, discount);
            ps.setInt(5, sellerId);
            ps.setBoolean(6, featured);
            //
            java.util.Date date = new java.util.Date();
            Timestamp current = new Timestamp(date.getTime());
            ps.setTimestamp(7, current);
            //
            ps.setInt(8, subCategoryId);
            ps.setFloat(9, quantity);
            ps.setBoolean(10, status);
            ps.executeUpdate();

            int id = 0;
            String sql1 = "Select @@IDENTITY as productId";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                id = rs.getInt(1);
            }

            product.setId(id);

            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return product;
    }

    public void updateThumbnailProduct(int productId, String fileUrl) {
        try {
            String sql = "UPDATE [dbo].[Product]\n"
                    + "   SET \n"
                    + "      [thumbnail] = ?\n"
                    + " WHERE id = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fileUrl);
            ps.setInt(2, productId);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void addAttachedImageProduct(int productId, String fileUrl) {
        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Image]\n"
                    + "           ([image])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, fileUrl);
            ps.executeUpdate();

            int imgId = 0;
            String sql1 = "Select @@IDENTITY as imageId";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                imgId = rs.getInt(1);
            }

            String sql2 = "INSERT INTO [dbo].[Product_Image]\n"
                    + "           ([productId]\n"
                    + "           ,[imageId])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?)";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, productId);
            ps2.setInt(2, imgId);
            ps2.executeUpdate();
            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ProductDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
    
    public static void main(String[] args) {
        new ProductDBContext().addAttachedImageProduct(1, "daw");
    }

}
