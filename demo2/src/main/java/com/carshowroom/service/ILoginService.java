package com.carshowroom.service;

import com.carshowroom.model.Admin;

public interface ILoginService {
    Admin checkAdmin(String username, String password);
}
