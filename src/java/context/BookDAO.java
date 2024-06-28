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
import model.Book;

/**
 *
 * @author LENOVO
 */
public class BookDAO {
    private DBContext dbContext;
    private List<Book> bookList = new ArrayList<>();
    public BookDAO() {
        dbContext = new DBContext();
    }
    
    public List<Book> getBookList() {
        bookList.clear();
        String query = "SELECT * FROM Books";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Book b = new Book(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Descrip"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getInt("CateID"),
                        rs.getString("ImgURL")
                );
                bookList.add(b);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookList;
    }
    
    public List<Book> getNewBooksList() {
        List<Book> newBook = new ArrayList<>();
        newBook.clear();
        String query = "SELECT TOP 8 * FROM Books ORDER BY IndexBooks DESC";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Book b = new Book(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Descrip"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getInt("CateID"),
                        rs.getString("ImgURL")
                );
                newBook.add(b);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return newBook;
    }
    
    public List<Book> getBestSellerBooksList() {
        List<Book> bestSeller = new ArrayList<>();
        bestSeller.clear();
        String query = "SELECT TOP 8 * FROM Books ORDER BY Purchase DESC";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Book b = new Book(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Descrip"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getInt("CateID"),
                        rs.getString("ImgURL")
                );
                bestSeller.add(b);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bestSeller;
    }
    
    public List<Book> getRecommendBooksList() {
        List<Book> recommend = new ArrayList<>();
        recommend.clear();
        String query = "SELECT TOP 8 * FROM Books ORDER BY NEWID()";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Book b = new Book(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Descrip"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getInt("CateID"),
                        rs.getString("ImgURL")
                );
                recommend.add(b);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return recommend;
    }
    
    
    public int getBookID(String title){
        
        
        String query = "SELECT * FROM Books where Title = ? ";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setString(1,title);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("BookID");
                
                
            }
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("null");
        return 0;
    }
    
    
    public boolean insertBook(Book book) {
        try {
            String query = "INSERT INTO Books(Title, Author, Descrip, Quantity, Price, CateID, ImgURL) VALUES  ( ?, ?, ?, ?, ?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getDescrip());
            ps.setInt(4, book.getQuantity());
            ps.setDouble(5, book.getPrice());
            ps.setInt(6, book.getCateId());
            ps.setString(7, book.getImgURL());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }

    }
    
    
    
}
