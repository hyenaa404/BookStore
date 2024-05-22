package com.carshowroom.model;

import java.util.UUID;

public class ImgCar {
    private String id;
    private String imgPath;
    private Car car;

    public ImgCar(String imgPath, Car car) {
        this.id = UUID.randomUUID().toString();
        this.imgPath = imgPath;
        this.car = car;
    }

    public ImgCar(String id, String imgPath, Car car) {
        this.id = id;
        this.imgPath = imgPath;
        this.car = car;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getImgPath() {
        return imgPath;
    }

    public void setImgPath(String imgPath) {
        this.imgPath = imgPath;
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }
    public String convertLine() {
        return id + ", " + imgPath + ", " + car.getId();
    }
}
