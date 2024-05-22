package com.carshowroom.controller;

import com.carshowroom.service.ICarService;
import com.carshowroom.service.IImgCarService;
import com.carshowroom.service.impl.CarService;
import com.carshowroom.service.impl.ImgCarService;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DetailCarServlet", value = "/detail-car")
public class DetailCarServlet extends HttpServlet {
    private ICarService carService = new CarService();
    private IImgCarService imgCarService = new ImgCarService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        request.setAttribute("imgCar", imgCarService.findListImgByCarId(id));
        request.setAttribute("car", carService.findCarById(id));
        request.getRequestDispatcher("car-details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
