package com.carshowroom.service;

import com.carshowroom.model.Car;
import com.carshowroom.model.ImgCar;

import java.util.List;

public interface IImgCarService {
    List<ImgCar> findListImgByCarId(String id);
    List<ImgCar> getImgCars();
    boolean addNewImgCars(List<String> paths, Car car);
    boolean removeImgCarByCarId(String id);
}
