package com.nagarro.restapp.services;


import org.glassfish.jersey.internal.inject.AbstractBinder;
import org.glassfish.jersey.media.multipart.MultiPartFeature;
import org.glassfish.jersey.server.ResourceConfig;
import org.glassfish.jersey.server.spring.scope.RequestContextFilter;

import com.nagarro.restapp.controllers.FlightController;
import com.nagarro.restapp.dao.FlightsDao;
import com.nagarro.restapp.dao.FlightsDaoImplementation;

public class MyApplication extends ResourceConfig {

	/**
	 * Register JAX-RS application components.
	 */
	public MyApplication() {
		register(MultiPartFeature.class);
		register(RequestContextFilter.class);
		register(FlightController.class);
		 register(new AbstractBinder() {
	            @Override
	            protected void configure() {
            	    bind(FlightsDaoImplementation.class).to(FlightsDao.class);
	            	    bind(FlightImplementation.class).to(FlightService.class);
	            }
	        });
	}
}