package com.carshowroom.service.impl;

import com.carshowroom.model.Admin;
import com.carshowroom.service.ILoginService;
import com.carshowroom.utils.DataAdmin;

import java.util.List;

public class LoginService implements ILoginService {
    private DataAdmin dataAdmin = new DataAdmin();
    @Override
    public Admin checkAdmin(String username, String password) {
        List<Admin> admins = dataAdmin.getAdminList();
        for (Admin admin: admins) {
            if (admin.getUsername().equals(username) && admin.getPassword().equals(password)) {
                return admin;
            }
        }
        return null;
    }
}
