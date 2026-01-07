package com.servlet.adoption.controller;

import java.io.IOException;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.servlet.adoption.dao.PetDAO;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

public class UpdatePetServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int petId = Integer.parseInt(req.getParameter("petId"));
		String name = req.getParameter("name");
		String species = req.getParameter("species");
		String breed = req.getParameter("breed");
		int age = Integer.parseInt(req.getParameter("age"));
		String gender =req.getParameter("gender");
		
		PetDAO petDAO = new PetDAOImpl();
		Pets pet = petDAO.getPetById(petId);
		String existingImageUrl = pet.getImageUrl();
		String imageUrl = req.getParameter("imageUrl");
		
	
		req.setAttribute("petId", petId);
		req.getRequestDispatcher("update-pet.jsp").forward(req, resp);
	}
}
