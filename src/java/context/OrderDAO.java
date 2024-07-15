/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import java.sql.Connection;
import java.sql.PreparedStatement;
import model.Order;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

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
            String query = "INSERT INTO Orders (CustomerID, Status) VALUES (?, ?)";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query, PreparedStatement.RETURN_GENERATED_KEYS);

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

    public List<Order> getOrderListByUserID(int userID) {
        List<Order> orderList = new ArrayList<>();
        String query = "SELECT * FROM Orders where CustomerID = ? ORDER BY OrderID DESC ";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, userID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Status"),
                        rs.getDouble("TotalAmount"),
                        rs.getDate("OrderDate")
                );
                orderList.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }

    public List<Order> getAllOrderList() {
        List<Order> orderList = new ArrayList<>();
        String query = "SELECT * FROM Orders ORDER BY OrderID DESC";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Status"),
                        rs.getDouble("TotalAmount"),
                        rs.getDate("OrderDate")
                );
                orderList.add(o);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orderList;
    }

    public Order getOrderByOrderID(int orderID) {
        String query = "SELECT * FROM Orders where OrderID = ? ";
        try (Connection con = dbContext.getConnection(); PreparedStatement ps = con.prepareStatement(query)) {
            ps.setInt(1, orderID);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Order o = new Order(
                        rs.getInt("OrderID"),
                        rs.getInt("CustomerID"),
                        rs.getString("Status"),
                        rs.getDouble("TotalAmount"),
                        rs.getDate("OrderDate")
                );
                return o;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateOrderStatus(Order o) {
        try {
            String query = "UPDATE Orders SET  SellerID=?, Status=? WHERE OrderID=?";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setInt(1, o.getSellerID());
            ps.setString(2, o.getStatus());
            ps.setInt(3, o.getOrderID());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
public boolean updateOrderStatusByAdmin(Order o) {
        try {
            String query = "UPDATE Orders SET  Status=? WHERE OrderID=?";
            Connection conn = dbContext.getConnection();
            PreparedStatement ps = conn.prepareStatement(query);

            ps.setString(1, o.getStatus());
            ps.setInt(2, o.getOrderID());

            ps.executeUpdate();
            dbContext.closeConnection(conn);
            return true;
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
    }

}
