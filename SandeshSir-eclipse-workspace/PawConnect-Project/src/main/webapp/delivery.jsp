<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Supplies Delivery - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        :root {
            --primary: #8B5FBF;
            --secondary: #6A4C93;
            --accent: #FF9E7A;
            --light: #FFFFFF;
            --dark: #4A4458;
            --text: #5D576B;
            --gradient-primary: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            --gradient-light: linear-gradient(135deg, #FFFFFF 0%, #F8F7FF 100%);
            --gradient-hero: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 50%, #FFFFFF 100%);
        }

        body {
            background-color: var(--light);
            color: var(--text);
            line-height: 1.6;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header Styles */
        header {
            background-color: white;
            box-shadow: 0 2px 10px rgba(139, 95, 191, 0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
        }

        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
            font-size: 28px;
            font-weight: 700;
            color: var(--primary);
        }

        .logo i {
            font-size: 32px;
        }

        .nav-links {
            display: flex;
            list-style: none;
            gap: 30px;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--dark);
            font-weight: 600;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        .auth-buttons {
            display: flex;
            gap: 15px;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 30px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            border: none;
            font-size: 16px;
        }

        .btn-login {
            background-color: transparent;
            color: var(--primary);
            border: 2px solid var(--primary);
        }

        .btn-register {
            background-color: var(--primary);
            color: white;
        }

        .btn-login:hover {
            background-color: rgba(139, 95, 191, 0.1);
        }

        .btn-register:hover {
            background-color: #7A4FA8;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(139, 95, 191, 0.3);
        }

        /* Service Hero Section */
        .service-hero {
            padding: 150px 0 80px;
            background: var(--gradient-primary);
            color: white;
        }

        .hero-content {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 40px;
        }

        .hero-text {
            flex: 1;
        }

        .hero-text h1 {
            font-size: 3rem;
            color: white !important;
            margin-bottom: 20px;
            text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
        }

        .hero-text p {
            font-size: 1.2rem;
            margin-bottom: 30px;
            color: rgba(255, 255, 255, 0.9) !important;
            text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
            max-width: 600px;
        }

        .hero-buttons {
            display: flex;
            gap: 15px;
            margin-top: 30px;
        }

        .btn-primary {
            background-color: white;
            color: var(--primary) !important;
            font-weight: 700;
        }

        .btn-primary:hover {
            background-color: #FFD700;
            color: var(--primary) !important;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 215, 0, 0.3);
        }

        .btn-secondary {
            background-color: transparent;
            color: white !important;
            border: 2px solid white;
        }

        .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
        }

        .hero-image {
            flex: 1;
            text-align: center;
        }

        .hero-image img {
            max-width: 100%;
            height: 400px;
            object-fit: cover;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
        }

        /* Delivery Features Section */
        .delivery-features {
            padding: 80px 0;
            background-color: white;
        }

        .section-title {
            text-align: center;
            margin-bottom: 50px;
        }

        .section-title h2 {
            font-size: 36px;
            color: var(--dark) !important;
            margin-bottom: 15px;
        }

        .section-title p {
            color: var(--text) !important;
            max-width: 600px;
            margin: 0 auto;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 30px;
        }

        .delivery-feature-card {
            background: white;
            padding: 40px 30px;
            border-radius: 15px;
            text-align: center;
            transition: all 0.3s ease;
            border: 1px solid rgba(139, 95, 191, 0.1);
            box-shadow: 0 5px 15px rgba(139, 95, 191, 0.08);
        }

        .delivery-feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(139, 95, 191, 0.15);
        }

        .delivery-feature-card i {
            font-size: 48px;
            color: var(--primary);
            margin-bottom: 20px;
        }

        .delivery-feature-card h3 {
            font-size: 22px;
            color: var(--dark) !important;
            margin-bottom: 15px;
        }

        .delivery-feature-card p {
            color: var(--text) !important;
            line-height: 1.6;
        }

        /* Products Section */
        .products-section {
            padding: 80px 0;
            background: var(--gradient-light);
        }

        .category-filters {
            display: flex;
            gap: 15px;
            margin-bottom: 40px;
            flex-wrap: wrap;
            justify-content: center;
        }

        .filter-btn {
            padding: 12px 24px;
            border: 2px solid var(--primary);
            background: transparent;
            color: var(--primary);
            border-radius: 25px;
            cursor: pointer;
            transition: all 0.3s;
            font-weight: 600;
        }

        .filter-btn.active, .filter-btn:hover {
            background: var(--primary);
            color: white;
        }

        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 30px;
        }

        .product-card {
            background: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.15);
        }

        .product-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            display: block;
            background: linear-gradient(45deg, #f0f0f0, #e0e0e0);
        }

        .product-info {
            padding: 25px;
        }

        .product-info h3 {
            font-size: 18px;
            color: var(--dark) !important;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .product-desc {
            color: var(--text) !important;
            font-size: 14px;
            line-height: 1.5;
            margin-bottom: 15px;
        }

        .price {
            font-size: 20px;
            font-weight: bold;
            color: var(--primary) !important;
            margin-bottom: 20px;
        }

        .product-actions .btn {
            width: 100%;
            padding: 12px;
        }

        /* Tracking Section */
        .tracking-section {
            padding: 80px 0;
            background: white;
        }

        .tracking-section h2,
        .tracking-section p {
            color: var(--dark) !important;
        }

        .tracking-form {
            display: flex;
            gap: 15px;
            max-width: 500px;
            margin: 0 auto 40px;
            flex-wrap: wrap;
        }

        .tracking-form input {
            flex: 1;
            min-width: 250px;
            padding: 15px;
            border: 2px solid #e2e8f0;
            border-radius: 8px;
            font-size: 16px;
        }

        .tracking-result {
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            max-width: 800px;
            margin: 0 auto;
        }

        .tracking-status h3 {
            color: var(--dark) !important;
            margin-bottom: 30px;
            text-align: center;
        }

        .tracking-timeline {
            display: flex;
            justify-content: space-between;
            margin-top: 30px;
            position: relative;
        }

        .tracking-timeline::before {
            content: '';
            position: absolute;
            top: 20px;
            left: 0;
            right: 0;
            height: 2px;
            background: #e2e8f0;
            z-index: 1;
        }

        .timeline-step {
            text-align: center;
            position: relative;
            z-index: 2;
            flex: 1;
        }

        .timeline-step i {
            font-size: 24px;
            background: white;
            padding: 10px;
            border-radius: 50%;
            margin-bottom: 10px;
            display: inline-block;
            border: 2px solid;
        }

        .timeline-step.completed i {
            color: #4CAF50;
            border-color: #4CAF50;
        }

        .timeline-step.active i {
            color: var(--primary);
            border-color: var(--primary);
        }

        .timeline-step:not(.completed):not(.active) i {
            color: #CBD5E0;
            border-color: #CBD5E0;
        }

        .timeline-step span {
            display: block;
            font-weight: 600;
            color: var(--dark) !important;
            margin-bottom: 5px;
        }

        .timeline-step small {
            color: var(--text) !important;
            font-size: 12px;
        }

        /* Footer */
        footer {
            background-color: var(--dark);
            color: white;
            padding: 60px 0 30px;
            margin-top: 60px;
        }

        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-bottom: 40px;
        }

        .footer-column h3 {
            font-size: 20px;
            margin-bottom: 20px;
            color: white;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 10px;
        }

        .footer-links a {
            color: #CBD5E0;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: var(--primary);
        }

        .social-icons {
            display: flex;
            gap: 15px;
            margin-top: 20px;
        }

        .social-icons a {
            display: flex;
            align-items: center;
            justify-content: center;
            width: 40px;
            height: 40px;
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            color: white;
            transition: background-color 0.3s;
        }

        .social-icons a:hover {
            background-color: var(--primary);
        }

        .copyright {
            text-align: center;
            padding-top: 30px;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #CBD5E0;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                gap: 20px;
            }

            .nav-links {
                gap: 15px;
                flex-wrap: wrap;
                justify-content: center;
            }

            .hero-content {
                flex-direction: column;
                text-align: center;
            }

            .hero-text h1 {
                font-size: 2.5rem;
            }

            .hero-buttons {
                justify-content: center;
                flex-wrap: wrap;
            }

            .tracking-timeline {
                flex-direction: column;
                gap: 30px;
            }

            .tracking-timeline::before {
                display: none;
            }

            .features-grid {
                grid-template-columns: 1fr;
            }

            .products-grid {
                grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            }
        }

        @media (max-width: 480px) {
            .hero-text h1 {
                font-size: 2rem;
            }

            .hero-buttons {
                flex-direction: column;
            }

            .tracking-form {
                flex-direction: column;
            }

            .products-grid {
                grid-template-columns: 1fr;
            }

            .category-filters {
                flex-direction: column;
                align-items: center;
            }

            .filter-btn {
                width: 200px;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <nav class="navbar">
                <div class="logo">
                    <i class="fas fa-paw"></i>
                    <span>PawConnect</span>
                </div>
                <ul class="nav-links">
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="pets.jsp">Find Pets</a></li>
                    <li><a href="services.jsp">Services</a></li>
                    <li><a href="delivery.jsp" style="color: var(--primary);">Delivery</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="contact.jsp">Contact</a></li>
                </ul>
                <div class="auth-buttons">
                    <button class="btn btn-login">Login</button>
                    <button class="btn btn-register">Register</button>
                </div>
            </nav>
        </div>
    </header>

    <!-- Service Hero Section -->
    <section class="service-hero">
        <div class="container">
            <div class="hero-content">
                <div class="hero-text">
                    <h1>Pet Supplies Delivery</h1>
                    <p>Get all your pet essentials delivered to your doorstep. Fast, reliable, and convenient.</p>
                    <div class="hero-buttons">
                        <button class="btn btn-primary" onclick="scrollToProducts()">Shop Now</button>
                        <button class="btn btn-secondary" onclick="scrollToTracking()">Track Order</button>
                    </div>
                </div>
                <div class="hero-image">
                    <img src="https://images.unsplash.com/photo-1525253086316-d0c936c814f8" alt="Pet Supplies Delivery" alt="Pet Supplies Delivery">
                </div>
            </div>
        </div>
    </section>

    <!-- Delivery Features -->
    <section class="delivery-features">
        <div class="container">
            <div class="section-title">
                <h2>Why Choose Our Delivery Service?</h2>
                <p>Fast, reliable, and convenient pet supplies delivery</p>
            </div>
            <div class="features-grid">
                <div class="delivery-feature-card">
                    <i class="fas fa-shipping-fast"></i>
                    <h3>Same Day Delivery</h3>
                    <p>Orders before 2 PM delivered same day in select areas</p>
                </div>
                <div class="delivery-feature-card">
                    <i class="fas fa-truck"></i>
                    <h3>Free Delivery</h3>
                    <p>Free delivery on orders above ₹999</p>
                </div>
                <div class="delivery-feature-card">
                    <i class="fas fa-map-marker-alt"></i>
                    <h3>Real-time Tracking</h3>
                    <p>Track your delivery in real-time with live updates</p>
                </div>
                <div class="delivery-feature-card">
                    <i class="fas fa-undo"></i>
                    <h3>Easy Returns</h3>
                    <p>7-day easy return policy for all products</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Products Section -->
    <section class="products-section" id="products">
        <div class="container">
            <div class="section-title">
                <h2>Shop Pet Supplies</h2>
                <p>Everything your pet needs, delivered fast to your doorstep</p>
            </div>
            
            <div class="category-filters">
                <button class="filter-btn active" data-category="all">All Products</button>
                <button class="filter-btn" data-category="food">Food</button>
                <button class="filter-btn" data-category="toys">Toys</button>
                <button class="filter-btn" data-category="health">Health Care</button>
                <button class="filter-btn" data-category="accessories">Accessories</button>
            </div>
            
            <div class="products-grid">
                <!-- FOOD PRODUCTS (15 items) -->
                <div class="product-card" data-category="food">
        <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="101"></form>
                    <img src="https://tse3.mm.bing.net/th/id/OIP.tyXDh-6GfWpnevGnd3rmTwHaKU?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Premium Dog Food">
                    <div class="product-info">
                        <h3>Premium Dog Food</h3>
                        <p class="product-desc">Nutritionally balanced adult dog food with real chicken</p>
                        <div class="price">₹1,299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Premium Dog Food', 1299)">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="102"></form>
                    <img src="https://i5.walmartimages.com/asr/6ed276d9-367f-4c82-bc41-eaa026403735_3.668f8e07361b35a854e0beaad956ee9d.png" alt="Cat Food">
                    <div class="product-info">
                        <h3>Grain-Free Cat Food</h3>
                        <p class="product-desc">High-protein formula for indoor cats with salmon</p>
                        <div class="price">₹999</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Grain-Free Cat Food', 999)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="103"></form>
                    <img src="https://i5.walmartimages.com/asr/5206b93d-6d04-4b13-98a9-4058f7419d03.9ac8536e6a30e45b00fa0ed01ba9e76b.jpeg" alt="Puppy Food">
                    <div class="product-info">
                        <h3>Puppy Dry Food</h3>
                        <p class="product-desc">Specially formulated for growing puppies</p>
                        <div class="price">₹1,599</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Puppy Dry Food', 1599)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="104"></form>
                    <img src="https://th.bing.com/th/id/OPAC.VXgM2eZb79ZP4w474C474?w=592&h=550&o=5&dpr=1.3&pid=21.1&ucfimg=1" alt="Senior Dog Food">
                    <div class="product-info">
                        <h3>Senior Dog Food</h3>
                        <p class="product-desc">Joint support for older dogs with glucosamine</p>
                        <div class="price">₹1,399</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Senior Dog Food', 1399)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="105"></form>
                    <img src="https://m.media-amazon.com/images/I/81Q9NIks1BL.AC.jpg" alt="Bird Food">
                    <div class="product-info">
                        <h3>Bird Seed Mix</h3>
                        <p class="product-desc">Nutritious blend for pet birds and parrots</p>
                        <div class="price">₹499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Bird Seed Mix', 499)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="106"></form>
                    <img src="https://m.media-amazon.com/images/I/81BMZZXwm0L.AC.jpg" alt="Fish Food">
                    <div class="product-info">
                        <h3>Fish Food Flakes</h3>
                        <p class="product-desc">Complete nutrition for tropical fish</p>
                        <div class="price">₹299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Fish Food Flakes', 299)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="107"></form>
                    <img src="https://tse4.mm.bing.net/th/id/OIP.sy7YjimK2W3inJRnVvznzQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Dental Dog Food">
                    <div class="product-info">
                        <h3>Dental Care Dog Food</h3>
                        <p class="product-desc">Reduces tartar and maintains oral health</p>
                        <div class="price">₹1,699</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Dental Care Dog Food', 1699)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="108"></form>
                    <img src="https://i5.walmartimages.com/asr/297459ae-645c-45d4-acd5-6b608fa74756_1.e7ea5b0c607eb4d3c300595005b362f3.jpeg" alt="Weight Management Food">
                    <div class="product-info">
                        <h3>Weight Management Cat Food</h3>
                        <p class="product-desc">Helps maintain healthy weight for cats</p>
                        <div class="price">₹1,199</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Weight Management Cat Food', 1199)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="109"></form>
                    <img src="https://www.rover.com/blog/wp-content/uploads/2021/04/best-organic-dog-treats-2.jpg" alt="Dog Treats">
                    <div class="product-info">
                        <h3>Organic Dog Treats</h3>
                        <p class="product-desc">Natural training treats for dogs</p>
                        <div class="price">₹649</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Organic Dog Treats', 649)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="110"></form>
                    <img src="https://m.media-amazon.com/images/I/81XeRHi9oWL.SL1500.jpg" alt="Wet Cat Food">
                    <div class="product-info">
                        <h3>Kitten Wet Food</h3>
                        <p class="product-desc">High-moisture food for growing kittens</p>
                        <div class="price">₹849</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Kitten Wet Food', 849)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="111"></form>
                    <img src="https://i5.walmartimages.com/seo/MENU-Premium-Rabbit-Food-Timothy-Hay-Pellets-Blend-Vitamin-Mineral-Fortified-4-lb-Bag_4c84c114-6606-4238-b619-be8088242ddd.fdfd6c9cb93342d5f37ae8886bb27b51.jpeg" alt="Rabbit Food">
                    <div class="product-info">
                        <h3>Rabbit Pellets</h3>
                        <p class="product-desc">Complete nutrition for pet rabbits</p>
                        <div class="price">₹399</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Rabbit Pellets', 399)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="112"></form>
                    <img src="https://tse4.mm.bing.net/th/id/OIP.vX62ZlSCHz5ePk7t_gCZ3AHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Hypoallergenic Food">
                    <div class="product-info">
                        <h3>Hypoallergenic Dog Food</h3>
                        <p class="product-desc">For dogs with sensitive stomachs</p>
                        <div class="price">₹1,899</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Hypoallergenic Dog Food', 1899)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="113"></form>
                    <img src="https://down-ph.img.susercontent.com/file/ph-11134207-7r992-ln6vjodncl3be8" alt="Hamster Food">
                    <div class="product-info">
                        <h3>Hamster Food Mix</h3>
                        <p class="product-desc">Balanced diet for small rodents</p>
                        <div class="price">₹349</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Hamster Food Mix', 349)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="114"></form>
                    <img src="https://i5.walmartimages.com/seo/Nutrish-Senior-Healthy-Aging-Chicken-Chickpea-and-Salmon-Dry-Cat-Food-Rachael-Ray-13-lb-Bag_ce03a8b5-1f90-4876-971f-84bedeccd284.c93105517ce679ca5dc3429dfe4ca601.jpeg" alt="Senior Cat Food">
                    <div class="product-info">
                        <h3>Senior Cat Food</h3>
                        <p class="product-desc">Kidney support for older cats</p>
                        <div class="price">₹1,299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Senior Cat Food', 1299)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="food">
                <form action="delivery" method="post">
		<input type="hidden" name="product_id" value="115"></form>
                    <img src="https://i5.walmartimages.com/seo/Pure-Balance-Pro-Large-Breed-Chicken-Brown-Rice-Recipe-Dry-Dog-Food-16-lbs_38f7a1f2-fc61-4362-a35b-69fdf350645d.a7d18fc3cc8ed8744d12d6091146381e.jpeg" alt="Large Breed Food">
                    <div class="product-info">
                        <h3>Large Breed Dog Food</h3>
                        <p class="product-desc">For giant breed dogs 50kg+</p>
                        <div class="price">₹2,199</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Large Breed Dog Food', 2199)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <!-- TOYS PRODUCTS (15 items) -->
                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/711vaJV1mFL.jpg" alt="Interactive Cat Toy">
                    <div class="product-info">
                        <h3>Interactive Cat Toy</h3>
                        <p class="product-desc">Electronic feather toy for cats</p>
                        <div class="price">₹599</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Interactive Cat Toy', 599)">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/71aSf2AiBNL.AC_SS450.jpg" alt="Chew Bone">
                    <div class="product-info">
                        <h3>Chew Bone Toy</h3>
                        <p class="product-desc">Durable rubber bone for dogs</p>
                        <div class="price">₹399</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Chew Bone Toy', 399)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/61+B4Bo6CjL.AC_SL1500.jpg" alt="Ball Launcher">
                    <div class="product-info">
                        <h3>Ball Launcher</h3>
                        <p class="product-desc">Automatic ball thrower for dogs</p>
                        <div class="price">₹2,499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Ball Launcher', 2499)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/71hZo6NK-sL.AC.jpg" alt="Cat Tree">
                    <div class="product-info">
                        <h3>Cat Tree</h3>
                        <p class="product-desc">Multi-level scratching and playing post</p>
                        <div class="price">₹3,999</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Cat Tree', 3999)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://cdn.shopify.com/s/files/1/2380/9337/products/product-image-555753250_grande.jpg?v=1535041886" alt="Squeaky Toys">
                    <div class="product-info">
                        <h3>Squeaky Toys Set</h3>
                        <p class="product-desc">6-piece squeaky toy collection</p>
                        <div class="price">₹799</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Squeaky Toys Set', 799)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://cdn11.bigcommerce.com/s-g7j5rv61k1/images/stencil/1280x1280/products/479/655/SS1178-2__81967.1575924291.jpg?c=1" alt="Laser Pointer">
                    <div class="product-info">
                        <h3>Laser Pointer</h3>
                        <p class="product-desc">Red dot laser for cat exercise</p>
                        <div class="price">₹299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Laser Pointer', 299)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.y3HZmIvweaq_NZVOXe1vHQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Floating Fish">
                    <div class="product-info">
                        <h3>Floating Fish Toy</h3>
                        <p class="product-desc">Interactive fish for cats to bat around</p>
                        <div class="price">₹449</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Floating Fish Toy', 449)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://petsolutionsintlnaturesbestwebsite.s3.ap-southeast-2.amazonaws.com/wp-content/uploads/2022/12/31115902/40274-1-WagTime-Rope-Toy-Rubber-Ball-Tug-Rope-Front_WEBB.jpg" alt="Tug Rope">
                    <div class="product-info">
                        <h3>Tug Rope Toy</h3>
                        <p class="product-desc">Cotton rope for interactive play</p>
                        <div class="price">₹349</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Tug Rope Toy', 349)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/61Qwe89IVyL.AC_SL1500.jpg" alt="Bird Mirror">
                    <div class="product-info">
                        <h3>Bird Mirror Toy</h3>
                        <p class="product-desc">Safe mirror for pet birds</p>
                        <div class="price">₹249</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Bird Mirror Toy', 249)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/41fckIM8zOL.jpg" alt="Puzzle Feeder">
                    <div class="product-info">
                        <h3>Puzzle Feeder</h3>
                        <p class="product-desc">Mental stimulation toy for dogs</p>
                        <div class="price">₹899</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Puzzle Feeder', 899)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://i5.walmartimages.com/seo/Cat-Toy-Food-Junkeez-Catnip-Filled-Unique-Textures-Feathers-Select-Character-Set-of-All-8-Toys_f6da1c1d-2fb8-4dde-ad4d-97b31f388e9c.98615a3a2990ddd9221c4123c975e037.jpeg" alt="Catnip Toys">
                    <div class="product-info">
                        <h3>Catnip Toys Set</h3>
                        <p class="product-desc">3 organic catnip-filled toys</p>
                        <div class="price">₹549</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Catnip Toys Set', 549)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://www.invento-hq.com/myfactory/CustomUpload/374O357O340O370O356O369O350O328O365O373O356O365O371O366O350O326O364O353O327O/380166_g1.jpg" alt="Flying Disc">
                    <div class="product-info">
                        <h3>Flying Disc</h3>
                        <p class="product-desc">Durable frisbee for outdoor play</p>
                        <div class="price">₹299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Flying Disc', 299)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.pvYd2CicH9RFU3XEp4_f4gHaHd?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Hamster Wheel">
                    <div class="product-info">
                        <h3>Hamster Wheel</h3>
                        <p class="product-desc">Silent spinner exercise wheel</p>
                        <div class="price">₹699</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Hamster Wheel', 699)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/51vBhB6V21L.AC.jpg" alt="Bird Swing">
                    <div class="product-info">
                        <h3>Bird Swing</h3>
                        <p class="product-desc">Natural wood perch swing</p>
                        <div class="price">₹199</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Bird Swing', 199)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="toys">
                    <img src="https://m.media-amazon.com/images/I/617-GJ5T7qL.AC_SL1500.jpg" alt="Treat Dispenser">
                    <div class="product-info">
                        <h3>Treat Dispenser Ball</h3>
                        <p class="product-desc">Rolling treat dispenser for dogs</p>
                        <div class="price">₹649</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Treat Dispenser Ball', 649)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <!-- HEALTH CARE PRODUCTS (15 items) -->
                <div class="product-card" data-category="health">
                    <img src="https://m.media-amazon.com/images/I/81iSpYCETgL.jpg" alt="Flea Treatment">
                    <div class="product-info">
                        <h3>Flea & Tick Treatment</h3>
                        <p class="product-desc">Monthly topical solution for dogs</p>
                        <div class="price">₹899</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Flea & Tick Treatment', 899)">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                <div class="product-card" data-category="health">
                    <img src="https://tse3.mm.bing.net/th/id/OIP.fCBoR7KDuMkIKUmQq62LDQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Pet Shampoo">
                    <div class="product-info">
                        <h3>Pet Shampoo</h3>
                        <p class="product-desc">Gentle cleansing for sensitive skin</p>
                        <div class="price">₹349</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Pet Shampoo', 349)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://tse3.mm.bing.net/th/id/OIP.8wW6FVD6vCCWi4sZAnie7AHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Dental Chews">
                    <div class="product-info">
                        <h3>Dental Chews</h3>
                        <p class="product-desc">Oral hygiene treats for dogs</p>
                        <div class="price">₹599</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Dental Chews', 599)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.PTPOqBf0m-jhs8__do0cqQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Joint Supplements">
                    <div class="product-info">
                        <h3>Joint Supplements</h3>
                        <p class="product-desc">Glucosamine for joint health</p>
                        <div class="price">₹1,199</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Joint Supplements', 1199)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://m.media-amazon.com/images/I/81SwwIY1HrL.AC.jpg" alt="Ear Cleaner">
                    <div class="product-info">
                        <h3>Ear Cleaner</h3>
                        <p class="product-desc">Gentle ear cleaning solution</p>
                        <div class="price">₹299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Ear Cleaner', 299)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.Spsvb1smcBwrY1Qu3Y-7OQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Worming Tablets">
                    <div class="product-info">
                        <h3>Worming Tablets</h3>
                        <p class="product-desc">Deworming treatment for dogs</p>
                        <div class="price">₹449</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Worming Tablets', 449)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://i5.walmartimages.com/asr/3fa71e59-b57b-4209-85ac-a889f3bb0e8d.826facade18af4ec100cb917aea567a5.jpeg" alt="Skin Supplement">
                    <div class="product-info">
                        <h3>Skin & Coat Supplement</h3>
                        <p class="product-desc">Omega-3 for healthy skin and fur</p>
                        <div class="price">₹799</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Skin & Coat Supplement', 799)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://tse3.mm.bing.net/th/id/OIP.p-_IqeLB-caCDOa5LG4jgwHaHL?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="First Aid Kit">
                    <div class="product-info">
                        <h3>Pet First Aid Kit</h3>
                        <p class="product-desc">Emergency medical supplies for pets</p>
                        <div class="price">₹1,499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Pet First Aid Kit', 1499)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://veterinariadrajorquera.cl/wp-content/uploads/2022/08/gsc_111613263_315659_1-fotos.png" alt="Calming Spray">
                    <div class="product-info">
                        <h3>Calming Spray</h3>
                        <p class="product-desc">Reduces anxiety during travel</p>
                        <div class="price">₹549</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Calming Spray', 549)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://tse3.mm.bing.net/th/id/OIP.MhK8t2iFC3vNACesuxH43wHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Eye Drops">
                    <div class="product-info">
                        <h3>Eye Drops</h3>
                        <p class="product-desc">Gentle solution for eye care</p>
                        <div class="price">₹399</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Eye Drops', 399)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://m.media-amazon.com/images/I/61ieUK5OVwL.AC.jpg" alt="Nail Clippers">
                    <div class="product-info">
                        <h3>Nail Clippers</h3>
                        <p class="product-desc">Professional pet nail trimmer</p>
                        <div class="price">₹249</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Nail Clippers', 249)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://m.media-amazon.com/images/I/719iSGEq4hL.AC.jpg" alt="Digestive Supplements">
                    <div class="product-info">
                        <h3>Digestive Supplements</h3>
                        <p class="product-desc">Probiotics for gut health</p>
                        <div class="price">₹699</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Digestive Supplements', 699)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://rottweilersyndicate.com/wp-content/uploads/2023/01/81hiU-UEmL.AC_SL1500.jpg" alt="Hot Spot Treatment">
                    <div class="product-info">
                        <h3>Hot Spot Treatment</h3>
                        <p class="product-desc">Spray for skin irritations</p>
                        <div class="price">₹449</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Hot Spot Treatment', 449)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.oU_HL0GM2TwhWgzOMX--FQHaH-?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Vitamin Supplements">
                    <div class="product-info">
                        <h3>Vitamin Supplements</h3>
                        <p class="product-desc">Multivitamin for overall health</p>
                        <div class="price">₹899</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Vitamin Supplements', 899)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="health">
                    <img src="https://i5.walmartimages.com/seo/Oxyfresh-Cat-Dental-Water-Additive-8-fl-oz-2-pack_b319679b-c356-42e4-ad6d-04ad69d0ee6a.a456eab8927e770e8bcdaf77b96f01ac.jpeg" alt="Dental Water Additive">
                    <div class="product-info">
                        <h3>Dental Water Additive</h3>
                        <p class="product-desc">Freshens breath in drinking water</p>
                        <div class="price">₹399</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Dental Water Additive', 399)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <!-- ACCESSORIES PRODUCTS (15 items) -->
                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/71vlGnHqlWL.AC_SL1500.jpg" alt="Pet Carrier">
                    <div class="product-info">
                        <h3>Pet Carrier</h3>
                        <p class="product-desc">Ventilated travel carrier for small pets</p>
                        <div class="price">₹1,799</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Pet Carrier', 1799)">Add to Cart</button>
                        </div>
                    </div>
                </div>
                
                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/81ES8agPgWL.AC_SL1500.jpg" alt="Dog Leash">
                    <div class="product-info">
                        <h3>Dog Leash</h3>
                        <p class="product-desc">6ft reflective nylon leash</p>
                        <div class="price">₹449</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Dog Leash', 449)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://tse1.mm.bing.net/th/id/OIP.hMd86AslLiLVXSZDDWNWDgHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Pet Bed">
                    <div class="product-info">
                        <h3>Orthopedic Pet Bed</h3>
                        <p class="product-desc">Memory foam bed for joint support</p>
                        <div class="price">₹2,499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Orthopedic Pet Bed', 2499)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://pawsandtails.pet/wp-content/uploads/2022/11/p-dietary-124407-web-3.jpg" alt="Food Bowl">
                    <div class="product-info">
                        <h3>Stainless Steel Food Bowl</h3>
                        <p class="product-desc">Anti-slip stainless steel bowl set</p>
                        <div class="price">₹699</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Stainless Steel Food Bowl', 699)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/71TsNbaAaKL.SL1500.jpg" alt="Dog Collar">
                    <div class="product-info">
                        <h3>Adjustable Dog Collar</h3>
                        <p class="product-desc">Nylon collar with quick-release buckle</p>
                        <div class="price">₹349</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Adjustable Dog Collar', 349)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/718QaHFJaOL.AC.jpg" alt="Litter Box">
                    <div class="product-info">
                        <h3>Enclosed Litter Box</h3>
                        <p class="product-desc">Privacy hood litter box for cats</p>
                        <div class="price">₹1,299</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Enclosed Litter Box', 1299)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://th.bing.com/th/id/OIP.-f6O2BtJsOlgpLcu8XaVLwHaHa?o=7&cb=ucfimg2rm=3&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Pet Gate">
                    <div class="product-info">
                        <h3>Safety Pet Gate</h3>
                        <p class="product-desc">Expandable gate for doorways</p>
                        <div class="price">₹1,899</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Safety Pet Gate', 1899)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/71HUg+Z5zuL.AC_SL1500.jpg" alt="Water Bottle">
                    <div class="product-info">
                        <h3>Travel Water Bottle</h3>
                        <p class="product-desc">Portable water dispenser for walks</p>
                        <div class="price">₹499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Travel Water Bottle', 499)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://tse4.mm.bing.net/th/id/OIP.9mFq-hfT1yFF3x4cj16gXAHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="GPS Tracker">
                    <div class="product-info">
                        <h3>GPS Pet Tracker</h3>
                        <p class="product-desc">Real-time location tracking collar</p>
                        <div class="price">₹3,999</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('GPS Pet Tracker', 3999)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://i5.walmartimages.com/seo/50-Tall-Cat-Scratching-Post-Extra-Large-Scratch-Post-Biggest-Cats-Maine-Coon-7-3-Thick-36lbs-Weight-Solid-Wood-Base-Natural-Sisal-Rope_92c0de6c-2efa-44a6-bb2d-6a15483d2d63.e123df0a2744ad1b2040aa7f2efa880c.jpeg" alt="Scratching Post">
                    <div class="product-info">
                        <h3>Cat Scratching Post</h3>
                        <p class="product-desc">Sisal rope scratching surface</p>
                        <div class="price">₹1,499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Cat Scratching Post', 1499)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://i5.walmartimages.com/seo/MoNiBloom-Pet-Dog-Stroller-3-Wheels-Foldable-Dog-Cat-Strollers-with-Storage-Basket-and-Cup-Holder-for-Small-and-Medium-Cats-Dogs-Puppies-Black_700292da-ac81-45a5-b4d6-efda310066cd.9f725a29d0260f8815f56ddbf3723710.png" alt="Pet Stroller">
                    <div class="product-info">
                        <h3>Pet Stroller</h3>
                        <p class="product-desc">3-wheel stroller for small pets</p>
                        <div class="price">₹4,999</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Pet Stroller', 4999)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://tse1.mm.bing.net/th/id/OIP.LeYwco6eEXGUFEfdZ9YQRQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Food Container">
                    <div class="product-info">
                        <h3>Food Storage Container</h3>
                        <p class="product-desc">Airtight container for pet food</p>
                        <div class="price">₹899</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Food Storage Container', 899)">Add to Cart</button>
                        </div>
                    </div>
                </div>

                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/71bJrc+I8SL.AC_SL1500.jpg" alt="Heated Mat">
                    <div class="product-info">
                        <h3>Heated Pet Mat</h3>
                        <p class="product-desc">Warm bed for cold weather</p>
                        <div class="price">₹1,799</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Heated Pet Mat', 1799)">Add to Cart</button>
                        </div>
                    </div>
                </div>


                <div class="product-card" data-category="accessories">
                    <img src="https://m.media-amazon.com/images/I/61+yHQu8RwL.AC.jpg" alt="Automatic Feeder">
                    <div class="product-info">
                        <h3>Automatic Pet Feeder</h3>
                        <p class="product-desc">Programmable food dispenser</p>
                        <div class="price">₹3,499</div>
                        <div class="product-actions">
                            <button class="btn btn-primary" onclick="addToCart('Automatic Pet Feeder', 3499)">Add to Cart</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Tracking Section -->
    <section class="tracking-section" id="tracking">
        <div class="container">
            <div class="section-title">
                <h2>Track Your Order</h2>
                <p>Enter your tracking number to check delivery status</p>
            </div>
            
            <div class="tracking-form">
                <input type="text" id="trackingNumber" placeholder="Enter tracking number (e.g., PC123456789)">
                <button class="btn btn-primary" onclick="trackOrder()">Track Order</button>
            </div>
            
            <div id="trackingResult" class="tracking-result" style="display: none;">
                <!-- Tracking results will appear here -->
            </div>
        </div>
    </section>
    
   

		<label>Status:</label>
		<select name="status">
			<option value="Ordered">Ordered</option>
			<option value="Pending">Pending</option>
			<option value="Shipped">Shipped</option>
			<option value="Delivered">Delivered</option>
		</select>

		<button type="submit">Update Status</button>
	</form>

	<!-- SUCCESS / FAILURE MESSAGES -->
	<%
		String order = request.getParameter("order");
		String added = request.getParameter("added");
		String status = request.getParameter("status");

		if ("success".equals(order)) out.println("<p style='color:green;'>Order placed successfully!</p>");
		if ("fail".equals(order)) out.println("<p style='color:red;'>Failed to place order.</p>");

		if ("success".equals(added)) out.println("<p style='color:green;'>Added to cart successfully!</p>");
		if ("fail".equals(added)) out.println("<p style='color:red;'>Failed to add to cart.</p>");

		if ("success".equals(status)) out.println("<p style='color:green;'>Status updated successfully!</p>");
		if ("fail".equals(status)) out.println("<p style='color:red;'>Failed to update status.</p>");
	%>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>PawConnect</h3>
                    <p>Connecting pets with loving homes and providing premium pet care services.</p>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-facebook-f"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                        <a href="#"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
                <div class="footer-column">
                    <h3>Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="index.jsp">Home</a></li>
                        <li><a href="pets.jsp">Find Pets</a></li>
                        <li><a href="services.jsp">Services</a></li>
                        <li><a href="delivery.jsp">Delivery</a></li>
                        <li><a href="about.jsp">About Us</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Services</h3>
                    <ul class="footer-links">
                        <li><a href="#">Pet Adoption</a></li>
                        <li><a href="#">Veterinary Care</a></li>
                        <li><a href="#">Grooming</a></li>
                        <li><a href="#">Pet Supplies</a></li>
                        <li><a href="#">Emergency Care</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Contact Info</h3>
                    <ul class="footer-links">
                        <li><i class="fas fa-map-marker-alt"></i>
                        <div class="footer-column">
                    <h3>Contact Info</h3>
                    <ul class="footer-links">
                        <li><i class="fas fa-map-marker-alt"></i> 123 Pet Street, City</li>
                        <li><i class="fas fa-phone"></i> +91 98765 43210</li>
                        <li><i class="fas fa-envelope"></i> info@pawconnect.com</li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2025 PawConnect. All rights reserved.</p>
            </div>
        </div>
    </footer>

    <script>
        function scrollToProducts() {
            document.getElementById('products').scrollIntoView({ behavior: 'smooth' });
        }
        
        function scrollToTracking() {
            document.getElementById('tracking').scrollIntoView({ behavior: 'smooth' });
        }
        
        function addToCart(productName, price) {
            alert(productName + ' added to cart! ₹' + price);
            // Add actual cart functionality here
        }
        
        function trackOrder() {
            const trackingNum = document.getElementById('trackingNumber').value;
            if (!trackingNum) {
                alert('Please enter a tracking number');
                return;
            }
            
            const resultDiv = document.getElementById('trackingResult');
            resultDiv.innerHTML = `
                <div class="tracking-status">
                    <h3>Order Status: In Transit</h3>
                    <p><strong>Tracking Number:</strong> ${trackingNum}</p>
                    <p><strong>Estimated Delivery:</strong> Today by 3:00 PM</p>
                    <div class="tracking-timeline">
                        <div class="timeline-step completed">
                            <i class="fas fa-check-circle"></i>
                            <span>Order Placed</span>
                            <small>Nov 13, 9:00 AM</small>
                        </div>
                        <div class="timeline-step completed">
                            <i class="fas fa-check-circle"></i>
                            <span>Processing</span>
                            <small>Nov 13, 10:30 AM</small>
                        </div>
                        <div class="timeline-step active">
                            <i class="fas fa-shipping-fast"></i>
                            <span>Out for Delivery</span>
                            <small>Expected by 3:00 PM</small>
                        </div>
                        <div class="timeline-step">
                            <i class="fas fa-home"></i>
                            <span>Delivered</span>
                            <small>Pending</small>
                        </div>
                    </div>
                </div>
            `;
            resultDiv.style.display = 'block';
        }
        
        // Filter products by category
        document.querySelectorAll('.filter-btn').forEach(btn => {
            btn.addEventListener('click', function() {
                document.querySelectorAll('.filter-btn').forEach(b => b.classList.remove('active'));
                this.classList.add('active');
                
                const category = this.getAttribute('data-category');
                document.querySelectorAll('.product-card').forEach(card => {
                    if (category === 'all' || card.getAttribute('data-category') === category) {
                        card.style.display = 'block';
                    } else {
                        card.style.display = 'none';
                    }
                });
            });
        });
    </script>
</body>
</html>