package com.servlet.adoption.controller;

import java.io.IOException;
import java.util.List;

import com.servlet.adoption.dao.UserDAO;
import com.servlet.adoption.dao.UserDAOImpl;
import com.servlet.adoption.dto.User;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/viewUsers")
public class ViewUserServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserDAO userDAO = new UserDAOImpl();
        List<User> users = userDAO.getAllUsers();

        request.setAttribute("usersList", users);
        RequestDispatcher rd = request.getRequestDispatcher("viewUsers.jsp");
        rd.forward(request, response);
    }
}