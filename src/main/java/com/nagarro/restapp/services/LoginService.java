package com.nagarro.restapp.services;

import com.nagarro.restapp.models.User;

public interface LoginService {
	public User getUserDetails(String username);
    public Boolean userAuthentication(String username, String password);
}
