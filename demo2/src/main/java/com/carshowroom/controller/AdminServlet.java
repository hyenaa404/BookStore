package com.carshowroom.controller;

import com.carshowroom.model.*;
import com.carshowroom.service.*;
import com.carshowroom.service.impl.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

@MultipartConfig()
@WebServlet(name = "AdminServlet", value = "/admin")
public class AdminServlet extends HttpServlet {
    private ITypeCarService typeCarService = new TypeCarService();
    private IStatusCarService statusCarService = new StatusCarService();
    private ICarCompanyService carCompanyService = new CarCompanyService();
    private IImgCarService imgCarService = new ImgCarService();
    private ICarService carService = new CarService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Admin admin = (Admin) httpSession.getAttribute("account");
        if (admin == null) {
            response.sendRedirect("/login");
        } else {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "add-car":
                showFormAddCar(request, response);
                break;
            case "update-car":
                showFormUpdateCar(request, response);
                break;
            case "delete-car":
                deleteCar(request, response);
                break;
            case "search":
                searchCar(request, response);
                break;
            default:
                showListCar(request, response);
                break;
        }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession();
        Admin admin = (Admin) httpSession.getAttribute("account");
        if (admin == null) {
            response.sendRedirect("/login");
        } else {
        String action = request.getParameter("action");
            if (action == null) {
                action = "";
            }
        switch (action) {
            case "add-car":
                addCar(request, response);
                break;
            case "update-car":
                updateCar(request, response);
                break;
            case "search":
                searchCar(request, response);
                break;
            default:
                showListCar(request, response);
                break;
        }
        }
    }

    public void showFormAddCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("typeCars", typeCarService.getAll());
        request.setAttribute("statusCars", statusCarService.getAll());
        request.setAttribute("carCompanies", carCompanyService.getAll());
        request.getRequestDispatcher("add-car.jsp").forward(request, response);
    }

    public void showFormUpdateCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        Car car = carService.findCarById(id);
        request.setAttribute("imgCars", imgCarService.findListImgByCarId(id));
        request.setAttribute("typeCars", typeCarService.getAll());
        request.setAttribute("statusCars", statusCarService.getAll());
        request.setAttribute("carCompanies", carCompanyService.getAll());
        request.setAttribute("car", car);
        request.getRequestDispatcher("/update-car.jsp").forward(request, response);
    }

    public void showListCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("imgCars", imgCarService.getImgCars());
        request.setAttribute("listCar", carService.getListCarOrderByPostDate());
        request.getRequestDispatcher("list-car-admin.jsp").forward(request, response);
    }

    public void deleteCar(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String id = request.getParameter("id");
        imgCarService.removeImgCarByCarId(id);
        carService.removeCar(id);
        response.sendRedirect("/admin");
    }

    public void searchCar(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("imgCars", imgCarService.getImgCars());
        request.setAttribute("listCar", carService.searchListCarByName(request.getParameter("name")));
        request.getRequestDispatcher("list-car-admin.jsp").forward(request, response);
    }

    public void updateCar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String id = request.getParameter("id");
        String nameCar = request.getParameter("nameCar");
        String price = request.getParameter("price");
        String original = request.getParameter("original");
        StatusCar statusCar = statusCarService.findById(Integer.parseInt(request.getParameter("statusCar")));
        String exteriorColor = request.getParameter("exteriorColor");
        String interiorColor = request.getParameter("interiorColor");
        String doorAmount = request.getParameter("doorAmount");
        String seatAmount = request.getParameter("seatAmount");
        String gearBox = request.getParameter("gearBox");
        String fwd = request.getParameter("fwd");
        String fuelConsumption = request.getParameter("fuelConsumption");
        String description = request.getParameter("description");
        TypeCar typeCar = typeCarService.findById(Integer.parseInt(request.getParameter("typeCar")));
        CarCompany carCompany = carCompanyService.findById(Integer.parseInt(request.getParameter("carCompany")));
        LocalDate date = LocalDate.parse(LocalDate.now().toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        List<String> paths = handlePathImgs(request, response);
        Map<String, String> errors = validateCar(nameCar, price, exteriorColor, interiorColor, doorAmount, seatAmount, description, paths);
        if (errors.size() > 0) {
            Car car = carService.findCarById(id);
            request.setAttribute("errors", errors);
            request.setAttribute("imgCars", imgCarService.findListImgByCarId(id));
            request.setAttribute("typeCars", typeCarService.getAll());
            request.setAttribute("statusCars", statusCarService.getAll());
            request.setAttribute("carCompanies", carCompanyService.getAll());
            request.setAttribute("car", car);
            request.getRequestDispatcher("update-car.jsp").forward(request, response);
            return;
        }
        Car car = new Car(id, nameCar, new BigDecimal(price), original, statusCar, exteriorColor, interiorColor, Integer.parseInt(doorAmount), Integer.parseInt(seatAmount), gearBox, fwd, fuelConsumption, description, typeCar, carCompany, date);
        imgCarService.addNewImgCars(paths, car);
        carService.updateCar(car);
        response.sendRedirect("/admin");
    }

    public void addCar(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String nameCar = request.getParameter("nameCar");
        String price = request.getParameter("price");
        String original = request.getParameter("original");
        StatusCar statusCar = statusCarService.findById(Integer.parseInt(request.getParameter("statusCar")));
        String exteriorColor = request.getParameter("exteriorColor");
        String interiorColor = request.getParameter("interiorColor");
        String doorAmount = request.getParameter("doorAmount");
        String seatAmount = request.getParameter("seatAmount");
        String gearBox = request.getParameter("gearBox");
        String fwd = request.getParameter("fwd");
        String fuelConsumption = request.getParameter("fuelConsumption");
        String description = request.getParameter("description");
        TypeCar typeCar = typeCarService.findById(Integer.parseInt(request.getParameter("typeCar")));
        CarCompany carCompany = carCompanyService.findById(Integer.parseInt(request.getParameter("carCompany")));
        LocalDate date = LocalDate.parse(LocalDate.now().toString(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        List<String> paths = handlePathImgs(request, response);
        Map<String, String> errors = validateCar(nameCar, price, exteriorColor, interiorColor, doorAmount, seatAmount, description, paths);
        if (errors.size() > 0) {
            request.setAttribute("errors", errors);
            request.setAttribute("typeCars", typeCarService.getAll());
            request.setAttribute("statusCars", statusCarService.getAll());
            request.setAttribute("carCompanies", carCompanyService.getAll());
            request.getRequestDispatcher("add-car.jsp").forward(request, response);
            return;
        }
        Car car = new Car(nameCar, new BigDecimal(price), original, statusCar, exteriorColor, interiorColor, Integer.parseInt(doorAmount), Integer.parseInt(seatAmount), gearBox, fwd, fuelConsumption, description, typeCar, carCompany, date);
        imgCarService.addNewImgCars(paths, car);
        carService.addCar(car);
        response.sendRedirect("/admin");
    }

    public List<String> handlePathImgs(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Collection<Part> parts = request.getParts();
        List<String> paths = new ArrayList<>();
        for (Part part : parts) {
            String imageFileName = part.getSubmittedFileName();
            String uploadPath = "C:\\Syllabus-FPT\\PRO192\\car-showroom\\src\\main\\webapp\\uploadFiles\\" + imageFileName;
            if (imageFileName != null) {
                if (!imageFileName.equals("")) {
                    paths.add("\\uploadFiles\\" + imageFileName);
                    try {
                        FileOutputStream fos = new FileOutputStream(uploadPath);
                        InputStream is = part.getInputStream();
                        byte[] data = new byte[is.available()];
                        is.read(data);
                        fos.write(data);
                        fos.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        return paths;
    }

    public Map<String, String> validateCar(String nameCar, String price, String exteriorColor, String interiorColor, String doorAmount, String seatAmount, String desc, List<String> image) {
        Map<String, String> errors = new LinkedHashMap<>();
        if (nameCar.trim().equals("")) {
            errors.put("nameCar", "Tên xe không được để trống");
        }
        if (price.trim().equals("")) {
            errors.put("price", "Giá không được để trống");
        }
        if (exteriorColor.trim().equals("")) {
            errors.put("exteriorColor", "Màu ngoại thất không được để trống");
        }
        if (interiorColor.trim().equals("")) {
            errors.put("exteriorColor", "Màu ngoại thất không được để trống");
        }
        if (doorAmount.trim().equals("")) {
            errors.put("doorAmount", "Số cửa không được để trống");
        }
        if (seatAmount.trim().equals("")) {
            errors.put("seatAmount", "Số chỗ ngồi không được để trống");
        }
        if (desc.trim().equals("")) {
            errors.put("description", "Mô tả xe không được để trống");
        }
        if (image.size() == 0) {
            errors.put("image", "Bạn chưa chọn tấm ảnh nào");
        }
        return errors;
    }
}
