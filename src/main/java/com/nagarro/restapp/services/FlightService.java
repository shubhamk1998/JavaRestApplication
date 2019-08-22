package com.nagarro.restapp.services;

import java.util.List;

import com.nagarro.restapp.models.Flights;

public interface FlightService {
	public List<Flights> getUser(String id);
	public List<Flights> getAllUsers();
	public String  CreateUser(String Name,String Email,String dOB,String location);
	public String deleteUser(String id);
	public String editUser(String id, String Name, String Email, String dOB, String location);

}
