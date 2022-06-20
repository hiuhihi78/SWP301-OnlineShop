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
import model.Cart_Product;
import model.Product;
import model.User;

/**
 *
 * @author Hoang Quang
 */
public class CartDBContext extends DBContext {

//    public ArrayList<Cart> getListCartByUserID(int userID, int pageindex, int pagesize) {
//        ArrayList<Cart> listCarts = new ArrayList<>();
//        String sql = " with x as (select ROW_NUMBER() OVER (ORDER BY id desc) as r\n"
//                + "                    		, * from Cart WHERE userBuyId = ? )\n"
//                + "                    		SElECT* FROM x where r between (? - 1)* ? +1 and ? * ?  ";
//        try {
//            PreparedStatement ps = connection.prepareStatement(sql);
//            ps.setInt(1, userID);
//            ps.setInt(2, pageindex);
//            ps.setInt(3, pagesize);
//            ps.setInt(4, pageindex);
//            ps.setInt(5, pagesize);
//            ResultSet rs = ps.executeQuery();
//            while (rs.next()) {
//                Cart cart = new Cart();
//                cart.setId(rs.getInt("id"));
//
//                Product product = new Product();
//                product.setId(rs.getInt("productId"));
//                product.setName(rs.getString("productName"));
//                cart.setProduct(product);
//
//                cart.setPrice(rs.getLong("price"));
//
//                User userBuy = new User();
//                userBuy.setId(rs.getInt("userBuyId"));
//                cart.setUserBuy(userBuy);
//
//                User userSeller = new User();
//                userSeller.setId(rs.getInt("sellerId"));
//                cart.setUserSeller(userSeller);
//
//                cart.setThumbnail(rs.getString("thumbnail"));
//                cart.setQuantityOrder(rs.getInt("quantityOrder"));
//                
//                listCarts.add(cart);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return listCarts;
//    }
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

    public Cart getCartByCustomerId(int customerId) {
        Cart cart = new Cart();
        try {
            connection.setAutoCommit(false);
            String sql = "select * from Cart where customerId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, customerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                cart.setId(rs.getInt(1));
                User customer = new User();
                customer.setId(rs.getInt(2));
                cart.setCustomer(customer);
            }

            ArrayList<Cart_Product> cart_Products = new ArrayList<>();
            String sql1 = "select *  from [dbo].[Cart_Product] where cartId = ?";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ps1.setInt(1, cart.getId());
            ResultSet rs1 = ps1.executeQuery();
            while (rs1.next()) {
                Cart_Product cart_Product = new Cart_Product();
                cart_Product.setCartId(rs1.getInt(1));
                cart_Product.setProductId(rs1.getInt(2));
                cart_Product.setQuantity(rs1.getInt(3));

                cart_Products.add(cart_Product);
            }
            cart.getCart_Products().addAll(cart_Products);

            connection.commit();
            if (cart.getId() == 0) {
                return null;
            }
            return cart;
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        return null;
    }

