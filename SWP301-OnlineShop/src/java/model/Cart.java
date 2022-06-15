/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Hoang Quang
 */
public class Cart {
//    CREATE TABLE [dbo].[Cart](
//	[id] [int] IDENTITY(1,1) primary key NOT NULL,
//	[productId] [int] NOT NULL,
//	[productName] [nvarchar](200) NOT NULL,
//	[quantityOrder] [int] NOT NULL,
//	[price] [float] NOT NULL,
//	[userBuyId] [int] NOT NULL,
//	[sellerId] [int] NOT NULL,
//	[thumbnail] [varchar](max) NOT NULL,

    private int id;
    private Product product;
    private int quantityOrder;
    private long price;
    private User userBuy;
    private User userSeller;
    private String thumbnail;
    private long total;

    public Cart() {
    }

    public Cart(int id, Product product, int quantityOrder, long price, User userBuy, User userSeller, String thumbnail, long total) {
        this.id = id;
        this.product = product;
        this.quantityOrder = quantityOrder;
        this.price = price;
        this.userBuy = userBuy;
        this.userSeller = userSeller;
        this.thumbnail = thumbnail;
        this.total = total;
    }

    public long getTotal() {
        return (price * quantityOrder);
    }

    public void setTotal(long total) {
        this.total = total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public int getQuantityOrder() {
        return quantityOrder;
    }

    public void setQuantityOrder(int quantityOrder) {
        this.quantityOrder = quantityOrder;
    }

    public long getPrice() {
        return price;
    }

    public void setPrice(long price) {
        this.price = price;
    }

    public User getUserBuy() {
        return userBuy;
    }

    public void setUserBuy(User userBuy) {
        this.userBuy = userBuy;
    }

    public User getUserSeller() {
        return userSeller;
    }

    public void setUserSeller(User userSeller) {
        this.userSeller = userSeller;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

}
