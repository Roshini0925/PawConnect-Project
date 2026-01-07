<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section class="about-section">
        <div class="container">
            <div class="about-content">
                <div class="about-image">
                    <img src="images/about-us.jpg" alt="About PawConnect" 
                         onerror="this.src='https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80'">
                </div>
                <div class="about-text">
                    <h2>About PawConnect</h2>
                    <p>PawConnect was founded with a simple mission: to connect loving homes with pets in need and make pet care accessible to everyone. We believe that every pet deserves a loving home and every home deserves the joy that a pet brings.</p>
                    <p>Our platform brings together pet adoption centers, veterinarians, and pet supply stores to create a comprehensive ecosystem for pet lovers. Whether you're looking to adopt, need supplies, or require veterinary services, PawConnect is your one-stop solution.</p>
                    <p>Join our community of pet lovers today and experience the difference that PawConnect can make in your pet parenting journey.</p>
                    <div class="hero-buttons">
                        <button class="btn btn-primary" onclick="window.location.href='register.jsp'">Join Now</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>