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
public class Discount {
    private int discountId;
    private String name;
    private Date startDate;
    private Date endDate;

    public Discount() {
    }

    public Discount(int discountId, String name, Date startDate, Date endDay) {
        this.discountId = discountId;
        this.name = name;
        this.startDate = startDate;
        this.endDate = endDay;
    }

    public int getDiscountId() {
        return discountId;
    }

    public void setDiscountId(int discountId) {
        this.discountId = discountId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDay) {
        this.endDate = endDay;
    }
    
}
