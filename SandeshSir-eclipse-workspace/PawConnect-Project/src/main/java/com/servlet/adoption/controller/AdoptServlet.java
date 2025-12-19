package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.AdoptionDAO;
import com.servlet.adoption.dao.AdoptionDAOImpl;
import com.servlet.adoption.model.Adoption;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/AdoptServlet")
public class AdoptServlet extends HttpServlet {
   

	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        // Get values from form
        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        Long phone = Long.parseLong(req.getParameter("phone"));
        String address = req.getParameter("address");
        String message = req.getParameter("message");


        HttpSession session = req.getSession();
        session.setAttribute("fullName", fullName);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("address", address);
        session.setAttribute("message", message);

        // Redirect to success page
        res.sendRedirect("adoption-success.jsp");
    }
}