    public void addNewCartForNewCustomer(Cart cart) {

        try {
            connection.setAutoCommit(false);
            String sql = "INSERT INTO [dbo].[Cart]\n"
                    + "           ([customerId])\n"
                    + "     VALUES\n"
                    + "           (?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart.getCustomer().getId());
            ps.executeUpdate();

            int cartId = 0;
            String sql1 = "select @@IDENTITY as cartId";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            if (rs.next()) {
                cartId = Integer.parseInt(rs.getString(1));
            }

            String sql2 = "INSERT INTO [dbo].[Cart_Product]\n"
                    + "           ([cartId]\n"
                    + "           ,[productId]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?\n"
                    + "           ,?\n"
                    + "           ,?)";
            PreparedStatement ps2 = connection.prepareStatement(sql2);
            ps2.setInt(1, cartId);
            ps2.setInt(2, cart.getCart_Products().get(0).getProductId());
            ps2.setInt(3, cart.getCart_Products().get(0).getQuantity());
            ps2.executeUpdate();

            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public void updateCart(Cart cart) {

        try {
            connection.setAutoCommit(false);
            String sql = "DELETE FROM [dbo].[Cart_Product]\n"
                    + "      WHERE cartId = ?";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, cart.getId());
            ps.executeUpdate();

            System.out.println("cart size: " + cart.getCart_Products().size());

            for (int i = 0; i < cart.getCart_Products().size(); i++) {
                String sql2 = "INSERT INTO [dbo].[Cart_Product]\n"
                        + "           ([cartId]\n"
                        + "           ,[productId]\n"
                        + "           ,[quantity])\n"
                        + "     VALUES\n"
                        + "           (?\n"
                        + "           ,?\n"
                        + "           ,?)";
                PreparedStatement ps2 = connection.prepareStatement(sql2);
                ps2.setInt(1, cart.getId());
                ps2.setInt(2, cart.getCart_Products().get(i).getProductId());
                ps2.setInt(3, cart.getCart_Products().get(i).getQuantity());
                ps2.executeUpdate();
            }
            System.out.println("cart size : " + cart.getCart_Products().size());
//            String sql2 = "INSERT INTO [dbo].[Cart_Product]\n"
//                        + "           ([cartId]\n"
//                        + "           ,[productId]\n"
//                        + "           ,[quantity])\n"
//                        + "     VALUES\n";
//            int count = 0;
//            for (int i = 0; i < cart.getCart_Products().size(); i++) {
//                
//            }

            connection.commit();
        } catch (SQLException ex) {
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
            Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(CartDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public Cart getCartByIndexAndUserId(int index, int sizePage, String productName, int userId) {
        Cart cart = null;
        UserDBContext userDb = new UserDBContext();
        ProductDBContext productDb = new ProductDBContext();
        ArrayList<Cart_Product> lstProduct = new ArrayList<>();
        User userBuy = null;
        Cart_Product cartProduct = null;
        try {
            String sql = "select cp.*,c.customerId, c.DateUpdated [CartUpdated], c.Status_Id from "
                    + "[Cart] as c, [Cart_Product] cp where c.id = cp.cartId AND customerId = ?";
            if (!productName.isEmpty()) {
                sql += " AND LOWER(productName) like '%" + productName.toLowerCase() + "%'";
            }
            sql += " order by DateUpdated desc";
            if (index != 0 && sizePage != 0) {
                sql += " offset ? rows fetch next ? rows only;";
            }

            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            if (index != 0 && sizePage != 0) {
                ps.setInt(2, ((index - 1) * 2));
                ps.setInt(3, sizePage);
            }
            ResultSet rs = ps.executeQuery();
            cart = new Cart();

            while (rs.next()) {
                cart.setId(rs.getInt("CartId"));
                userBuy = userDb.getUserById(rs.getInt("customerId"));
                cart.setCustomer(userBuy);
         
                cart.setDateUpdated(rs.getDate("CartUpdated"));
                cart.setStatusId(rs.getInt("Status_id"));
                int pid = 0;
                cartProduct = new Cart_Product();
                cartProduct.setCartId(rs.getInt("CartId"));
                pid = rs.getInt("ProductId");
                cartProduct.setProduct(productDb.getProductById(pid));
                cartProduct.setQuantity(rs.getInt("Quantity"));
       
                cartProduct.setDateUpdated(rs.getDate("DateUpdated"));

                lstProduct.add(cartProduct);
                cart.setCart_Products(lstProduct);
            }
        } catch (SQLException ex) {

        }
        return cart;
    }

    public static void main(String[] args) {
        CartDBContext db = new CartDBContext();

//        ArrayList<Cart_Product> arrayList = new ArrayList<>();
//        arrayList.add(new Cart_Product(5, 9, 10));
//        cart.getCart_Products().addAll(arrayList);
//        System.out.println();
//        db.updateCart(cart);
//        db.addNewCartForNewCustomer(cart);
//    Cart c = db.getCartByCustomerId(76);
//        System.out.println(c.getId() + " " + c.getCustomer().getId() + " " + c.getCart_Products().get(0).getProductId()+ " " + c.getCart_Products().get(0).getQuantity());
        Cart cart = db.getCartByIndexAndUserId(0, 0, "", 1);
        //System.out.println(cart.getId());
        for (Cart_Product c : cart.getCart_Products()) {
            System.out.println(c.getProduct().getName());
        }
    }

}
