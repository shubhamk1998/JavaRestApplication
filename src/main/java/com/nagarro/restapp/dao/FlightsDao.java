package com.nagarro.restapp.dao;

import java.util.List;

import org.hibernate.Session;

import com.nagarro.restapp.models.Flights;

public interface FlightsDao {

	public List<Flights> getUser(String id);

	public String CreateUser(String Name,String Email,String dOB,String location);

	public List<Flights> getAllUsers();

	public  String deleteUser(String id);

	public String editUser(String id, String name, String email, String dOB, String location);
}
