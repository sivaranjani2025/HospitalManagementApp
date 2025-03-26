package com.hma.packages.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.AppointmentService;
import com.hma.packages.servicesimpl.AppointmentServiceImpl;

@WebServlet("/bookAppointment")
public class BookAppointmentController extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("Servlet works");
		AppointmentService service= new AppointmentServiceImpl();
		service.bookAppointment(req, resp);
	}
}
