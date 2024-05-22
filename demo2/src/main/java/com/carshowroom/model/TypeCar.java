package com.carshowroom.model;

public class TypeCar {
    private int idType;
    private String nameType;

    public TypeCar(int idType, String nameType) {
        this.idType = idType;
        this.nameType = nameType;
    }

    public int getIdType() {
        return idType;
    }

    public void setIdType(int idType) {
        this.idType = idType;
    }

    public String getNameType() {
        return nameType;
    }

    public void setNameType(String nameType) {
        this.nameType = nameType;
    }
}