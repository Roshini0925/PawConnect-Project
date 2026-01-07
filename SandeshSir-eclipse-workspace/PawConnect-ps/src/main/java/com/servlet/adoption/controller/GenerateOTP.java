package com.servlet.adoption.controller;

import java.io.IOException;
import java.security.SecureRandom;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/GenerateOTP")
public class GenerateOTP extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userId = request.getParameter("userId");

        // Generate 6-digit OTP
        SecureRandom random = new SecureRandom();
        int otp = 100000 + random.nextInt(900000);

        HttpSession session = request.getSession();
        session.setAttribute("otp", otp);
        session.setAttribute("userId", userId);

        System.out.println("Generated OTP: " + otp); // Testing

        response.sendRedirect("enterOtp.jsp");
    }
}