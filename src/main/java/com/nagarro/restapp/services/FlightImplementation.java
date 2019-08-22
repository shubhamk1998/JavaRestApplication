package com.nagarro.restapp.services;
import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nagarro.restapp.dao.FlightsDao;
import com.nagarro.restapp.models.Flights;

@Service
@Transactional
public class FlightImplementation implements FlightService {
	
	@Inject	
	FlightsDao FlightsDao;

	@Override
	@Transactional
    public List<Flights> getUser(String id) {
			System.out.println(this.FlightsDao);
			return this.FlightsDao.getUser(id);
	}
	
	
	@Override
	@Transactional
    public String deleteUser(String id) {
			return this.FlightsDao.deleteUser(id);
	}
	
	@Override
	@Transactional
	public String CreateUser(String Name,String Email,String dOB,String location) {
		return this.FlightsDao.CreateUser(Name,Email,dOB,location);
	}
	
	@Override
	@Transactional
	public List<Flights> getAllUsers() {
		return this.FlightsDao.getAllUsers();
	}


	@Override
	public String editUser(String id,String Name,String Email,String dOB,String location) {
		return this.FlightsDao.editUser(id,Name,Email,dOB,location);
	}

	

}
