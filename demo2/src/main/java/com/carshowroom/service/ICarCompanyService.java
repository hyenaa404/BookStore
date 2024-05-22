package com.carshowroom.service;

import com.carshowroom.model.CarCompany;

import java.util.List;

public interface ICarCompanyService {
    CarCompany findById(int id);
    List<CarCompany> getAll();
}
