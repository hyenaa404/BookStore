/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;

/**
 *
 * @author LENOVO
 */
public class Order {
//    OrderID INT IDENTITY(1,1) PRIMARY KEY,
//    CustomerID INT NOT NULL,
//    SellerID INT NOT NULL,
//    Status NVARCHAR(30),
//    TotalAmount DECIMAL(10, 2) NOT NULL CHECK (TotalAmount >= 0),
//    Address NVARCHAR(50) NOT NULL,
//    OrderDate DATE NOT NULL DEFAULT GETDATE(),
//    DiscountID INT NOT NULL
    private int orderID;
    private int CustomerID;
    private int sellerID;
    private String status;
    private double totalAmount;
    private String address;
    private Date orderDate;
    private int discountID;

    public Order() {
    }

    public Order(int orderID, int CustomerID, int sellerID, String status, double totalAmount, String address, Date orderDate, int discountID) {
        this.orderID = orderID;
        this.CustomerID = CustomerID;
        this.sellerID = sellerID;
        this.status = status;
        this.totalAmount = totalAmount;
        this.address = address;
        this.orderDate = orderDate;
        this.discountID = discountID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCustomerID() {
        return CustomerID;
    }

    public void setCustomerID(int CustomerID) {
        this.CustomerID = CustomerID;
    }

    public int getSellerID() {
        return sellerID;
    }

    public void setSellerID(int sellerID) {
        this.sellerID = sellerID;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public int getDiscountID() {
        return discountID;
    }

    public void setDiscountID(int discountID) {
        this.discountID = discountID;
    }
    
}
