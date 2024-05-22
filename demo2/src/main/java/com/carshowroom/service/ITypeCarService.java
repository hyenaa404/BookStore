package com.carshowroom.service;

import com.carshowroom.model.TypeCar;

import java.util.List;

public interface ITypeCarService {
    TypeCar findById(int id);
    List<TypeCar> getAll();
}
