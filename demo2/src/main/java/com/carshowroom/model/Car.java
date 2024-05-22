package com.carshowroom.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.List;
import java.util.UUID;

public class Car {
    private String id;
    private String nameCar;
    private BigDecimal price;
    private String original;
    private StatusCar statusCar;
    private String exteriorColor;
    private String interiorColor;
    private int doorAmount;
    private int seatAmount;
    private String gearBox;
    private String fwd;
    private String fuelConsumption;
    private String description;
    private TypeCar typeCar;
    private CarCompany carCompany;
    private LocalDate postDate;

    public Car(String nameCar, BigDecimal price, String original, StatusCar statusCar, String exteriorColor, String interiorColor, int doorAmount, int seatAmount, String gearBox, String fwd, String fuelConsumption, String description, TypeCar typeCar, CarCompany carCompany, LocalDate postDate) {
        this.id = UUID.randomUUID().toString();
        this.nameCar = nameCar;
        this.price = price;
        this.original = original;
        this.statusCar = statusCar;
        this.exteriorColor = exteriorColor;
        this.interiorColor = interiorColor;
        this.doorAmount = doorAmount;
        this.seatAmount = seatAmount;
        this.gearBox = gearBox;
        this.fwd = fwd;
        this.fuelConsumption = fuelConsumption;
        this.description = description;
        this.typeCar = typeCar;
        this.carCompany = carCompany;
        this.postDate = postDate;
    }

    public Car(String id, String nameCar, BigDecimal price, String original, StatusCar statusCar, String exteriorColor, String interiorColor, int doorAmount, int seatAmount, String gearBox, String fwd, String fuelConsumption, String description, TypeCar typeCar, CarCompany carCompany, LocalDate postDate) {
        this.id = id;
        this.nameCar = nameCar;
        this.price = price;
        this.original = original;
        this.statusCar = statusCar;
        this.exteriorColor = exteriorColor;
        this.interiorColor = interiorColor;
        this.doorAmount = doorAmount;
        this.seatAmount = seatAmount;
        this.gearBox = gearBox;
        this.fwd = fwd;
        this.fuelConsumption = fuelConsumption;
        this.description = description;
        this.typeCar = typeCar;
        this.carCompany = carCompany;
        this.postDate = postDate;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNameCar() {
        return nameCar;
    }

    public void setNameCar(String nameCar) {
        this.nameCar = nameCar;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getOriginal() {
        return original;
    }

    public void setOriginal(String original) {
        this.original = original;
    }

    public StatusCar getStatusCar() {
        return statusCar;
    }

    public void setStatusCar(StatusCar statusCar) {
        this.statusCar = statusCar;
    }

    public String getExteriorColor() {
        return exteriorColor;
    }

    public void setExteriorColor(String exteriorColor) {
        this.exteriorColor = exteriorColor;
    }

    public String getInteriorColor() {
        return interiorColor;
    }

    public void setInteriorColor(String interiorColor) {
        this.interiorColor = interiorColor;
    }

    public int getDoorAmount() {
        return doorAmount;
    }

    public void setDoorAmount(int doorAmount) {
        this.doorAmount = doorAmount;
    }

    public int getSeatAmount() {
        return seatAmount;
    }

    public void setSeatAmount(int seatAmount) {
        this.seatAmount = seatAmount;
    }

    public String getGearBox() {
        return gearBox;
    }

    public void setGearBox(String gearBox) {
        this.gearBox = gearBox;
    }

    public String getFwd() {
        return fwd;
    }

    public void setFwd(String fwd) {
        this.fwd = fwd;
    }

    public String getFuelConsumption() {
        return fuelConsumption;
    }

    public void setFuelConsumption(String fuelConsumption) {
        this.fuelConsumption = fuelConsumption;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public TypeCar getTypeCar() {
        return typeCar;
    }

    public void setTypeCar(TypeCar typeCar) {
        this.typeCar = typeCar;
    }

    public CarCompany getCarCompany() {
        return carCompany;
    }

    public void setCarCompany(CarCompany carCompany) {
        this.carCompany = carCompany;
    }

    public LocalDate getPostDate() {
        return postDate;
    }

    public void setPostDate(LocalDate postDate) {
        this.postDate = postDate;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id='" + id + '\'' +
                ", nameCar='" + nameCar + '\'' +
                ", price=" + price +
                ", original='" + original + '\'' +
                ", statusCar=" + statusCar.getId() +
                ", exteriorColor='" + exteriorColor + '\'' +
                ", interiorColor='" + interiorColor + '\'' +
                ", doorAmount=" + doorAmount +
                ", seatAmount=" + seatAmount +
                ", gearBox='" + gearBox + '\'' +
                ", fwd='" + fwd + '\'' +
                ", fuelConsumption='" + fuelConsumption + '\'' +
                ", description='" + description + '\'' +
                ", typeCar=" + typeCar.getIdType() +
                ", carCompany=" + carCompany.getId() +
                ", postDate=" + postDate +
                '}';
    }

    public String convertLine() {
        return id + ", " + nameCar + ", " + price.longValueExact() + ", " + original + ", " + statusCar.getId() + ", " + exteriorColor + ", " + interiorColor + ", " + doorAmount + ", " + seatAmount + ", " + gearBox + ", " + fwd + ", " + fuelConsumption + ", " + description + ", " + typeCar.getIdType() + ", " + carCompany.getId() + ", " + postDate;
    }
}
