package com.servlet.adoption.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.servlet.adoption.dao.UserDAO;
import com.servlet.adoption.dao.UserDAOImpl;
import com.servlet.adoption.dto.User;
import com.servlet.adoption.util.PasswordHash;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	private UserDAO userDAO = new UserDAOImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

    	        String email = req.getParameter("email");
    	        String password = req.getParameter("password");

    	        // Convert password into hash
    	        String hashedPassword = PasswordHash.hashPassword(password);
    	        
    	       User user= userDAO.loginUser(email, hashedPassword);
    	       if (user!=null) {
    	            // Create session
    	            HttpSession session = req.getSession();
    	            session.setAttribute("user", user);
    	            resp.sendRedirect("pet.jsp");  // Redirect to homepage
    	        } else {
    	            req.setAttribute("message", "Invalid Email or Password!");
    	            req.getRequestDispatcher("home.jsp").forward(req, resp);
    	        }
    }
}