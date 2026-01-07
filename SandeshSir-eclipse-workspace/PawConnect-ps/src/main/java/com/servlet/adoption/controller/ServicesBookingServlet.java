package com.servlet.adoption.controller;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import com.servlet.adoption.dao.ServiceDAOImpl;
import com.servlet.adoption.model.ServiceBooking;


	@WebServlet("/service")
	public class ServicesBookingServlet extends HttpServlet {

	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {

	        String serviceName = request.getParameter("serviceName");
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String phone = request.getParameter("phone");

	        ServiceBooking booking = new ServiceBooking();
	        booking.setServiceName(serviceName);
	        booking.setCustomerName(name);
	        booking.setCustomerEmail(email);
	        booking.setCustomerPhone(phone);

	        boolean saved = new ServiceDAOImpl().saveBooking(booking);

	        if (saved) {
	            response.sendRedirect("service-success.jsp");
	        } else {
	            response.sendRedirect("service-fail.jsp");
	        }
	    }
	}


