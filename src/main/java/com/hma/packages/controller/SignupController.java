package com.hma.packages.controller;

import java.io.IOException;
import java.security.Provider.Service;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.AuthenticationService;
import com.hma.packages.servicesimpl.AuthenticationServiceImpl;
@WebServlet("/signup")
public class SignupController  extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		AuthenticationService service =new AuthenticationServiceImpl();
		service.signUp(req, resp);
	}
	

	}


