/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import context.AccountDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.FileWriter;
import model.Account;

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession(false);


        if (request.getParameter("mt") != null && request.getParameter("mt").equalsIgnoreCase("update")) {
            updateInformation(request, response);
        } else {
            String[] selected = request.getParameterValues("isSelected");

            if (selected == null) {
                session.setAttribute("orderStatus", "Choose books to start Order!");
                response.sendRedirect("cart");
            } else {
                for (String bookID : selected) {
                    int id;
                    try {
                        id = Integer.parseInt(bookID);
                    } catch (NumberFormatException e) {
                        throw new ServletException("invalid id");
                    }
                    String quantity = request.getParameter("quantity_" + bookID);
//            out.println(quantity +" "+ bookID);
//            request.setAttribute("quantity_" +bookID, quantity);

                }
//            response.sendRedirect("order");
                request.getRequestDispatcher("order.jsp").forward(request, response);
            }
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
            request.getRequestDispatcher("order.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Error, failed to update information!");
            request.getRequestDispatcher("order.jsp").forward(request, response);
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
