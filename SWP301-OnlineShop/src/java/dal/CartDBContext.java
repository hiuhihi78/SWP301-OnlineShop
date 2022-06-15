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

}
