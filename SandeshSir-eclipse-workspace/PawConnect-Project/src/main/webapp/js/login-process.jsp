<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Get form parameters
String email = request.getParameter("email");
String password = request.getParameter("password");
String redirectUrl = request.getParameter("redirect");

// Simple validation (in real application, validate against database)
if(email != null && password != null && !email.isEmpty() && !password.isEmpty()) {
    // For demo purposes, accept any non-empty credentials
    // In production, you would validate against your database
    
    // Set user session
    session.setAttribute("user", email);
    
    // Set login timestamp
    session.setAttribute("loginTime", new java.util.Date());
    
    // Redirect to intended page or home
    if(redirectUrl != null && !redirectUrl.isEmpty()) {
        response.sendRedirect(redirectUrl);
    } else {
        response.sendRedirect("index.jsp");
    }
} else {
    // Invalid credentials
    response.sendRedirect("login.jsp?error=1");
}
%>