<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page session="true" %>
<%
    String userEmail = (String) session.getAttribute("Email");

    if (userEmail == null) {
        response.sendRedirect("pets.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Home</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">

    <style>
        /* ===== Hero Section ===== */
        .hero {
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)),
                        url("images/pet-bg.jpg") center/cover no-repeat;
            color: white;
            text-align: center;
            padding: 120px 20px;
        }
        .hero h1 {
            font-size: 50px;
            margin-bottom: 10px;
        }
        .hero p {
            font-size: 18px;
            margin-bottom: 20px;
        }
        .hero .btn-primary {
            background-color: #ff8a00;
            padding: 12px 25px;
            border-radius: 5px;
            font-size: 18px;
            font-weight: bold;
            text-decoration: none;
            color: white;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background-color: #ff6e00;
        }

        /* ===== Pets Section ===== */
        .pets-section {
            padding: 60px 20px;
            text-align: center;
        }
        .pets-section h2 {
            font-size: 35px;
            margin-bottom: 30px;
            color: #333;
        }
        .pets-container {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }
        .pet-card {
            width: 260px;
            background: #fff;
            padding: 15px;
            border-radius: 15px;
            box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .pet-card img {
            width: 100%;
            border-radius: 10px;
        }
        .pet-card h3 {
            margin: 10px 0;
            color: #444;
        }
        .pet-card button {
            background: #ff8a00;
            color: white;
            padding: 8px 15px;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            transition: 0.3s;
        }
        .pet-card button:hover {
            background: #ff6e00;
        }

        /* ===== Features Section ===== */
        .features {
            background: #f9f9f9;
            padding: 50px 20px;
            text-align: center;
        }
        .features h2 {
            font-size: 32px;
            margin-bottom: 40px;
        }
        .features-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
        }
        .feature-box {
            width: 250px;
            background: white;
            padding: 20px;
            border-radius: 15px;
            box-shadow: 0px 3px 8px rgba(0,0,0,0.1);
        }
        .feature-box i {
            font-size: 40px;
            color: #ff8a00;
            margin-bottom: 15px;
        }

        /* Mobile */
        @media(max-width: 600px) {
            .hero h1 { font-size: 32px; }
        }
    </style>
</head>

<body>

<jsp:include page="header.jsp" />

<!-- ================= HERO ================== -->
<section class="hero">
    <h1>Find Your New Best Friend</h1>
    <p>Connecting loving families with pets that deserve a home ❤️</p>
    <a href="adoption.jsp" class="btn-primary">Adopt Now</a>
</section>

<!-- ================= PETS SECTION ================== -->
<section class="pets-section">
    <h2>Meet Our Lovely Pets</h2>

    <div class="pets-container">

        <div class="pet-card">
            <img src="images/dog1.jpg" alt="Dog">
            <h3>Buddy</h3>
            <button>View Details</button>
        </div>

        <div class="pet-card">
            <img src="images/cat1.jpg" alt="Cat">
            <h3>Luna</h3>
            <button>View Details</button>
        </div>

        <div class="pet-card">
            <img src="images/rabbit1.jpg" alt="Rabbit">
            <h3>Snowy</h3>
            <button>View Details</button>
        </div>
    </div>
</section>

<!-- ================= FEATURES ================== -->
<section class="features">
    <h2>Why Choose PawConnect?</h2>

    <div class="features-container">
        <div class="feature-box">
            <i class="fa-solid fa-heart"></i>
            <h3>Trusted Adoption</h3>
            <p>All pets are vaccinated and verified.</p>
        </div>

        <div class="feature-box">
            <i class="fa-solid fa-paw"></i>
            <h3>Easy Process</h3>
            <p>Simple steps to adopt your dream pet.</p>
        </div>

        <div class="feature-box">
            <i class="fa-solid fa-users"></i>
            <h3>Community Support</h3>
            <p>A loving community guiding new pet parents.</p>
        </div>
    </div>
</section>

<%@ include file="footer.jsp" %>

</body>
</html>
