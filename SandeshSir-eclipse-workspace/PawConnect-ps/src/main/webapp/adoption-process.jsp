<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Check if user is logged in
if(session.getAttribute("user") == null) {
    response.sendRedirect("login.jsp?redirect=pet.jsp");
    return;
}

// Get adoption form data
String petId = request.getParameter("petId");
String petName = request.getParameter("petName");
String fullName = request.getParameter("fullName");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String message = request.getParameter("message");

// Process adoption application (in real app, save to database)
// For demo, we'll just show a success message

// Redirect back to pets page with success message
response.sendRedirect("pets.jsp?adoption=success&pet=" + petName);
%>