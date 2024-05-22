package com.carshowroom.utils;

import com.carshowroom.model.TypeCar;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DataTypeCar {
    public List<TypeCar> getTypeCarList() {
        List<TypeCar> typeCars = new ArrayList<>();
        BufferedReader bufferedReader = null;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(PathFile.FILE_TYPE_CAR), "UTF-8"));
            String line;
            String[] temp = null;
            while ((line = bufferedReader.readLine()) != null) {
                temp = line.split(", ");
                int id = Integer.parseInt(temp[0]);
                String nameType = temp[1];
                typeCars.add(new TypeCar(id, nameType));
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } finally {
            try {
                bufferedReader.close();
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        }
        return typeCars;
    }
}
