package com.hma.packages.servicesimpl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.DoctorService;

public class DoctorServiceImpl implements DoctorService{

	@Override
	public void makeDoctorAvailable(HttpServletRequest req, HttpServletResponse res) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root",
					"mysql@siva");

//			prepare the query

			PreparedStatement statement = connection
					.prepareStatement("update doctor set availablity = true where doctorId= ?");

			String id= req.getParameter("id");
			statement.setInt(1, Integer.parseInt(id));

//			Execute the query

			int noOfRowsAffected = statement.executeUpdate();

			if (noOfRowsAffected >= 1) {
				res.sendRedirect("Alldoctor.jsp");

			} else {

				System.err.println("something went wrong");

			}

			// close the connection

			connection.close();

		} catch (Exception e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}
	

	@Override
	public void makeDoctorUnAvailable(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root",
					"mysql@siva");

//			prepare the query

			PreparedStatement statement = connection
					.prepareStatement("update doctor set availablity = false where doctorId= ?");

			String id= req.getParameter("id");
			statement.setInt(1, Integer.parseInt(id));

//			Execute the query

			int noOfRowsAffected = statement.executeUpdate();

			if (noOfRowsAffected >= 1) {
				res.sendRedirect("Alldoctor.jsp");
				//res.sendRedirect("dashboard.html");

			} else {

				System.err.println("something went wrong");

			}

			// close the connection

			connection.close();

		} catch (Exception e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}	
	}

