<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("user") != null || session.getAttribute("admin") != null) {
%>
<a href="logout" class="btn">Logout</a>
<%
    }
%>
<%
    String username = null;
    if (session.getAttribute("user") != null) {
        username = (String) session.getAttribute("user");
    } else if (session.getAttribute("admin") != null) {
        username = (String) session.getAttribute("admin");
    }
    %>

<!-- Header -->
<header>
    <div class="container">
        <nav class="navbar">

            <!-- Logo Section -->
            <div class="logo">
                <i class="fas fa-paw"></i>
                <span>PawConnect</span>
            </div>

            <!-- Navigation Links -->
            <ul class="nav-links">
                <li><a href="index.jsp">HOME</a></li>
                <li><a href="pets.jsp">ADOPT</a></li>
                <li><a href="about.jsp">ABOUT US</a></li>
                <li><a href="contact.jsp">CONTACT</a></li>
            </ul>

            <!-- Buttons -->
            <div class="auth-buttons">
                <% if (username == null) { %>
                    <button class="btn btn-login" onclick="window.location.href='login.jsp'">Login</button>
                    <button class="btn btn-register" onclick="window.location.href='register.jsp'">Register</button>
                <% } else { %>
                <div>
                    <ul class="nav-links">
                    <li><a href="My-adoptions.jsp">MY Adopted Pet</a></li>
                    </ul>
                    </div>
                    <span style="margin-right: 15px; font-weight: bold; color: #333;">
                        Hi, <%= username %>
                         
                    </span>
                   
                    <button class="btn btn-register" onclick="window.location.href='Logout'">
                        Logout
                    </button>
                <% } %>
            </div>

        </nav>
    </div>
</header>