/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Cart;

/**
 *
 * @author LENOVO
 */
public class CartDAO {
    
    private DBContext dbContext;

    public CartDAO() {
        dbContext = new DBContext();
    }
    
    public List <Cart> getCartByUserID(int id) {
        List <Cart> cart = new ArrayList<>();
        String query = "SELECT * FROM Cart where UserID = ? ";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Cart c = new Cart(
                        rs.getInt("CartID"),
                        rs.getInt("UserID"),
                        rs.getInt("BookID"),
                        rs.getInt("Quantity")
                        
                );
                cart.add(c);

            }
            return cart;

        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("not found products");
        return null;
    }
    
    
     
    public boolean addToCart(Cart c){
        try {
            String query = "insert into cart (UserID,BookID,Quantity) values  ( ?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, c.getUserID());
            ps.setInt(2, c.getBookID());
            ps.setInt(3, c.getQuantity());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    
    public boolean deleteCartProduct(int bookID, int userID) {
        String query = "DELETE FROM Cart WHERE BookID = ? AND UserID = ?";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, bookID);
            ps.setInt(2, userID);
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
}
