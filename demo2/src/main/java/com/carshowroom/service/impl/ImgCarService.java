package com.carshowroom.service.impl;

import com.carshowroom.model.Car;
import com.carshowroom.model.ImgCar;
import com.carshowroom.service.IImgCarService;
import com.carshowroom.utils.DataImgCar;

import java.util.ArrayList;
import java.util.List;

public class ImgCarService implements IImgCarService {
    private DataImgCar dataImgCar = new DataImgCar();
    @Override
    public List<ImgCar> findListImgByCarId(String id) {
        List<ImgCar> imgCars = dataImgCar.getImgCarList();
        List<ImgCar> imgCarList = new ArrayList<>();
        for (int i = 0; i < imgCars.size(); i++) {
            if (imgCars.get(i).getCar().getId().equals(id)) {
                imgCarList.add(imgCars.get(i));
            }
        }
        return imgCarList;
    }

    @Override
    public List<ImgCar> getImgCars() {
        return dataImgCar.getImgCarList();
    }
    public boolean addNewImgCars(List<String> paths, Car car) {
        List<ImgCar> imgCarList = dataImgCar.getImgCarList();
        for (int i = 0; i < imgCarList.size(); i++) {
            if (imgCarList.get(i).getCar().getId().equals(car.getId())) {
                imgCarList.remove(i);
                i--;
            }
        }
        for (String path: paths) {
            ImgCar imgCar = new ImgCar(path, car);
            imgCarList.add(imgCar);
        }
        dataImgCar.addImgCarList(imgCarList);
        return true;
    }
    public boolean removeImgCarByCarId(String id) {
        List<ImgCar> imgCars = dataImgCar.getImgCarList();
        for (int i = 0; i < imgCars.size(); i++) {
            if (imgCars.get(i).getCar().getId().equals(id)) {
                imgCars.remove(imgCars.get(i));
                i--;
            }
        }
        dataImgCar.addImgCarList(imgCars);
        return true;
    }
}
