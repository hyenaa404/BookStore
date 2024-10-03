/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Discount;

/**
 *
 * @author LENOVO
 */
public class DiscountDAO {
    
    private DBContext dbContext;

    public DiscountDAO() {
        dbContext = new DBContext();
    }
    
    
    
    public int addDiscount(Discount discount) {
        int discountId = -1;
        try {
            String query = "INSERT INTO Discount (name, startdate, enddate) VALUES (?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

            ps.setString(1, discount.getName());
            ps.setDate(2, new java.sql.Date(discount.getStartDate().getTime()));
            ps.setDate(3, new java.sql.Date(discount.getEndDate().getTime()));

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                ResultSet generatedKeys = ps.getGeneratedKeys();
                if (generatedKeys.next()) {
                    discountId = generatedKeys.getInt(1);
                }
            }
            dbContext.closeConnection(conn);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return discountId;
    }
    
    
    
    
    public boolean deleteDiscount(int discountID) {
        String query = "DELETE FROM Discount WHERE discountid = ? ";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, discountID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    
}
