package com.nagarro.restapp.models;

import org.json.simple.JSONObject;

import java.text.ParseException;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import com.fasterxml.jackson.databind.util.JSONPObject;

@Entity
@Table(name = "Employees")
public class Flights {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ID", unique = true, nullable = false)
	private Integer ID;

	public void setName(String name) {
		Name = name;
	}

	public void setLocation(String location) {
		Location = location;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public void setDOB(String dOB) {
		DOB = dOB;
	}

	@Column(name = "Name")
	private String Name;

	@Column(name = "Location")
	private String Location;

	@Column(name = "Email")
	private String Email;

	@Column(name = "DOB")
	private String DOB;

	public Flights() {
	}

	public Flights(String name, String location, String email, String dob) {
		this.Name = name;
		this.Location = location;
		this.Email = email;
		this.DOB = dob;
	}

	public Integer getID() {
		return this.ID;
	}

	public String getName() {
		return this.Name;
	}

	public String getLocation() {
		return this.Location;
	}

	public String getEmail() {
		return this.Email;
	}

	public String getDOB() {
		return this.DOB;
	}

	public String toString() {
		JSONObject obj = new JSONObject();
		obj.put("Id", this.getID());
		obj.put("Name", this.getName());
		obj.put("Location", this.getLocation());
		obj.put("Email", this.getEmail());
		obj.put("DOB", this.getDOB());
		return obj.toString();
	}

}
