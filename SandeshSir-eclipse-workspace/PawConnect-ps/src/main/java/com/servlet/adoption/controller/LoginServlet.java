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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private UserDAO userDAO = new UserDAOImpl();

    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String role = req.getParameter("role");  
        String redirect = req.getParameter("redirect"); 

        HttpSession session = req.getSession();

        try {
        	if ("admin".equals(role)) {

        	    if ("admin@gmail.com".equals(email) && "admin123".equals(password)) {
        	        session.setAttribute("admin", "Admin");
        	        resp.sendRedirect("adminDashboard.jsp");
        	        return;
        	    } else {
        	        resp.sendRedirect("login.jsp?error=1");
        	        return;
        	    }
        	}
            String hashedPassword = PasswordHash.hashPassword(password);
            User user = userDAO.loginUser(email, hashedPassword);

            if (user != null) {
                session.setAttribute("user", user.getFullName());

                // Redirect to the page user was originally trying to access
                if (redirect != null && !redirect.isEmpty()) {
                    resp.sendRedirect(redirect);
                } else {
                    resp.sendRedirect("pets.jsp");
                }

            } else {
                resp.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.sendRedirect("login.jsp?error=1");
        }
    }
}
