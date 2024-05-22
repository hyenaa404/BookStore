package com.carshowroom.utils;

import com.carshowroom.model.Admin;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

public class DataAdmin {
    public List<Admin> getAdminList() {
        List<Admin> admins = new ArrayList<>();
        BufferedReader bufferedReader = null;
        try {
            FileReader fileReader = new FileReader(PathFile.FILE_ADMIN);
            bufferedReader = new BufferedReader(fileReader);
            String line;
            String[] temp = null;
            while ((line = bufferedReader.readLine()) != null) {
                temp = line.split(", ");
                String id = temp[0];
                String username = temp[1];
                String password = temp[2];
                String email = temp[3];
                String phoneNumber = temp[4];
                admins.add(new Admin(id, username, password, email, phoneNumber));
            }
            bufferedReader.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return admins;
    }
    public void addAdmin(List<Admin> admins) {
        BufferedWriter bufferedWriter = null;
        try {
            FileWriter fileWriter = new FileWriter(PathFile.FILE_ADMIN);
            bufferedWriter = new BufferedWriter(fileWriter);
            for (Admin admin: admins) {
                bufferedWriter.write(admin.convertLine() + "\n");
            }
            bufferedWriter.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
