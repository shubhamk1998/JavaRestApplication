package com.nagarro.restapp.services;


import com.nagarro.restapp.dao.UserDao;
import com.nagarro.restapp.models.User;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class LoginServiceImplementation implements LoginService {

	private UserDao UserDao;

	public void setUserDao(UserDao UserDao) {
		this.UserDao = UserDao;
	}
	
    @Override
	@Transactional
    public Boolean userAuthentication(String username, String password) {
    	return this.UserDao.userAuthentication(username,password);
    }

    @Override
    @Transactional
    public User getUserDetails(String username) {
    	return this.UserDao.getUserDetails(username);
    }

}

