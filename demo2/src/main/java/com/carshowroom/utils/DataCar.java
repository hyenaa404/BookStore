package com.carshowroom.utils;

import com.carshowroom.model.*;
import com.carshowroom.service.ICarCompanyService;
import com.carshowroom.service.IStatusCarService;
import com.carshowroom.service.ITypeCarService;
import com.carshowroom.service.impl.CarCompanyService;
import com.carshowroom.service.impl.StatusCarService;
import com.carshowroom.service.impl.TypeCarService;

import java.io.*;
import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class DataCar {
    private IStatusCarService statusCarService = new StatusCarService();
    private ITypeCarService typeCarService = new TypeCarService();
    private ICarCompanyService carCompanyService = new CarCompanyService();

    public List<Car> getCarList() {
        List<Car> cars = new ArrayList<>();
        BufferedReader bufferedReader = null;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(PathFile.FILE_CARS), "UTF-8"));
            String line;
            String[] temp;
            while ((line = bufferedReader.readLine()) != null) {
                temp = line.split(", ");
                String id = temp[0];
                String nameCar = temp[1];
                BigDecimal price = new BigDecimal(temp[2]);
                String original = temp[3];
                StatusCar statusCar = statusCarService.findById(Integer.parseInt(temp[4]));
                String exteriorColor = temp[5];
                String interiorColor = temp[6];
                int doorAmount = Integer.parseInt(temp[7]);
                int seatAmount = Integer.parseInt(temp[8]);
                String gearBox = temp[9];
                String fwd = temp[10];
                String fuelConsumption = temp[11];
                String desc = temp[12];
                TypeCar typeCar = typeCarService.findById(Integer.parseInt(temp[13]));
                CarCompany carCompany = carCompanyService.findById(Integer.parseInt(temp[14]));
                LocalDate datePost = LocalDate.parse(temp[15]);
                cars.add(new Car(id, nameCar, price, original, statusCar, exteriorColor, interiorColor, doorAmount, seatAmount, gearBox, fwd, fuelConsumption, desc, typeCar, carCompany, datePost));
            }
            bufferedReader.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return cars;
    }

    public void addCars(List<Car> cars) {
        BufferedWriter bufferedWriter = null;
        try {
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(PathFile.FILE_CARS), "UTF-8"));
            for (Car car : cars) {
                if (car.getId() == null) {
                    car.setId(UUID.randomUUID().toString());
                    bufferedWriter.write(car.convertLine() + "\n");
                } else {
                    bufferedWriter.write(car.convertLine() + "\n");
                }
            }
            bufferedWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public Car addCar(Car car) {
        BufferedWriter bufferedWriter = null;
        try {
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(PathFile.FILE_CARS, true), "UTF-8"));
            if (car.getId() == null) {
                car.setId(UUID.randomUUID().toString());
                bufferedWriter.write(car.convertLine() + "\n");
            } else {
                bufferedWriter.write(car.convertLine() + "\n");
            }
            bufferedWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return car;
    }
}
