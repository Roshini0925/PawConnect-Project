package com.servlet.adoption.controller;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ValidateOTP")
public class ValidateOTP extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        Object otpObj = session.getAttribute("otp");
        String userEnteredOtp = request.getParameter("otpValue");

        if (otpObj != null && otpObj.toString().equals(userEnteredOtp)) {
            response.sendRedirect("success.jsp");
        } else {
            response.sendRedirect("fail.jsp");
        }
    }
}