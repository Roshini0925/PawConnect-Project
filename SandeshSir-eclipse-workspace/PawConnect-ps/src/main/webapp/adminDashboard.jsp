<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page session="true" %>

<%
String admin = (String) session.getAttribute("admin");
if (admin == null) {
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect Admin Dashboard</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #8B5FBF;    
            --secondary: #6A4C93;  
            --accent: #FF9E7A;     
            --light: #FFFFFF;      
            --dark: #4A4458;       
            --text: #5D576B;       
            --gradient-primary: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            --gradient-light: linear-gradient(135deg, #FFFFFF 0%, #F8F7FF 100%);
        }

        /* ===== Body ===== */
        body {
            margin: 15px;
            font-family: 'Poppins', sans-serif;
            background: var(--gradient-light);
            color: var(--text);
        }

        /* ===== Navbar ===== */
        .navbar {
            height: 70px;
            width: 95%;
            background: var(--light);
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 40px;
            box-shadow: 0px 4px 20px rgba(0,0,0,0.06);
            position: fixed;
            top: 0;
            z-index: 10;
        }

        .brand {
            font-size: 28px;
            font-weight: 700;
            color: var(--primary);
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .nav-right {
            font-size: 18px;
            display: flex;
            align-items: center;
            gap: 15px;
            color: var(--text);
        }

        .logout-btn-top {
            background: var(--primary);
            color: var(--light);
            padding: 8px 16px;
            align-items: between;
            border-radius: 40px;
            text-decoration: none;
            transition: 0.3s;
        }

        .logout-btn-top:hover {
            background: var(--dark);
        }

        /* ===== Sidebar ===== */
        .sidebar {
            width: 220px;
            height: calc(100vh - 70px);
            background: var(--gradient-primary);
            color: var(--light);
            position: fixed;
            left: 0;
            top: 70px;
            padding: 30px 20px;
            display: flex;
            flex-direction: column;
            gap: 15px;
            border-radius: 0 20px 20px 0;
        }

        .sidebar a {
            display: flex;
            align-items: center;
            gap: 12px;
            padding: 12px 15px;
            font-size: 16px;
            border-radius: 10px;
            text-decoration: none;
            color: var(--light);
            transition: 0.3s;
        }

        .sidebar a:hover {
            background: var(--dark);
            transform: translateX(5px);
        }

        /* ===== Main Content ===== */
        .main {
            margin-left: 220px; /* match sidebar width */
            padding: 100px 40px 40px;
            min-height: calc(100vh - 100px);
        }

        h1 {
            font-size: 32px;
            color: var(--primary);
            margin-bottom: 30px;
        }

        /* ===== Card Section ===== */
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
        }

        .card {
            background: var(--light);
            padding: 25px 20px;
            border-radius: 20px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
            border-top: 5px solid var(--primary);
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }

        .card i {
            font-size: 36px;
            color: var(--primary);
            margin-bottom: 12px;
        }

        .card h3 {
            margin: 12px 0 8px;
            font-size: 20px;
            color: var(--dark);
        }

        .card p {
            color: var(--text);
            font-size: 14px;
            flex-grow: 1;
        }

        .card button {
            background: var(--primary);
            color: var(--light);
            border: none;
            padding: 10px 18px;
            border-radius: 8px;
            cursor: pointer;
            transition: background 0.3s, transform 0.3s;
        }

        .card button:hover {
            background: var(--dark);
            transform: translateY(-2px);
        }

        /* ===== Responsive Adjustments ===== */
        @media screen and (max-width: 900px) {
            .sidebar {
                width: 180px;
                padding: 20px 15px;
            }
            .main {
                margin-left: 180px;
                padding: 100px 20px 40px;
            }
            .card-container {
                gap: 20px;
            }
        }

        @media screen and (max-width: 600px) {
            .sidebar {
                position: relative;
                width: 100%;
                height: auto;
                flex-direction: row;
                overflow-x: auto;
                border-radius: 0;
                top: 0;
            }
            .sidebar a {
                flex: none;
            }
            .main {
                margin-left: 0;
                padding: 140px 20px 20px;
            }
        }
    </style>
</head>

<body>

<!-- NAVBAR -->
<div class="navbar">
    <div class="brand">
        <i class="fa-solid fa-paw"></i> PawConnect
    </div>

    <div class="nav-right">
      <b>Admin Panel</b>
        <a href="logout.jsp" class="logout-btn-top">Logout</a>
    </div>
</div>

<!-- SIDEBAR -->
<div class="sidebar">
    <a href="adminDashboard.jsp"><i class="fa-solid fa-gauge"></i> Dashboard</a>
    <a href="addPets.jsp"><i class="fa-solid fa-plus"></i> Add New Pet</a>
    <a href="viewPets"><i class="fa-solid fa-paw"></i> Manage Pets</a>
    <a href="viewUsers"><i class="fa-solid fa-users"></i> Users</a>
    <a href="viewRequests.jsp"><i class="fa-solid fa-folder"></i> Adoption Requests</a>
</div>

<!-- MAIN -->
<div class="main">
    <h1>Welcome, Admin </h1>

    <div class="card-container">
        <div class="card">
            <i class="fa-solid fa-paw"></i>
            <h3>Total Pets</h3>
            <p>Manage all registered pets</p>
            <button onclick="window.location.href='viewPets'">View Pets</button>
        </div>

        <div class="card">
            <i class="fa-solid fa-user"></i>
            <h3>Users</h3>
            <p>View and manage user accounts</p>
            <button onclick="window.location.href='viewUsers'">View Users</button>
        </div>

        <div class="card">
            <i class="fa-solid fa-file"></i>
            <h3>Requests</h3>
            <p>Pending adoption applications</p>
            <button onclick="window.location.href='viewRequests.jsp'">View Requests</button>
        </div>

        <div class="card">
            <i class="fa-solid fa-plus"></i>
            <h3>Add Pet</h3>
            <p>Add a new pet to the system</p>
            <button onclick="window.location.href='addPets.jsp'">Add Pet</button>
        </div>
    </div>
</div>

</body>
</html>