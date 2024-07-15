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
import model.Review;

/**
 *
 * @author LENOVO
 */
public class ReviewDAO {

    private DBContext dbContext;

    public ReviewDAO() {
        dbContext = new DBContext();
    }

    public List<Review> getReviewListByBookID(int bookID) {
        List<Review> reviewList = new ArrayList<>();
        String query = "SELECT * FROM Reviews where BookID = ? ";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, bookID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Review b = new Review(
                        rs.getInt("BookID"),
                        rs.getInt("UserID"),
                        rs.getInt("Rating"),
                        rs.getString("Comment")
                );
                reviewList.add(b);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return reviewList;
    }

    public int getRatingByBookID(int bookID) {
        String query = "SELECT CAST(AVG(CAST(Rating AS FLOAT)) AS INT) AS AverageRating FROM Reviews WHERE BookID = ? ";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, bookID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("AverageRating");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    
    public boolean addReview(Review r){
        try {
            String query = "INSERT INTO Reviews(BookID, UserID, Rating, Comment) VALUES  ( ?, ?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, r.getBookId());
            ps.setInt(2, r.getUserId());
            ps.setInt(3, r.getRating());
            ps.setString(4, r.getComment());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
}
