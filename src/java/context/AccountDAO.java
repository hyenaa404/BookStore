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
                        rs.getString("Address"),
                        rs.getInt("Role")
                );
                return account;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public Account getAccountById(int id) {

        String sql = "SELECT * FROM Users WHERE UserID LIKE ?";

        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("UserID"),
                        rs.getString("UserName"),
                        rs.getString("Pass"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("Address"),
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
            String query = "INSERT INTO Users(UserName, Pass, FullName, PhoneNumber, Email, Address, Role) VALUES  ( ?, ?, ?, ?, ?, ?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, ac.getUserName());
            ps.setString(2, ac.getPassWord());
            ps.setString(3, ac.getFullName());
            ps.setString(4, ac.getPhoneNumber());
            ps.setString(5, ac.getEmail());
            ps.setString(6, ac.getAddress());
            ps.setInt(7, ac.getRole());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    
       public boolean updateAccount(Account ac){
        try {
            String query = "UPDATE Users SET UserName = ?, Pass = ?, FullName = ?, PhoneNumber = ?, Email = ?, Address =? WHERE UserId = ?";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, ac.getUserName());
            ps.setString(2, ac.getPassWord());
            ps.setString(3, ac.getFullName());
            ps.setString(4, ac.getPhoneNumber());
            ps.setString(5, ac.getEmail());
            ps.setString(6, ac.getAddress());
            ps.setInt(7, ac.getId());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

       
       
       public boolean updateInfomation(Account ac){
        try {
            String query = "UPDATE Users SET FullName = ?, PhoneNumber = ?, Email = ?, Address =? WHERE UserId = ?";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, ac.getFullName());
            ps.setString(2, ac.getPhoneNumber());
            ps.setString(3, ac.getEmail());
            ps.setString(4, ac.getAddress());
            ps.setInt(5, ac.getId());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
       
       
    public List<Account> getAccountList() {
        List<Account> accountList = new ArrayList<>();
        accountList.clear();
        String query = "SELECT * FROM Users";
        try (Connection conn = dbContext.getConnection(); PreparedStatement ps = conn.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Account account = new Account(
                        rs.getInt("UserID"),
                        rs.getString("UserName"),
                        rs.getString("Pass"),
                        rs.getString("FullName"),
                        rs.getString("PhoneNumber"),
                        rs.getString("Email"),
                        rs.getString("Address"),
                        rs.getInt("Role")
                );
                accountList.add(account);
            }
            dbContext.closeConnection(conn);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return accountList;
    }
    
}
