/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import context.BookDAO;
import context.CartDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Book;
import model.Cart;

/**
 *
 * @author LENOVO
 */
public class CartServlet extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        BookDAO bookDAO = new BookDAO();
        CartDAO cartDAO = new CartDAO();
        Account user = (Account) session.getAttribute("user");
        List<Cart> cart = cartDAO.getCartByUserID(user.getId());
        List<Book> cartList = new ArrayList<>();
        for (Cart c : cart) {
            Book b = bookDAO.getBookByID(c.getBookID());
            cartList.add(b);
            b.setQuantity(c.getQuantity());
        }
        session.setAttribute("cart", cartList);

        request.getRequestDispatcher("WEB-INF/view/cart.jsp").forward(request, response);

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
        processRequest(request, response);
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
//        response.setContentType("text/html;charset=UTF-8");
//        PrintWriter out = response.getWriter();

        if (request.getParameter("isAdd") != null) {
            addProduct(request, response);
        } else {
            deleteProduct(request, response);
        }
    }

    private void addProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        Cart c = new Cart(userID, bookID, quantity);

        CartDAO cartDAO = new CartDAO();
        if (cartDAO.addToCart(c)) {
            session.setAttribute("alert", "Added to cart successfully!");
        } else {
            session.setAttribute("alert", "Failed to add product!");
        }
        response.sendRedirect("detail?bookId=" + bookID);
    }

    private void deleteProduct(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String[] selected = request.getParameterValues("isSelected");
        if (selected == null) {
            session.setAttribute("cartStatus", "Choose books to delete!");
            response.sendRedirect("cart");

        } else {
            for (String bookID : selected) {
                int id, userID;
                try {
                    userID = Integer.parseInt(request.getParameter("userID"));
                    id = Integer.parseInt(bookID);
                    CartDAO cartDAO = new CartDAO();
                    if (!cartDAO.deleteCartProduct(id, userID)) {
                        session.setAttribute("cartStatus", "Cannot delete!");
                    }
                } catch (NumberFormatException e) {
                    throw new ServletException("invalid id");
                }

            }
            session.setAttribute("cartStatus", "Delete products successfully!");
            response.sendRedirect("cart");
        }
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
