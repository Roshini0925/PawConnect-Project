package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.PetDAO;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class EditPetServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int petId = Integer.parseInt(req.getParameter("petId"));
		PetDAO petDAO = new PetDAOImpl();
		Pets pet = petDAO.getPetById(petId);
		req.setAttribute("pet", pet);
		req.getRequestDispatcher("edit-pet.jsp").forward(req, resp);
		
	}
}