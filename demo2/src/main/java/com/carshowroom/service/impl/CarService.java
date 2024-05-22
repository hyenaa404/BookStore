package com.carshowroom.service.impl;

import com.carshowroom.model.Car;
import com.carshowroom.service.ICarService;
import com.carshowroom.utils.DataCar;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

public class CarService implements ICarService {
    private DataCar dataCar = new DataCar();
    @Override
    public Car findCarById(String id) {
        List<Car> cars = dataCar.getCarList();
        for (Car car: cars) {
            if (car.getId().equals(id)) {
                return car;
            }
        }
        return null;
    }

    @Override
    public List<Car> getListCar() {
        return dataCar.getCarList();
    }

    @Override
    public void addListCar(List<Car> cars) {
        dataCar.addCars(cars);
    }

    @Override
    public Car addCar(Car car) {
        return dataCar.addCar(car);
    }

    @Override
    public boolean updateCar(Car car) {
        List<Car> newListCar = dataCar.getCarList();
        for (int i = 0; i < newListCar.size(); i++) {
            if (car.getId().equals(newListCar.get(i).getId())) {
                newListCar.set(i, car);
                break;
            }
        }
        dataCar.addCars(newListCar);
        return true;
    }

    @Override
    public List<Car> getListCarOrderByPostDate() {
        List<Car> cars = getListCar();
        Collections.sort(cars, new Comparator<Car>() {
            @Override
            public int compare(Car o1, Car o2) {
                if (o2.getPostDate().compareTo(o1.getPostDate()) == 0) return 0;
                else if (o2.getPostDate().compareTo(o1.getPostDate()) > 1) return 1;
                else if (o2.getPostDate().compareTo(o1.getPostDate()) < 1) return -1;
                else  return o1.getId().compareTo(o2.getId());
            }
        });
        return cars;
    }

    @Override
    public List<Car> searchListCarByName(String name) {
        List<Car> cars = getListCarOrderByPostDate().stream().filter(o -> o.getNameCar().contains(name)).collect(Collectors.toList());
        return cars;
    }
    public boolean removeCar(String id) {
        List<Car> cars = getListCarOrderByPostDate();
        for (int i = 0; i < cars.size(); i++) {
            if (cars.get(i).getId().equals(id)) {
                cars.remove(i);
                break;
            }
        }
        dataCar.addCars(cars);
        return true;
    }
}
