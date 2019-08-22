package com.nagarro.restapp.controllers;

import java.io.BufferedReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.FormParam;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.WebApplicationException;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.ResponseBuilder;
import javax.ws.rs.core.StreamingOutput;

import org.glassfish.jersey.media.multipart.FormDataContentDisposition;
import org.glassfish.jersey.media.multipart.FormDataParam;

import com.nagarro.restapp.models.Flights;
import com.nagarro.restapp.services.FlightService;

@Path("/Users")
public class FlightController {

	@Inject
	FlightService flightService;

	@GET
	@Path("/getuser")
	@Produces(MediaType.TEXT_PLAIN)
	public String getuser(@QueryParam("id") String id) throws ParseException {
		List<Flights> allflights = this.flightService.getUser(id);
		return allflights.toString();
	}

	@DELETE
	@Path("/deleteuser")
	@Produces(MediaType.TEXT_PLAIN)
	public String deleteUser(@QueryParam("id") String id) throws ParseException {
		return this.flightService.deleteUser(id);
	}

	@PUT
	@Path("/edituser")
	@Produces(MediaType.TEXT_PLAIN)
	public String editUser(@QueryParam("id") String id, @QueryParam("Name") String Name,
			@QueryParam("Email") String Email, @QueryParam("DOB") String dOB, @QueryParam("Location") String location) {
		return this.flightService.editUser(id, Name, Email, dOB, location);
	}

	@GET
	@Path("/createuser")
	@Produces(MediaType.TEXT_PLAIN)
	public String createUser(@QueryParam("Name") String Name, @QueryParam("Email") String Email,
			@QueryParam("DOB") String dOB, @QueryParam("Location") String location) {
		return this.flightService.CreateUser(Name, Email, dOB, location);
	}

	@GET
	@Path("/getallusers")
	@Produces(MediaType.TEXT_PLAIN)
	public String getAllUsers() {
		return this.flightService.getAllUsers().toString();
	}

	@POST
	@Path("/upload")
	@Consumes(MediaType.MULTIPART_FORM_DATA)
	@Produces(MediaType.TEXT_PLAIN)
	public String bulkupload(@FormDataParam("file") InputStream uploadedInputStream)
			throws UnsupportedEncodingException, IOException {
		try (BufferedReader br = new BufferedReader(new InputStreamReader(uploadedInputStream, "UTF-8"))) {
			String csvdata = br.lines().collect(Collectors.joining(System.lineSeparator())).substring(1);
			String[] lines = csvdata.split("\n");
			String str = "";
			Boolean error = false;
			for (String line : lines) {
				String[] data = line.split(",");
				String Name = data[0];
				String Email = data[1];
				String dOB = data[2];
				String location = data[3];
				if ((this.flightService.CreateUser(Name, Email, dOB, location).equals("Error"))) {
					error = true;
					str = str + "," + Email;
				}
			}
			if (!error) {
				str = str + "Created";
			}
			return str;
		}

	}

	@GET
	@Path("/downloadCSV")
	public Response downloadCSV() {
		StreamingOutput fileStream = new StreamingOutput() {
			@Override
			public void write(java.io.OutputStream output) throws IOException, WebApplicationException {
				try {
					output.write(("Name,Email,DOB,Location"+"\n").getBytes());
					List<Flights> users = flightService.getAllUsers();
					for (Flights flight : users) {
						output.write((flight.getName() + "," + flight.getEmail() + "," + flight.getDOB() + ","
								+ flight.getLocation() + "\n").getBytes());
					}
					output.flush();
				} catch (Exception e) {

				}
			}
		};
		return Response.ok(fileStream, MediaType.APPLICATION_OCTET_STREAM)
				.header("content-disposition", "attachment; filename = Employees.csv").build();

	}

}
