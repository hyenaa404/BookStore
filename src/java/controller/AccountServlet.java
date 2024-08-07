/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import context.AccountDAO;
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
import java.util.ArrayList;
import java.util.List;
import model.Account;
import model.Order;
import model.OrderItem;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "AccountServlet", urlPatterns = {"/account"})
public class AccountServlet extends HttpServlet {

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
        Account user = (Account) session.getAttribute("user");
        if(user== null){
            response.sendRedirect("admin-home");
        }else{
        OrderDAO oDAO = new OrderDAO();
        List<Order> oList = oDAO.getOrderListByUserID(user.getId());
        session.setAttribute("listUserOrder", oList);
        request.getRequestDispatcher("WEB-INF/view/account.jsp").forward(request, response);
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

        updateAccountInformation(request, response);
    }

    private void updateAccountInformation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        AccountDAO acDAO = new AccountDAO();
        int id = Integer.parseInt(request.getParameter("id"));

        String fullName = request.getParameter("fullname");

        String phoneNumber = request.getParameter("phonenumer");

        String email = request.getParameter("email");

        String userName = request.getParameter("username");

        String passWord = request.getParameter("password");

        String address = request.getParameter("address");

        Account ac = new Account(id, userName, passWord, fullName, phoneNumber, email, address, 2);

        if (acDAO.updateAccount(ac)) {
            HttpSession session = request.getSession(false);
            session.setAttribute("user", ac);
//            request.getRequestDispatcher("account.jsp").forward(request, response);
            processRequest(request, response);

        } else {
            request.setAttribute("message", "Error, failed to update account!");

            request.getRequestDispatcher("WEB-INF/view/account.jsp").forward(request, response);
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
