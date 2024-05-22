package com.carshowroom.controller;

import com.carshowroom.model.Car;
import com.carshowroom.model.CarCompany;
import com.carshowroom.model.StatusCar;
import com.carshowroom.model.TypeCar;
import com.carshowroom.service.*;
import com.carshowroom.service.impl.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

@WebServlet(name = "CarServlet", value = "/cars")
public class CarServlet extends HttpServlet {
    private ITypeCarService typeCarService = new TypeCarService();
    private IStatusCarService statusCarService = new StatusCarService();
    private ICarCompanyService carCompanyService = new CarCompanyService();
    private IImgCarService imgCarService = new ImgCarService();
    private ICarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        showListCar(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    }

    public void showListCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("imgCars", imgCarService.getImgCars());
        request.setAttribute("listCar", carService.getListCarOrderByPostDate());
        request.getRequestDispatcher("cars.jsp").forward(request, response);
    }

}
