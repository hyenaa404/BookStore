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
import model.Img;

/**
 *
 * @author LENOVO
 */
public class ImgDAO {
    
    private DBContext dbContext;
    private List<Img> imgList = new ArrayList<>();
    public ImgDAO() {
        dbContext = new DBContext();
    }
    
    public List<Img> getImg() {
        imgList.clear();
        String query = "SELECT * FROM BookImages";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Img img = new Img(
                        rs.getInt("ImgID"),
                        rs.getInt("BookID"),
                        rs.getString("ImgURL")
                );
                imgList.add(img);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return imgList;
    }
    
    
    public boolean insertImg(Img img) {
        try {
            String query = "INSERT INTO BookImages(BookID, ImgURL) VALUES ( ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, img.getBookID());
            ps.setString(2, img.getImgURL());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            return false;
        }

    }
    
}
