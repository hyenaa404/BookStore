package com.carshowroom.utils;

import com.carshowroom.model.Car;
import com.carshowroom.model.ImgCar;
import com.carshowroom.service.ICarService;
import com.carshowroom.service.impl.CarService;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DataImgCar {
    ICarService carService = new CarService();
    public List<ImgCar> getImgCarList() {
        List<ImgCar> imgCars = new ArrayList<>();
        BufferedReader bufferedReader = null;
        try {
            FileReader fileReader = new FileReader(PathFile.FILE_IMAGE_CAR);
            bufferedReader = new BufferedReader(fileReader);
            String line;
            String[] temp = null;
            while ((line = bufferedReader.readLine()) != null) {
                temp = line.split(", ");
                String id = temp[0];
                String imgPath = temp[1];
                Car car = carService.findCarById(temp[2]);
                imgCars.add(new ImgCar(id, imgPath, car));
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
        return imgCars;
    }
    public void addImgCarList(List<ImgCar> imgCars) {
        BufferedWriter bufferedWriter = null;
        try {
            bufferedWriter = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(PathFile.FILE_IMAGE_CAR), "UTF-8"));
            for (ImgCar imgCar: imgCars) {
                bufferedWriter.write(imgCar.convertLine() + "\n");
            }
            bufferedWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
