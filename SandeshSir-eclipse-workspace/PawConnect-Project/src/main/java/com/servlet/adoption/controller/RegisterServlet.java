package com.servlet.adoption.controller;

import java.io.IOException;

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


@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String fullName = req.getParameter("fullName");
        String email = req.getParameter("email");
        Long phone = Long.parseLong(req.getParameter("phone"));
        String password = req.getParameter("password");
        String confirmPassword = req.getParameter("confirmPassword");

        // Check email exists
        if (userDAO.emailExists(email)) {
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

        User user = new User(fullName,email, phone, hashedPassword);

        boolean isRegistered = userDAO.registerUser(user);

        if (isRegistered) {
        	HttpSession session = req.getSession();
            session.setAttribute("email", email);
            session.setAttribute("userName", fullName);
            resp.sendRedirect("login.jsp");
        } else {
            req.setAttribute("message", "Registration failed. Try again!");
            req.getRequestDispatcher("register.jsp").forward(req, resp);
        }
        
    }
}