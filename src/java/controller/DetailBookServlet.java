/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import context.BookDAO;
import context.ReviewDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;
import model.Category;
import model.Review;

/**
 *
 * @author LENOVO
 */
@WebServlet(name = "DetailBookServlet", urlPatterns = {"/detail"})
public class DetailBookServlet extends HttpServlet {

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

            int id = Integer.parseInt(request.getParameter("bookId"));
            BookDAO bookDAO = new BookDAO();
            ReviewDAO rDAO = new ReviewDAO();
            Book b = bookDAO.getBookByID(id);
            Category cate = bookDAO.getCateByID(b.getCateId());
            List<Review> rList = rDAO.getReviewListByBookID(id);
            int rating = rDAO.getRatingByBookID(id);
            if (rating == 0) {
                request.setAttribute("ratingStatus", "Not rating yet!");
            } else {
                request.setAttribute("ratingStatus", "");
            }
            request.setAttribute("cateName", cate.getName());
            request.setAttribute("book", b);
            request.setAttribute("reviewList", rList);
            request.setAttribute("rating", rating);
            request.getRequestDispatcher("WEB-INF/view/product-details.jsp").forward(request, response);
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
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comment = request.getParameter("comment");
        int bookID = Integer.parseInt(request.getParameter("bookID"));
        int userID = Integer.parseInt(request.getParameter("userID"));
        Review r = new Review(bookID, userID, rating, comment);
        ReviewDAO rDAO = new ReviewDAO();
        rDAO.addReview(r);
        response.sendRedirect("detail?bookId="+bookID);
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
