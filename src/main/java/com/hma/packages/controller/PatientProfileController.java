package com.hma.packages.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hma.packages.service.ProfileService;
import com.hma.packages.servicesimpl.ProfileServiceImpl;

@WebServlet("/createPatientProfile")
public class PatientProfileController extends HttpServlet {

@Override
protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//System.out.println("working");
ProfileService service = new ProfileServiceImpl();
service.createPatientProfile(req, resp);
}
}
