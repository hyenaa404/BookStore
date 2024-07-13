/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import context.AccountDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpSession;
import model.Account;

/**
 *
 * @author LENOVO
 */
//@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private String adminName;
    private String adminPass;
    AccountDAO accountDAO = new AccountDAO();

    @Override
    public void init() throws ServletException {
        adminName = getServletConfig().getInitParameter("user");
        adminPass = getServletConfig().getInitParameter("pass");
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        response.setContentType("text/html;charset=UTF-8");

        String u = request.getParameter("user");

        String p = request.getParameter("pass");

        HttpSession session = request.getSession();
        Account acc = accountDAO.checkAccountByUserName(u);
        if (u.equals(adminName) && p.equals(adminPass)) {
            session.setAttribute("username", u);
            session.setAttribute("role", "admin");
            session.setMaxInactiveInterval(10 * 24 * 60 * 60);
            request.getRequestDispatcher("admin-home").forward(request, response);
        } else if (accountDAO.checkAccountByUserName(u) != null && acc.getPassWord().equals(p)) {
//            if (acc.getAddress()==null){
//                acc.setAddress("Not update yet!");
//            }
            session.setAttribute("username", u);
            session.setAttribute("user", acc);
            session.setAttribute("role", "customer");
            session.setMaxInactiveInterval(10 * 24 * 60 * 60);
            session.setAttribute("disabled", "disabled");
            request.setAttribute("message", " ");
            response.sendRedirect("home");
        } else {
            request.setAttribute("message", "Error name and passwword");
            request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
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
        
        request.getRequestDispatcher("WEB-INF/view/login.jsp").forward(request, response);
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
        processRequest(request, response);
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
