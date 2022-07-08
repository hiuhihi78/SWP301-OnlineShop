/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author hoan
 */
public class Order {

    private int id;
    private Date date;
    private ArrayList<Product> products;
    private double totalcost;
    private int status;
    private int numproducts;
    private String buyer;
    private String cancelledReason;
    private boolean isFeedback;

    public boolean isIsFeedback() {
        return isFeedback;
    }

    public void setIsFeedback(boolean isFeedback) {
        this.isFeedback = isFeedback;
    }
    

    public String getCancelledReason() {
        return cancelledReason;
    }

    public void setCancelledReason(String cancelledReason) {
        this.cancelledReason = cancelledReason;
    }

    public Order() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public ArrayList<Product> getProducts() {
        return products;
    }

    public void setProducts(ArrayList<Product> products) {
        this.products = products;
    }

    public double getTotalcost() {
        return totalcost;
    }

    public void setTotalcost(double totalcost) {
        this.totalcost = totalcost;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getNumproducts() {
        return numproducts;
    }

    public void setNumproducts(int numproducts) {
        this.numproducts = numproducts;
    }

    public String getBuyer() {
        return buyer;
    }

    public void setBuyer(String buyer) {
        this.buyer = buyer;
    }

}
