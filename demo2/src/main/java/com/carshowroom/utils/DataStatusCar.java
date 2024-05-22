package com.carshowroom.utils;

import com.carshowroom.model.Car;
import com.carshowroom.model.ImgCar;
import com.carshowroom.model.StatusCar;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DataStatusCar {
    public List<StatusCar> getStatusCarList() {
        List<StatusCar> statusCars = new ArrayList<>();
        BufferedReader bufferedReader    = null;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(PathFile.FILE_STATUS_CAR), "UTF-8"));
            String line;
            String[] temp = null;
            while ((line = bufferedReader.readLine()) != null) {
                temp = line.split(", ");
                int id = Integer.parseInt(temp[0]);
                String nameStatus = temp[1];
                System.out.println(line);
                statusCars.add(new StatusCar(id, nameStatus));
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                bufferedReader.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return statusCars;
    }
}
