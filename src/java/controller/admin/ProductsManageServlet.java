/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import context.BookDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;
import java.util.List;
import model.Book;

/**
 *
 * @author LENOVO
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class ProductsManageServlet extends HttpServlet {

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
            out.println("<title>Servlet ProductsManageServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ProductsManageServlet at " + request.getContextPath() + "</h1>");
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

        BookDAO bookDAO = new BookDAO();
        List<Book> bookList;
        String category = request.getParameter("category");
        switch (category) {
            case null:
                bookList = bookDAO.getBookList();
                break;
            case "search":
                String name = request.getParameter("search");
                bookList = bookDAO.getBookListByTitle(name);
                break;
            default:
                throw new AssertionError();
        }
        if (bookList.isEmpty()) {
            request.setAttribute("noti", "Books not found!");
        }

        int currentPage = 1;
        if (request.getParameter("page") != null) {
            currentPage = Integer.parseInt(request.getParameter("page"));
        }

        int totalBooks = bookList.size();
        int totalPages = (int) Math.ceil((double) totalBooks / 24);

        int startIndex = (currentPage - 1) * 24;
        int endIndex = Math.min(startIndex + 24, totalBooks);
        List<Book> booksOnPage = bookList.subList(startIndex, endIndex);

        request.setAttribute("list", booksOnPage);
        request.setAttribute("currentPage", currentPage);
        request.setAttribute("totalPages", totalPages);

        request.getRequestDispatcher("WEB-INF/view/products-manage.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private static final String SAVE_DIR = "uploadImages";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String mt = request.getParameter("mt");
        if (mt != null && mt.equalsIgnoreCase("update")) {
            updateBookInformation(request, response);
        } else if (mt != null && mt.equalsIgnoreCase("delete")) {
            deleteBook(request, response);
        } else {
            addBook(request, response);
        }

    }

    
    private void deleteBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        BookDAO bDAO = new BookDAO();
        int bookID = Integer.parseInt(request.getParameter("bookId"));
        if (bDAO.deleteBookByID(bookID)){
            response.sendRedirect("products-manage");
        }else{
            response.sendRedirect("products-manage");
        }
    }
    
    private void updateBookInformation(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        Part filePart = request.getPart("img");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String relativePath;
        if (filePart != null && filePart.getSize() > 0) {
            String filePath = savePath + File.separator + fileName;
            filePart.write(filePath);
            relativePath = SAVE_DIR + File.separator + fileName;
        } else {
            relativePath = request.getParameter("imgURL");
        }
        BookDAO bDAO = new BookDAO();
        int bookID = Integer.parseInt(request.getParameter("bookId"));
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int category = Integer.parseInt(request.getParameter("category"));
        Book b = bDAO.getBookByID(bookID);
        b.setTitle(title);
        b.setAuthor(author);
        b.setPrice(price);
        b.setQuantity(quantity);
        b.setDescrip(description);
        b.setImgURL(relativePath);
        b.setCateId(category);
        bDAO.updateBook(b);
        response.sendRedirect("products-manage");
    }

    
    
    
    private void addBook(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String appPath = request.getServletContext().getRealPath("");
        String savePath = appPath + File.separator + SAVE_DIR;

        File fileSaveDir = new File(savePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdir();
        }

        Part filePart = request.getPart("img");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String relativePath;
        if (filePart != null && filePart.getSize() > 0) {
            String filePath = savePath + File.separator + fileName;
            filePart.write(filePath);
            relativePath = SAVE_DIR + File.separator + fileName;
        } else {
            relativePath = request.getParameter("imgURL");
        }
        BookDAO bDAO = new BookDAO();
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        int category = Integer.parseInt(request.getParameter("category"));
        Book b = new Book(title, author, description, quantity, price, category, relativePath);
        bDAO.insertBook(b);
        response.sendRedirect("products-manage");
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
