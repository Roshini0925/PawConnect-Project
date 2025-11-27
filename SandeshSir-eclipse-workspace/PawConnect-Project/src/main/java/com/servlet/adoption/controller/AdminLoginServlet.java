package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.AdminDAO;
import com.servlet.adoption.dao.AdminDAOImpl;
import com.servlet.adoption.util.PasswordHash;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class AdminLoginServlet extends HttpServlet{
		
		private AdminDAO adminDAO = new AdminDAOImpl();
		
		protected void doPost(HttpServletRequest req, HttpServletResponse resp)
	            throws ServletException, IOException {

	    	        String email = req.getParameter("email");
	    	        String password = req.getParameter("password");

	    	        // Convert password into hash
	    	        String hashedPassword = PasswordHash.hashPassword(password);
	    	        
	    	       boolean isValid = adminDAO.loginAdmin(hashedPassword, hashedPassword);
	    	       if (isValid) {
	    	            // Create session
	    	            HttpSession session = req.getSession();
	    	            session.setAttribute("Email", email);
	    	            resp.sendRedirect("pet.jsp");  // Redirect to homepage
	    	        } else {
	    	            req.setAttribute("message", "Invalid Email or Password!");
	    	            req.getRequestDispatcher("login.jsp").forward(req, resp);
	    	        }
	    }

	}

