package com.hma.packages.servicesimpl;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hma.packages.service.AuthenticationService;

public class AuthenticationServiceImpl implements AuthenticationService {

	@Override
	public void signUp(HttpServletRequest req, HttpServletResponse res) {
		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root",
					"mysql@siva");

//			prepare the query

			PreparedStatement statement = connection
					.prepareStatement("insert into authentication (email,password) values (?,?)");

			String email = req.getParameter("email");

			String password = req.getParameter("password");

			statement.setString(1, email);

			statement.setString(2, password);

//			Execute the query

			int noOfRowsAffected = statement.executeUpdate();

			if (noOfRowsAffected >= 1) {
				// System.out.println("redirect");
				res.sendRedirect("login.html");

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
	public void login(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub

		try {

			Class.forName("com.mysql.cj.jdbc.Driver");

			Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/hospital", "root",
					"mysql@siva");

//			prepare the query

			PreparedStatement statement = connection
					.prepareStatement("select * from authentication where email=? and password = ?");

			String email = req.getParameter("email");

			String password = req.getParameter("password");

			statement.setString(1, email);

			statement.setString(2, password);
			// Execute the query

			ResultSet set = statement.executeQuery();

			while (set.next()) {

				System.out.println(set.getInt("userId"));
				HttpSession session = req.getSession();
				session.setAttribute("userId", set.getInt("userId"));

			}
			PrintWriter outputMessage = res.getWriter();
			outputMessage.write("<h1> Login successfully </h1>");
			// close the connection
			connection.close();
			res.sendRedirect("dashboard.html");
		} catch (Exception e) {

			// TODO Auto-generated catch block

			e.printStackTrace();

		}

	}

}
