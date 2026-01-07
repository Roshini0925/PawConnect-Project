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

public class AdminRegisterServlet extends HttpServlet{
	
	private AdminDAO adminDAO = new AdminDAOImpl();
	@Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {

        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");
        // Check email exists
        if (adminDAO.emailExists(email)) {
            req.setAttribute("message", "Email already exists!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // Confirm password
        if (!password.equals(confirmPassword)) {
            req.setAttribute("message", "Passwords do not match!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
            return;
        }

        // Hash the password
        String hashedPassword = PasswordHash.hashPassword(password);

        Admin admin = new Admin(fullName,email, hashedPassword);

        boolean isRegistered = adminDAO.registerAdmin(admin);

        if (isRegistered) {
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("message", "Registration failed. Try again!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }

}
}