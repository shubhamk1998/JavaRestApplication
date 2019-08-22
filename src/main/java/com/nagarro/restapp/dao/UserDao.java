package com.nagarro.restapp.dao;

import com.nagarro.restapp.models.User;

public interface UserDao {
    public User getUserDetails(String username);
    public Boolean userAuthentication(String username, String password);
}
