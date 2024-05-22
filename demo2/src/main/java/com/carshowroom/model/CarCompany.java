package com.carshowroom.model;

public class CarCompany {
    private int id;
    private String nameCompany;

    public CarCompany() {
    }

    public CarCompany(int id, String nameCompany) {
        this.id = id;
        this.nameCompany = nameCompany;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameCompany() {
        return nameCompany;
    }

    public void setNameCompany(String nameCompany) {
        this.nameCompany = nameCompany;
    }
}
