<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
// Invalidate the session
session.removeAttribute("user");
session.removeAttribute("userFullName");
session.removeAttribute("loginTime");
session.removeAttribute("registrationTime");
session.invalidate();

// Redirect to home page
response.sendRedirect("index.jsp");
%>