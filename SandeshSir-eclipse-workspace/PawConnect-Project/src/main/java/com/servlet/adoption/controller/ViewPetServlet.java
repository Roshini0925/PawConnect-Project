package com.servlet.adoption.controller;

import java.io.IOException;
import java.util.List;

import com.servlet.adoption.dao.PetDAO;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class ViewPetServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		PetDAO petDAO = new PetDAOImpl();
		List<Pets> petList = petDAO.getAllPets();
		req.setAttribute("petList", petList);
		req.getRequestDispatcher("pet.jsp").forward(req, resp);
	}
}
