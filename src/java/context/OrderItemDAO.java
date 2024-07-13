/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.OrderItem;

/**
 *
 * @author LENOVO
 */
public class OrderItemDAO {
    
    private DBContext dbContext;

    public OrderItemDAO() {
        dbContext = new DBContext();
    }
    
    public boolean addOrderItem(OrderItem item) {
        try {
            String query = "INSERT INTO OrderItems(OrderID, BookID, Quantity) VALUES   ( ?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, item.getOrderId());
            ps.setInt(2, item.getBookId());
            ps.setInt(3, item.getQuantity());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

    }
}
