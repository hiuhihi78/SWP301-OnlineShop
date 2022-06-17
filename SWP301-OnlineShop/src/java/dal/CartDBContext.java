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
import model.Product;
import model.User;

/**
 *
 * @author Hoang Quang
 */
public class CartDBContext extends DBContext {

    public ArrayList<Cart> getListCartByUserID(int userID, int pageindex, int pagesize) {
        ArrayList<Cart> listCarts = new ArrayList<>();
        String sql = " with x as (select ROW_NUMBER() OVER (ORDER BY id desc) as r\n"
                + "                    		, * from Cart WHERE userBuyId = ? )\n"
                + "                    		SElECT* FROM x where r between (? - 1)* ? +1 and ? * ?  ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userID);
            ps.setInt(2, pageindex);
            ps.setInt(3, pagesize);
            ps.setInt(4, pageindex);
            ps.setInt(5, pagesize);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));

                Product product = new Product();
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                cart.setProduct(product);

                cart.setPrice(rs.getLong("price"));

                User userBuy = new User();
                userBuy.setId(rs.getInt("userBuyId"));
                cart.setUserBuy(userBuy);

                User userSeller = new User();
                userSeller.setId(rs.getInt("sellerId"));
                cart.setUserSeller(userSeller);

                cart.setThumbnail(rs.getString("thumbnail"));
                cart.setQuantityOrder(rs.getInt("quantityOrder"));

                listCarts.add(cart);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return listCarts;
    }

    public int countTotalOfListCart(int userID) {
        try {

            String sql1 = "with x as (select ROW_NUMBER() OVER (ORDER BY id desc) as r\n"
                    + "                    		, * from Cart WHERE userBuyId = ? )\n"
                    + "					SElECT COUNT(*) as Total FROM x ";

            PreparedStatement ps = connection.prepareStatement(sql1);
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("Total");
            }
        } catch (SQLException ex) {
            Logger.getLogger(CustomerDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    public ArrayList<Cart> getCartByIndexAndUserId(int index, int sizePage, String productName, int userId) {
        ArrayList<Cart> lst = new ArrayList<>();
        try {
            String sql = "select c.*, p.description [descrip], p.price [priceProduct], p.discount [discountProduct], p.thumbnail from cart as c, product as p where userBuyId = ? and p.id = c.productId";
            if (!productName.isEmpty()) {
                sql += " AND LOWER(productName) like '%" + productName.toLowerCase() + "%'";
            }
            if (index != 0 && sizePage != 0) {
                sql += " order by Id";
                sql += " offset ? rows fetch next ? rows only;";
            }

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            if (index != 0 && sizePage != 0) {
                ps.setInt(2, ((index - 1) * 2));
                ps.setInt(3, sizePage);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setId(rs.getInt("id"));

                Product product = new Product();
                product.setId(rs.getInt("productId"));
                product.setName(rs.getString("productName"));
                product.setDescription(rs.getString("descrip"));
                product.setThumbnail(rs.getString("thumbnail"));
                product.setPrice(rs.getLong("priceProduct"));
                product.setDiscount(rs.getInt("discountProduct"));
                cart.setProduct(product);

                cart.setPrice(rs.getLong("price"));

                User userBuy = new User();
                userBuy.setId(rs.getInt("userBuyId"));
                cart.setUserBuy(userBuy);

                User userSeller = new User();
                userSeller.setId(rs.getInt("sellerId"));
                cart.setUserSeller(userSeller);

                cart.setThumbnail(rs.getString("thumbnail"));
                cart.setQuantityOrder(rs.getInt("quantityOrder"));

                lst.add(cart);
            }
        } catch (SQLException ex) {

        }
        return lst;
    }
    
    
    public static void main(String[] args) {
        CartDBContext db = new CartDBContext();
        ArrayList<Cart> lst = db.getCartByIndexAndUserId(0, 0, "mac", 76);
        for (Cart cart : lst) {
            System.out.println(cart.getProduct().getName());
        }
        
    }

}
