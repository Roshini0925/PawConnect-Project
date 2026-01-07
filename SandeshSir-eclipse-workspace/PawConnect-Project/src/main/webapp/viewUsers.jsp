<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.adoption.dto.User" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Registered Users</title>

<style>
    body {
        font-family: "Segoe UI", sans-serif;
        background-color: #f7eaf8;
        margin: 0;
        padding: 0;
    }

    h2 {
        text-align: center;
        color: #6a1b9a;
        margin: 25px 0;
        font-size: 26px;
    }

    .container {
        width: 95%;
        margin: auto;
        background: white;
        border-radius: 10px;
        overflow: hidden;
        box-shadow: 0 6px 18px rgba(0,0,0,0.1);
    }

    table {
        width: 100%;
        border-collapse: collapse;
    }

    thead {
        background-color: #7b5dc9;
        color: white;
    }

    th, td {
        padding: 14px 12px;
        text-align: center;
        border-bottom: 1px solid #ddd;
    }

    th {
        font-size: 15px;
        letter-spacing: 0.5px;
    }

    tbody tr:hover {
        background-color: #f3e8ff;
    }

    .load-btn {
        display: block;
        margin: 0 auto 20px;
        background-color: #7b2cbf;
        color: white;
        border: none;
        padding: 10px 22px;
        font-size: 15px;
        border-radius: 6px;
        cursor: pointer;
    }

    .load-btn:hover {
        background-color: #5a189a;
    }

    .no-data {
        text-align: center;
        margin: 20px;
        color: #555;
        font-size: 16px;
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

<h2>👤 All Registered Users</h2>

<form action="viewUsers" method="get">
    <button class="load-btn" type="submit">Load Users</button>
</form>

<%
    List<User> list = (List<User>) request.getAttribute("usersList");
    if (list != null && !list.isEmpty()) {
%>

<div class="container">
<table>
    <thead>
        <tr>
            <th>Name</th>
            <th>Email</th>
            <th>Phone</th>
        </tr>
    </thead>
    <tbody>
    <%
        for (User u : list) {
    %>
        <tr>
            <td><%= u.getFullName() %></td>
            <td><%= u.getEmail() %></td>
            <td><%= u.getPhone() %></td>
        </tr>
    <%
        }
    %>
    </tbody>
</table>
</div>

<%
    } else {
%>
    <p class="no-data">No users found.</p>
<%
    }
%>
<a href="adminDashboard.jsp" class="back-btn">⬅ Back to Dashboard</a>
</body>
</html>