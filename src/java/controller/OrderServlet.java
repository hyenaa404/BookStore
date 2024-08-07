/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import context.AccountDAO;
import context.BookDAO;
import context.OrderDAO;
import context.OrderItemDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Book;
import model.Order;
import model.OrderItem;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "OrderServlet", urlPatterns = {"/order"})
public class OrderServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet OrderServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet OrderServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("home").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mt = request.getParameter("mt");
        if (mt != null && mt.equalsIgnoreCase("update")) {
            updateInformation(request, response);
        } else if (mt != null && mt.equalsIgnoreCase("display")) {
            displayOrder(request, response);
        } else {
            addOrder(request, response);
        }
    }

    protected void displayOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String[] selected = request.getParameterValues("isSelected");
        if (selected == null) {
            session.setAttribute("cartStatus", "Choose books to start Order!");
            response.sendRedirect("cart");
        } else {
            BookDAO bookDAO = new BookDAO();
            List<Book> orderList = new ArrayList<>();
            for (String bookID : selected) {
                int id;
                try {
                    id = Integer.parseInt(bookID);
                } catch (NumberFormatException e) {
                    throw new ServletException("invalid id");
                }
                int quantity = Integer.parseInt(request.getParameter("quantity_" + bookID));
                Book b = bookDAO.getBookByID(id);
                b.setQuantity(quantity);
                orderList.add(b);

            }
            session.setAttribute("orderList", orderList);
            request.getRequestDispatcher("WEB-INF/view/order.jsp").forward(request, response);
        }
    }

    protected void updateInformation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AccountDAO acDAO = new AccountDAO();
        int id = Integer.parseInt(request.getParameter("id"));

        String fullName = request.getParameter("fullname");

        String phoneNumber = request.getParameter("phonenumer");

        String email = request.getParameter("email");

        String address = request.getParameter("address");

        Account ac = acDAO.getAccountById(id);
        ac.setFullName(fullName);
        ac.setPhoneNumber(phoneNumber);
        ac.setEmail(email);
        ac.setAddress(address);

        if (acDAO.updateInfomation(ac)) {
            HttpSession session = request.getSession(false);
            session.setAttribute("user", ac);
            request.getRequestDispatcher("WEB-INF/view/order.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Error, failed to update information!");
            request.getRequestDispatcher("WEB-INF/view/order.jsp").forward(request, response);
        }

    }

    protected void addOrder(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);

        int userID = Integer.parseInt(request.getParameter("userID"));
        OrderDAO orderDAO = new OrderDAO();
        Order order = new Order(userID, "Pending");
        int orderID = orderDAO.addOrder(order);
        List<Book> orderList = (List<Book>) session.getAttribute("orderList");
        for (Book b : orderList) {
            int id = b.getId();
            int quantity = b.getQuantity();
            OrderItem orderItem = new OrderItem(orderID, id, quantity);
            OrderItemDAO oiDAO = new OrderItemDAO();
            if (oiDAO.addOrderItem(orderItem)) {
                session.setAttribute("alert", "Ordered successfully!");
            } else {
                session.setAttribute("alert", "Failed to ordered!");
               response.sendRedirect("cart");
            }

        }
            response.sendRedirect("account");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
