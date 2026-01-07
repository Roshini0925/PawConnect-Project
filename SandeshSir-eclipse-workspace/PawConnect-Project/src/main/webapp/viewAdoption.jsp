<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.servlet.adoption.util.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View All Adoptions</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f3e5f5;
    margin: 0;
    padding: 30px;
}

h2 {
    text-align: center;
    color: #6a1b9a;
    margin-bottom: 25px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background: #fff;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}

th, td {
    padding: 12px 10px;
    text-align: center;
    border-bottom: 1px solid #ddd;
    font-size: 14px;
}

th {
    background: #7e57c2;
    color: #fff;
}

tr:hover {
    background: #f3e5f5;
}

.back-btn {
    margin-top: 20px;
    display: inline-block;
    background: #6a1b9a;
    color: #fff;
    padding: 10px 18px;
    border-radius: 6px;
    text-decoration: none;
}

.back-btn:hover {
    background: #4a148c;
}
</style>
</head>

<body>

<h2>🐾 All Adoption Requests</h2>

<table>
    <tr>
        <th>Adoption ID</th>
        <th>Pet Name</th>
        <th>Adopter Name</th>
        <th>Email</th>
        <th>Phone</th>
        <th>Address</th>
        <th>Message</th>
        <th>Adoption Date</th>
    </tr>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnector();
        String sql = "SELECT * FROM adoptions ORDER BY adoption_date DESC";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();

        while (rs.next()) {
%>
    <tr>
        <td><%= rs.getInt("adoption_id") %></td>
        <td><%= rs.getString("pet_name") %></td>
        <td><%= rs.getString("full_name") %></td>
        <td><%= rs.getString("email") %></td>
        <td><%= rs.getString("phone") %></td>
        <td><%= rs.getString("address") %></td>
        <td><%= rs.getString("message") %></td>
        <td><%= rs.getTimestamp("adoption_date") %></td>
    </tr>
<%
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>

</table>

<a href="adminDashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>

</body>
</html>