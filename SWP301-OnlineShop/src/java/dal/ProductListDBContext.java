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
import model.Cart;
import model.Feedback;
import model.Product;
import model.User;

/**
 *
 * @author Hoang Quang
 */
public class ProductListDBContext extends DBContext {

    public Product getLeastProduct() {
        String sql = "select top 2 * from [Product] \n"
                + "where status = 1 \n"
                + "order by [date] desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getLong("price"));
                product.setDiscount(rs.getInt("discount"));
                product.setThumbnail(rs.getString("thumbnail"));
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public ArrayList<Product> getListLeastProduct() {
        ArrayList<Product> listProduct = new ArrayList<>();
        String sql = "select top 3 * from [Product] \n"
                + "where status = 1 and quantity > 0 \n"
                + "order by [date] desc, id desc";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getLong("price"));
                product.setDiscount(rs.getInt("discount"));
                product.setThumbnail(rs.getString("thumbnail"));
                listProduct.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProduct;
    }

    public int countSizeOfListProduct(String searchBy, int subCategory) {
        try {

            String sql1 = "with x as (select ROW_NUMBER() OVER (ORDER BY id desc, date desc) as r\n"
                    + ", * from [Product] where status = 1 AND quantity >0 \n"
                    + "                                    AND (name like ? \n"
                    + "					        OR description like ? )\n"
                    + "						)\n"
                    + "SElECT COUNT(*) as Total FROM x ";
            if (subCategory > 0) {
                sql1 += "WHERE  subCategoryId = ?";
            }

            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setString(1, "%" + searchBy + "%");
            ps.setString(2, "%" + searchBy + "%");
            if (subCategory > 0) {
                ps.setInt(3, subCategory);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Product> getListProductsPagging(String searchBy, int subCategory, int pageindex, int pagesize) {
        ArrayList<Product> listProdcuts = new ArrayList<>();
        String sql1 = "";

        if (subCategory > 0) {
            sql1 = " with x as (select ROW_NUMBER() OVER (ORDER BY date desc, id desc) as r\n"
                    + "                    		, * from [Product] where status = 1 and  quantity >0 and subCategoryId = ? \n"
                    + "					AND (name like ? \n"
                    + "					 OR description like ? ))\n"
                    + "                    		SElECT* FROM x where r between (?  - 1)* ? +1 and ? * ? ";
        }
        if (subCategory == 0) {
            sql1 = " with x as (select ROW_NUMBER() OVER (ORDER BY date desc, id desc) as r\n"
                    + "                    		, * from [Product] where status = 1 and  quantity >0 \n"
                    + "					AND (name like ? \n"
                    + "					 OR description like ? ))\n"
                    + "                    		SElECT* FROM x where r between (?  - 1)* ? +1 and ? * ? ";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            if (subCategory > 0) {
                ps.setInt(1, subCategory);
                ps.setString(2, "%" + searchBy + "%");
                ps.setString(3, "%" + searchBy + "%");
                ps.setInt(4, pageindex);
                ps.setInt(5, pagesize);
                ps.setInt(6, pageindex);
                ps.setInt(7, pagesize);
            }
            if (subCategory == 0) {
                ps.setString(1, "%" + searchBy + "%");
                ps.setString(2, "%" + searchBy + "%");
                ps.setInt(3, pageindex);
                ps.setInt(4, pagesize);
                ps.setInt(5, pageindex);
                ps.setInt(6, pagesize);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setDescription(rs.getString("description"));
                product.setPrice(rs.getLong("price"));
                product.setDiscount(rs.getInt("discount"));
                product.setThumbnail(rs.getString("thumbnail"));
                listProdcuts.add(product);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listProdcuts;
    }

    public Product getProductByID(int productID) {
        String sql = "SELECT p.id, p.[name], p.[description], p.price, p.discount, p.thumbnail , p.quantity , p.sellerId,u.id, u.fullname \n"
                + "FROM Product p INNER JOIN [User] u\n"
                + "ON p.sellerId = u.id\n"
                + "WHERE p.id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt(1));
                product.setName(rs.getString(2));
                product.setDescription(rs.getString(3));
                product.setPrice(rs.getLong(4));
                product.setDiscount(rs.getInt(5));
                product.setThumbnail(rs.getString(6));
                product.setQuantity(rs.getInt(7));
                User user = new User();
                user.setId(rs.getInt(9));
                user.setFullname(rs.getString(10));
                product.setUser(user);
                return product;
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public int countSizeOfFeedback(int productID) {
        try {

            String sql1 = " with x as (select ROW_NUMBER() OVER (ORDER BY f.id desc) as r\n"
                    + "                    		, f.id, f.userId, f.productId, f.start,f.comment ,f.image, f.status, u.fullname from Feedback f INNER JOIN [User] u\n"
                    + "							ON f.userId = u.id\n"
                    + "							where f.status = 1\n"
                    + "							AND f.productId = ? )\n"
                    + "                    		SElECT COUNT(*) as Total FROM x ";

            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, productID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Feedback> getListFeedbackByProductID(int productID, int pageindex, int pagesize) {
        ArrayList<Feedback> listFeedbacks = new ArrayList<>();
        String sql1 = " with x as (select ROW_NUMBER() OVER (ORDER BY f.id desc) as r\n"
                + "                    		, f.id, f.userId, f.productId, f.start,f.comment ,f.image, f.status, u.fullname from Feedback f INNER JOIN [User] u\n"
                + "							ON f.userId = u.id\n"
                + "							where f.status = 1\n"
                + "							AND f.productId = ? )\n"
                + "                    		SElECT* FROM x where r between (? - 1)* ? +1 and ? * ?  ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, productID);
            ps.setInt(2, pageindex);
            ps.setInt(3, pagesize);
            ps.setInt(4, pageindex);
            ps.setInt(5, pagesize);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Feedback feedback = new Feedback();
                feedback.setId(rs.getInt("id"));
                User user = new User();
                user.setId(rs.getInt("userId"));
                user.setFullname(rs.getString("fullname"));
                feedback.setUser(user);
                Product product = new Product();
                product.setId(rs.getInt("productId"));
                feedback.setProduct(product);
                feedback.setComment(rs.getString("comment"));
                feedback.setStart(rs.getInt("start"));
                listFeedbacks.add(feedback);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listFeedbacks;
    }

    public ArrayList<Cart> getAllProductIdInCart() {
        ArrayList<Cart> listCarts = new ArrayList<>();
        String sql1 = " select * from cart  ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql1);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Product product = new Product();
                product.setId(rs.getInt("productId"));

                User userBuyId = new User();
                userBuyId.setId(rs.getInt("userBuyId"));

                Cart cart = new Cart();
                cart.setProduct(product);
                cart.setUserBuy(userBuyId);
                listCarts.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCarts;
    }

    public void editQuantityOrderOfCart(int quantityOrder, int productId, int userBuyId) {
        String spl1 = " UPDATE [dbo].[Cart]\n"
                + "   SET [quantityOrder] = ? \n"
                + "      \n"
                + " WHERE userBuyId = ? and productId = ? ";
        PreparedStatement stm = null;
        try {
            stm = connection.prepareStatement(spl1);
            stm.setInt(1, quantityOrder);
            stm.setInt(2, userBuyId);
            stm.setInt(3, productId);
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public void addNewCartInfomation(Cart cart) {
        String sql = " INSERT INTO [dbo].[Cart]\n"
                + "           ([productId]\n"
                + "           ,[productName]\n"
                + "           ,[quantityOrder]\n"
                + "           ,[price]\n"
                + "           ,[userBuyId]\n"
                + "           ,[sellerId]\n"
                + "           ,[thumbnail])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?) ";
        PreparedStatement stm = null;

        try {
            stm = connection.prepareStatement(sql);
            stm.setInt(1, cart.getProduct().getId());
            stm.setString(2, cart.getProduct().getName());
            stm.setInt(3, cart.getQuantityOrder());
            stm.setLong(4, cart.getPrice());
            stm.setInt(5, cart.getUserBuy().getId());
            stm.setInt(6, cart.getUserSeller().getId());
            stm.setString(7, cart.getThumbnail());
            stm.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
            if (connection != null) {
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(ProductListDBContext.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    }
