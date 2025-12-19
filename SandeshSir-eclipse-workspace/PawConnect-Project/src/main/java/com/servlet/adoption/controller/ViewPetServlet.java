package com.servlet.adoption.controller;

import java.io.IOException;
import java.util.List;

import com.servlet.adoption.dao.PetDAOImpl;
import com.servlet.adoption.model.Pets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewPets")
public class ViewPetServlet extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PetDAOImpl dao = new PetDAOImpl();
        List<Pets> pets = dao.getAllPets(); 

        req.setAttribute("pets", pets);
        req.getRequestDispatcher("viewPets.jsp").forward(req, resp);
       
    }
}
