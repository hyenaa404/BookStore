package com.carshowroom.service;

import com.carshowroom.model.Car;

import java.util.List;

public interface ICarService {
    Car findCarById(String id);
    List<Car> getListCar();
    void addListCar(List<Car> cars);
    Car addCar(Car car);
    boolean updateCar(Car car);
    List<Car> getListCarOrderByPostDate();
    List<Car> searchListCarByName(String name);
    boolean removeCar(String id);
}
