package com.carshowroom.service.impl;

import com.carshowroom.model.StatusCar;
import com.carshowroom.service.IStatusCarService;
import com.carshowroom.utils.DataStatusCar;

import java.util.ArrayList;
import java.util.List;

public class StatusCarService implements IStatusCarService {
    private DataStatusCar dataStatusCar = new DataStatusCar();
    List<StatusCar> statusCarList = dataStatusCar.getStatusCarList();
    @Override
    public StatusCar findById(int id) {
        for (StatusCar statusCar: statusCarList) {
            if (statusCar.getId() == id) {
                return statusCar;
            }
        }
        return null;
    }

    @Override
    public List<StatusCar> getAll() {
        return statusCarList;
    }
}
