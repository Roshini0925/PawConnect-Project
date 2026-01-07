<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.adoption.util.DBConnection" %>

<%
    String email = (String) session.getAttribute("email");
%>

<!DOCTYPE html>
<html>
<head>
    <title>My Adoptions</title>
    <style>
        body {
            font-family: Arial;
            background: linear-gradient(to right, #a8c0ff, #3f2b96);
            color: white;
            padding: 30px;
        }
        .card {
            background: rgba(255,255,255,0.2);
            padding: 20px;
            margin-bottom: 15px;
            border-radius: 10px;
        }
    </style>
</head>

<body>

<h2>🐾 My Adoptions</h2>

<%
    if (email != null) {
        Connection con = DBConnection.getConnector();
        String sql = "SELECT * FROM adoptions WHERE email = ?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        boolean found = false;

        while (rs.next()) {
            found = true;
%>
            <div class="card">
                <p><strong>Pet Name:</strong> <%= rs.getString("pet_name") %></p>
                <p><strong>Adoption Date:</strong> <%= rs.getTimestamp("adoption_date") %></p>
                <p><strong>Phone:</strong> <%= rs.getString("phone") %></p>
                <p><strong>Address:</strong> <%= rs.getString("address") %></p>
                <p><strong>Message:</strong> <%= rs.getString("message") %></p>
            </div>
<%
        }

        if (!found) {
%>
            <p>No adoptions found.</p>
<%
        }
    } else {
%>
        <p>Please login to view your adoptions.</p>
<%
    }
%>

<button onclick="window.location.href='index.jsp'">Go Home</button>

</body>
</html>