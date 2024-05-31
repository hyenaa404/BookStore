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
    
    public List<Book> getStudentList() {
        bookList.clear();
        String query = "SELECT * FROM Student";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Book b = new Book(
                        rs.getInt("BookID"),
                        rs.getString("Title"),
                        rs.getString("Author"),
                        rs.getString("Descrip"),
                        rs.getInt("Quantity"),
                        rs.getDouble("Price"),
                        rs.getInt("CateID")
                );
                bookList.add(b);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return bookList;
    }
    
    
    
}
