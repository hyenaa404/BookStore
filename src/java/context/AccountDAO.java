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
import model.Account;

/**
 *
 * @author LENOVO
 */
public class AccountDAO {

    private DBContext dbContext;
    private List<Account> accounts = new ArrayList<>();

    public AccountDAO() {
        dbContext = new DBContext();
    }

    public Account checkAccountByUserName(String userName) {

        String sql = "SELECT * FROM Users WHERE username LIKE ?";

        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userName);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("UserID"),
                        rs.getString("UserName"),
                        rs.getString("Pass"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getInt("Role")
                );
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean createAccount(Account ac){
        try {
            String query = "INSERT INTO Users(UserName, Pass, FullName, PhoneNumber, Email, Role) VALUES  ( ?, ?, ?, ?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, ac.getUserName());
            ps.setString(2, ac.getPassWord());
            ps.setString(3, ac.getFullName());
            ps.setString(4, ac.getPhoneNumber());
            ps.setString(5, ac.getEmail());
            ps.setInt(6, ac.getRole());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

    
}
