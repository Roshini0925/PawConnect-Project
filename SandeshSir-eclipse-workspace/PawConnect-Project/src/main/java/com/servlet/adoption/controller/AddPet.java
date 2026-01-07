package com.servlet.adoption.controller;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import com.servlet.adoption.dao.PetDAO;
import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

@WebServlet("/AddPets")
@MultipartConfig
public class AddPet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        try {
            String petName = req.getParameter("name");
            String type = req.getParameter("type");
            String breed = req.getParameter("breed");
            int age = Integer.parseInt(req.getParameter("age"));
            String gender = req.getParameter("gender");
            String location = req.getParameter("location");

            // CHECK FOR DEBUG
            System.out.println("Pet Name: " + petName);
            System.out.println("Type: " + type);

            // IMAGE UPLOAD
            Part filePart = req.getPart("imageUrl");
            String fileName = System.currentTimeMillis() + "_" + filePart.getSubmittedFileName();

            String uploadPath = getServletContext().getRealPath("images/pawconnect_images");
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();

            File file = new File(uploadDir, fileName);
            Files.copy(filePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            // STORE PET DATA
            Pets pet = new Pets();
            pet.setPetName(petName);
            pet.setSpecies(type);
            pet.setBreed(breed);
            pet.setAge(age);
            pet.setGender(gender);
            pet.setLocation(location);
            pet.setImageUrl("images/pawconnect_images/" + fileName);

            PetDAO dao = new PetDAOImpl();
            boolean inserted = dao.addPet(pet);

            if (inserted) {
                resp.sendRedirect("adminDashboard.jsp?msg=Pet Added Successfully");
            } else {
                resp.sendRedirect("addPet.jsp?error=Failed to Insert");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("addPet.jsp?error=Exception Occurred");
        }
    }
}
