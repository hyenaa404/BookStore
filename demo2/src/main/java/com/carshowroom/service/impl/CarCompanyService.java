package com.carshowroom.service.impl;

import com.carshowroom.model.CarCompany;
import com.carshowroom.service.ICarCompanyService;
import com.carshowroom.utils.DataCarCompany;

import java.util.ArrayList;
import java.util.List;

public class CarCompanyService implements ICarCompanyService {
    private DataCarCompany dataCarCompany = new DataCarCompany();
    private List<CarCompany> carCompanyList = dataCarCompany.getCarCompanyList();
    @Override
    public CarCompany findById(int id) {
        for (CarCompany carCompany: carCompanyList) {
            if (carCompany.getId() == id) {
                return carCompany;
            }
        }
        return null;
    }

    @Override
    public List<CarCompany> getAll() {
        return carCompanyList;
    }
}
