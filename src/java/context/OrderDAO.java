/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Order;
import java.sql.ResultSet;

/**
 *
 * @author LENOVO
 */
public class OrderDAO {

    private DBContext dbContext;

    public OrderDAO() {
        dbContext = new DBContext();
    }

    public int addOrder(Order od) {
        int orderID = -1;
        try {
            String query = "INSERT INTO Orders (CustomerID, Status) VALUES ( ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, od.getCustomerID());
            ps.setString(2, od.getStatus());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderID = generatedKeys.getInt(1);
                }
            }
            dbContext.closeConnection(conn);

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        return orderID;
    }
    
    
    
    public int addOrderWithDiscount(Order od) {
        int orderID = -1;
        try {
            String query = "INSERT INTO Orders (CustomerID, Status,  DiscountID) VALUES (?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, od.getCustomerID());
            ps.setString(2, od.getStatus());
            ps.setInt(3, od.getDiscountID());

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    orderID = generatedKeys.getInt(1);
                }
            }
            dbContext.closeConnection(conn);

        } catch (Exception e) {
            System.out.println(e.getMessage());

        }
        return orderID;
    }
    
    
}
