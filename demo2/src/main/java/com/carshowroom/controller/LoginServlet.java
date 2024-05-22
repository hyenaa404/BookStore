package com.carshowroom.controller;

import com.carshowroom.model.Admin;
import com.carshowroom.service.ILoginService;
import com.carshowroom.service.impl.LoginService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(name = "LoginServlet", value = "/login")
public class LoginServlet extends HttpServlet {
    private ILoginService loginService = new LoginService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Admin admin = loginService.checkAdmin(username, password);
        if (admin != null) {
            HttpSession session = request.getSession();
            session.setAttribute("account", admin);
            session.setMaxInactiveInterval(1800);
            response.sendRedirect("/");
        } else {
            request.setAttribute("message", "Tên đăng nhập hoặc mật khẩu không đúng.");
            RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
            dispatcher.forward(request, response);
        }
    }
}
