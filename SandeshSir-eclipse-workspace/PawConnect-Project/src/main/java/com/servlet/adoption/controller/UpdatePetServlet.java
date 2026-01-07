package com.servlet.adoption.controller;

import java.io.IOException;

import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;
import com.servlet.adoption.dao.PetDAO;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/updatePet")
public class UpdatePetServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		int petId = Integer.parseInt(req.getParameter("petId"));
		
		Pets pet = new Pets();
		pet.setPet_Id(petId);
        pet.setPetName(req.getParameter("petName"));
        pet.setSpecies(req.getParameter("species"));
        pet.setBreed(req.getParameter("breed"));
        pet.setAge(Integer.parseInt(req.getParameter("age")));
        pet.setGender(req.getParameter("gender"));
        pet.setLocation(req.getParameter("location"));
        pet.setImageUrl(req.getParameter("imageUrl"));

        PetDAO petDAO = new PetDAOImpl();
        boolean updated = petDAO.updatePet(pet);
        if (updated) {
            resp.sendRedirect("viewPets");
        } else {
            resp.getWriter().println("Update Failed");
        }
        
		
	}
}