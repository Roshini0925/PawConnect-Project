package com.servlet.adoption.controller;

import java.io.File;
import java.io.IOException;

import com.servlet.adoption.dao.PetDAO;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/add-pet")
public class AddPetServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
		
		String name=req.getParameter("name");
		String species=req.getParameter("species");
		String breed=req.getParameter("breed");
		int age=Integer.parseInt(req.getParameter("age"));
		String gender=req.getParameter("gender");
		Part imgPart=req.getPart("imageUrl");
		String fileName=imgPart.getSubmittedFileName();
		
		String uploadPath="C:/Users/HP/eclipse-workspace/PawConnect-Project/src/main/webapp/images/"+fileName;
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists()) {
			uploadDir.mkdir();
			
			imgPart.write(uploadPath+File.separator + fileName);
			Pets Pet=new Pets();
			PetDAO petDAO=new PetDAOImpl();
			boolean saved=petDAO.addPet(Pet);
			
			if(saved) {
				resp.sendRedirect("admin-dashboard.jsp?msg=Pet Added Successfully");
				}else {
					resp.sendRedirect("admin-dashboard.jsp?msg=Error adding pet");
					
				}
				
			
			
		}
	}
}
