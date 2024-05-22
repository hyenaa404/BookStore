package com.carshowroom.model;

public class StatusCar {
    private int id;
    private String nameStatus;

    public StatusCar(int id, String nameStatus) {
        this.id = id;
        this.nameStatus = nameStatus;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNameStatus() {
        return nameStatus;
    }

    public void setNameStatus(String nameStatus) {
        this.nameStatus = nameStatus;
    }
}
