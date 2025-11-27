
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - PawConnect</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }
        .header {
            background: #2c3e50;
            padding: 15px 25px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h2 { margin: 0; }

        .header a {
            color: white;
            text-decoration: none;
            background: #e74c3c;
            padding: 8px 15px;
            border-radius: 5px;
        }

        .container {
            width: 90%;
            margin: 20px auto;
        }

        .cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(230px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            text-align: center;
        }

        .card i {
            font-size: 40px;
            color: #3498db;
            margin-bottom: 10px;
        }

        .card h3 {
            margin-bottom: 10px;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            background: #3498db;
            color: white;
            padding: 8px 15px;
            border-radius: 6px;
            text-decoration: none;
        }

        .card a:hover {
            background: #2980b9;
        }
    </style>
</head>

<body>
<%
    if (session.getAttribute("admin") == null) {
        response.sendRedirect("admin-login.jsp");
    }
%>

    <div class="header">
        <h2>PawConnect Admin Dashboard</h2>
        <a href="AdminLogoutServlet">Logout</a>
    </div>

    <div class="container">

        <div class="cards">

            <div class="card">
                <i class="fa-solid fa-paw"></i>
                <h3>Add New Pet</h3>
                <p>Add pet details + image.</p>
                <a href="addPet.jsp">Add Pet</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-dog"></i>
                <h3>View All Pets</h3>
                <p>Manage all pets in database.</p>
                <a href="ViewPetsServlet">View Pets</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-users"></i>
                <h3>View Users</h3>
                <p>Registered users list.</p>
                <a href="ViewUsersServlet">View Users</a>
            </div>

            <div class="card">
                <i class="fa-solid fa-file-signature"></i>
                <h3>Adoption Requests</h3>
                <p>Approve or reject requests.</p>
                <a href="ViewRequestsServlet">View Requests</a>
            </div>

        </div>

    </div>

</body>
</html>
