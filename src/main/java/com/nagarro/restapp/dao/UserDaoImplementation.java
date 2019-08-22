package com.nagarro.restapp.dao;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.stereotype.Repository;

import com.nagarro.restapp.models.User;

@Repository
public class  UserDaoImplementation implements UserDao {
	
	private SessionFactory sessionFactory;
	
	public void setSessionFactory(SessionFactory sf){
		this.sessionFactory = sf;
	}
	
	@Override
	@Transactional
	public User getUserDetails(String username) {
		Session session = this.sessionFactory.getCurrentSession();
        Transaction tx = session.beginTransaction();  
		User user = (User) session.load(User.class, username);
		tx.commit();
		return user;
	}
	
	@Override
	@Transactional
	public Boolean userAuthentication(String username, String password) {

		
               Session session = this.sessionFactory.getCurrentSession();
               Transaction tx = session.beginTransaction();  

               try {
            	   User user = (User) session.get(User.class, username);
            	   tx.commit();

                   if (user.getUsername() != null && user.getPassword().equals(password))
                	   return true;
                   else
                	   return false;
            	   
               }
               catch(Exception e) {
            	   return false;
               }
               
    }


}
