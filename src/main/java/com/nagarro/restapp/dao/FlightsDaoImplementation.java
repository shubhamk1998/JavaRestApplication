package com.nagarro.restapp.dao;

	import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.transaction.Transactional;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.nagarro.restapp.models.Flights;

@Repository
@Transactional
public class FlightsDaoImplementation implements FlightsDao {
	


	 @Autowired
	 SessionFactory sessionFactory;



	
	@Transactional
	public List<Flights> getUser(String id) {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();  
		Criteria cr = session.createCriteria(Flights.class);
		cr.add(Restrictions.eq("ID", Integer.parseInt(id)));
		List<Flights> results = cr.list();
		tx.commit();
		return results;
	}
	
	@Transactional
	public String CreateUser(String Name,String Email,String dOB,String location) {
        Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();        
        Flights flight = new Flights();
        flight.setEmail(Email);
        
	        flight.setDOB(dOB);
	        flight.setName(Name);
	        flight.setLocation(location);
	        session.save(flight);    
			tx.commit();
			return "Created";
		
        
	}

	@Transactional
	public List<Flights> getAllUsers() {
		Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();  
		Criteria cr = session.createCriteria(Flights.class);
		List<Flights> results = cr.list();
		tx.commit();
		return results;
	}

	@Override
	public String deleteUser(String id) {
		Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();  
        Flights flight = (Flights)session.get(Flights.class, Integer.parseInt(id));
        session.delete(flight);
        tx.commit();
		return "Deleted";
	}

	@Override
	public String editUser(String id, String name, String email, String dOB, String location) {
		Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();  
        Flights flight = (Flights)session.get(Flights.class, Integer.parseInt(id));
        flight.setName(name);
        flight.setDOB(dOB);
        flight.setLocation(location);
        flight.setEmail(email);
        session.saveOrUpdate(flight);
        tx.commit();
        return "Saved";
	}
	
	

	
}
