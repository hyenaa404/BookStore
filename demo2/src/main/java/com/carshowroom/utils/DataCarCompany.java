package com.carshowroom.utils;

import com.carshowroom.model.CarCompany;
import com.carshowroom.model.TypeCar;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DataCarCompany {
    public List<CarCompany> getCarCompanyList() {
        List<CarCompany> carCompanies = new ArrayList<>();
        BufferedReader bufferedReader = null;
        try {
            bufferedReader = new BufferedReader(new InputStreamReader(new FileInputStream(PathFile.FILE_CAR_COMPANY), "UTF-8"));
            String line;
            String[] temp = null;
            while ((line = bufferedReader.readLine()) != null) {
                temp = line.split(", ");
                int id = Integer.parseInt(temp[0]);
                String nameCompany = temp[1];
                carCompanies.add(new CarCompany(id, nameCompany));
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
        return carCompanies;
    }
}
