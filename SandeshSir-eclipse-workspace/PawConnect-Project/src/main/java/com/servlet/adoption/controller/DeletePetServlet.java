package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.PetDAOImpl;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/deletePet")
public class DeletePetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int petId = Integer.parseInt(req.getParameter("petId"));
        PetDAOImpl dao = new PetDAOImpl();
        boolean deleted = dao.deletePet(petId);

        if(deleted) {
            resp.sendRedirect("viewPets");
        } else {
            resp.getWriter().println("Error deleting pet.");
        }
    }
}