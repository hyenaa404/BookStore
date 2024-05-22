package com.carshowroom.service;

import com.carshowroom.model.StatusCar;

import java.util.List;

public interface IStatusCarService {
    StatusCar findById(int id);
    List<StatusCar> getAll();
}
