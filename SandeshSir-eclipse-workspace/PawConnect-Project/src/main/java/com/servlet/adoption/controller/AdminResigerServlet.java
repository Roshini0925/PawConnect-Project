package com.servlet.adoption.controller;

import java.io.IOException;

import com.servlet.adoption.dao.AdminDAO;
import com.servlet.adoption.dao.AdminDAOImpl;
import com.servlet.adoption.dto.Admin;
import com.servlet.adoption.util.PasswordHash;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class AdminResigerServlet extends HttpServlet {
	private AdminDAO adminDAO=new AdminDAOImpl();

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	        String fullName = req.getParameter("fullName");
	        String email = req.getParameter("email");
	        String password = req.getParameter("password");
	        String confirmpassword = req.getParameter("confirmpassword");
	        // Check email exists

	        if (adminDAO.emailExists(email)) {
	            req.setAttribute("message", "Email already exists!");
	            req.getRequestDispatcher("register.jsp").forward(req, resp);
	            return;
	        }

	        if (!password.equals(confirmpassword)) {
	            req.setAttribute("message", "Passwords do not match!");
	            req.getRequestDispatcher("register.jsp").forward(req, resp);

	            return;
	        }
	        // Hash the password
	        String hashedPassword = PasswordHash.hashPassword(password);
	        Admin admin = new Admin(fullName,email,hashedPassword);
            Boolean isRegistered = adminDAO.registerAdmin(admin);

	        if (isRegistered) {
            resp.sendRedirect("login.jsp");
	        } else {
	            req.setAttribute("message", "Registration failed. Try again!");
	            req.getRequestDispatcher("register.jsp").forward(req, resp);

	}

	}

}
