<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adoption Successful - PawConnect</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #a8c0ff, #3f2b96);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            color: #fff;
        }

        .success-container {
            background: rgba(255, 255, 255, 0.15);
            padding: 30px;
            border-radius: 15px;
            width: 450px;
            backdrop-filter: blur(10px);
            text-align: center;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        h2 {
            margin-bottom: 10px;
        }

        .details-box {
            text-align: left;
            margin-top: 20px;
            background: rgba(255, 255, 255, 0.20);
            padding: 15px;
            border-radius: 10px;
        }

        .details-box p {
            margin: 8px 0;
        }

        .btn-home {
            margin-top: 20px;
            padding: 10px 18px;
            background: #fff;
            color: #3f2b96;
            font-weight: bold;
            border: none;
            border-radius: 6px;
            cursor: pointer;
        }

        .btn-home:hover {
            background: #e4e4e4;
        }
    </style>
</head>

<body>

<div class="success-container">
    <h2>🐾 Adoption Request Submitted!</h2>
    <p>Thank you for your interest in adopting a pet.</p>

    <div class="details-box">
        <p><strong>Pet Name:</strong> <%= session.getAttribute("petName") %></p>
        <p><strong>Full Name:</strong> <%= session.getAttribute("fullName") %></p>
        <p><strong>Email:</strong> <%= session.getAttribute("email") %></p>
        <p><strong>Phone:</strong> <%= session.getAttribute("phone") %></p>
        <p><strong>Address:</strong> <%= session.getAttribute("address") %></p>
        <p><strong>Message:</strong> <%= session.getAttribute("message") %></p>
        <li><a href="certificate.jsp">MY CERTIFICATES</a></li>
    </div>

    <button class="btn-home" onclick="window.location.href='index.jsp'">Go Back Home</button>
</div>

</body>
</html>