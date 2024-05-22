package com.carshowroom.service.impl;

import com.carshowroom.model.TypeCar;
import com.carshowroom.service.ITypeCarService;
import com.carshowroom.utils.DataTypeCar;

import java.lang.reflect.Type;
import java.util.List;

public class TypeCarService implements ITypeCarService {
    private DataTypeCar dataTypeCar = new DataTypeCar();
    private List<TypeCar> typeCars = dataTypeCar.getTypeCarList();
    @Override
    public TypeCar findById(int id) {
        for (TypeCar typeCar: typeCars) {
            if (typeCar.getIdType() == id) {
                return typeCar;
            }
        }
        return null;
    }

    @Override
    public List<TypeCar> getAll() {
        return typeCars;
    }
}
