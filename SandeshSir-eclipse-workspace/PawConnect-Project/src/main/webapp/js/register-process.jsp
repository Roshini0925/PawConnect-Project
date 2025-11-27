<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

// Get form parameters
String fullName = request.getParameter("fullName");
String email = request.getParameter("email");
String phone = request.getParameter("phone");
String password = request.getParameter("password");
String confirmPassword = request.getParameter("confirmPassword");

// Validation
if(fullName != null && !fullName.isEmpty() && 
   email != null && !email.isEmpty() && 
   phone != null && !phone.isEmpty() && 
   password != null && !password.isEmpty() && 
   password.equals(confirmPassword)) {
    
    // Here you would save to database
    // For demo, we'll just redirect to login page
    
    // Redirect to login page with success message
    response.sendRedirect("login.jsp?registration=success");
} else {
    // Validation failed
    response.sendRedirect("register.jsp?error=1");
}
%>