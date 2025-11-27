<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Services</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }

        body {
            background: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            color: #333;
            line-height: 1.6;
        }

        /* Navigation Styles - WHITE like first page */
        nav {
            background: white;
            padding: 1rem 2rem;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
            align-items: center;
            max-width: 1200px;
            margin: 0 auto;
        }

        .logo {
            color: #8B5FBF;
            font-size: 1.8rem;
            font-weight: bold;
        }

        .nav-links {
            display: flex;
            gap: 2rem;
            list-style: none;
        }

        .nav-links a {
            color: #333;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .nav-links a:hover {
            color: #8B5FBF;
        }

        .auth-buttons {
            display: flex;
            gap: 1rem;
        }

        .btn {
            padding: 0.5rem 1.5rem;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
        }

        .btn-login {
            background: transparent;
            color: #8B5FBF;
            border: 2px solid #8B5FBF;
        }

        .btn-register {
            background: #8B5FBF;
            color: white;
        }

        .btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(139, 95, 191, 0.2);
        }

        /* Services Hero Section - LAVENDER like first page */
        .services-hero {
            background: linear-gradient(135deg, #8B5FBF 0%, #6A4C93 100%);
            color: white;
            text-align: center;
            padding: 8rem 2rem 4rem;
            margin-top: 60px;
        }

        .services-hero h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            font-weight: 700;
        }

        .services-hero p {
            font-size: 1.3rem;
            max-width: 700px;
            margin: 0 auto 3rem;
            opacity: 0.95;
        }

        .service-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .service-buttons .btn {
            padding: 12px 30px;
            border-radius: 30px;
            font-weight: 600;
            font-size: 1.1rem;
            transition: all 0.3s ease;
        }

        .service-buttons .btn-primary {
            background-color: white;
            color: #8B5FBF;
            border: none;
        }

        .service-buttons .btn-primary:hover {
            background-color: #ffd700;
            color: #8B5FBF;
            transform: translateY(-3px);
            box-shadow: 0 6px 20px rgba(255, 215, 0, 0.4);
        }

        .service-buttons .btn-secondary {
            background-color: transparent;
            color: white;
            border: 2px solid white;
        }

        .service-buttons .btn-secondary:hover {
            background-color: rgba(255, 255, 255, 0.1);
            transform: translateY(-3px);
        }

        /* Main Content Section - WHITE BACKGROUND */
        .main-content {
            background: white;
            border-radius: 30px 30px 0 0;
            margin-top: -30px;
            position: relative;
            z-index: 1;
        }

        /* Services Grid */
        .services-container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 3rem 2rem;
        }

        .services-container h2 {
            text-align: center;
            font-size: 2.5rem;
            color: #333;
            margin-bottom: 1rem;
        }

        .services-container > p {
            text-align: center;
            color: #666;
            margin-bottom: 3rem;
            font-size: 1.1rem;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        .services-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .service-card {
            background: white;
            border-radius: 15px;
            padding: 2rem;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
            border: 1px solid #e0e0e0;
            position: relative;
            overflow: hidden;
        }

        .service-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .service-icon {
            width: 80px;
            height: 80px;
            margin: 0 auto 1rem;
            object-fit: contain;
        }

        .service-card h3 {
            color: #333;
            margin-bottom: 1rem;
            font-size: 1.5rem;
        }

        .service-card p {
            color: #666;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .service-price {
            font-size: 1.5rem;
            font-weight: bold;
            color: #ff6b6b;
            margin-bottom: 1rem;
        }

        .btn-service {
            background: #8B5FBF;
            color: white;
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 25px;
            cursor: pointer;
            font-weight: 600;
            transition: all 0.3s;
            width: 100%;
        }

        .btn-service:hover {
            background: #764ba2;
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(118, 75, 162, 0.3);
        }

        /* Categories Section */
        .categories {
            background: linear-gradient(135deg, #f8f9fa 0%, #e9ecef 100%);
            color: #333;
            padding: 4rem 2rem;
            text-align: center;
        }

        .categories h2 {
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: #333;
        }

        .category-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .category-item {
            background: white;
            padding: 2rem;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s;
            border: 1px solid #e0e0e0;
        }

        .category-item:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }

        .category-item h3 {
            font-size: 1.3rem;
            margin-bottom: 0.5rem;
            color: #8B5FBF;
        }

        .category-item p {
            color: #666;
        }

        /* Features Section */
        .features {
            padding: 4rem 2rem;
            background: white;
            text-align: center;
        }

        .features h2 {
            font-size: 2.5rem;
            margin-bottom: 3rem;
            color: #333;
        }

        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            max-width: 1200px;
            margin: 0 auto;
        }

        .feature-card {
            padding: 2rem;
            text-align: center;
        }

        .feature-icon {
            width: 60px;
            height: 60px;
            margin: 0 auto 1rem;
            object-fit: contain;
        }

        .feature-card h3 {
            margin-bottom: 1rem;
            color: #333;
        }

        .feature-card p {
            color: #666;
        }

        /* Footer Section */
        footer {
            background: #2D3748;
            color: white;
            padding: 3rem 2rem 1rem;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-bottom: 2rem;
        }

        .footer-section h3 {
            color: #8B5FBF;
            margin-bottom: 1rem;
            font-size: 1.3rem;
        }

        .footer-section p {
            color: #CBD5E0;
            margin-bottom: 1.5rem;
            line-height: 1.6;
        }

        .footer-links {
            list-style: none;
        }

        .footer-links li {
            margin-bottom: 0.5rem;
        }

        .footer-links a {
            color: #CBD5E0;
            text-decoration: none;
            transition: color 0.3s;
        }

        .footer-links a:hover {
            color: #8B5FBF;
        }

        .contact-info {
            color: #CBD5E0;
            line-height: 1.6;
        }

        .contact-info p {
            margin-bottom: 0.5rem;
        }

        .copyright {
            text-align: center;
            padding-top: 2rem;
            border-top: 1px solid #4A5568;
            color: #CBD5E0;
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .nav-container {
                flex-direction: column;
                gap: 1rem;
            }

            .nav-links {
                gap: 1rem;
                flex-wrap: wrap;
                justify-content: center;
            }

            .services-hero h1 {
                font-size: 2.2rem;
            }

            .services-hero {
                padding: 6rem 1rem 3rem;
            }

            .service-buttons {
                flex-direction: column;
                align-items: center;
            }

            .service-buttons .btn {
                width: 200px;
            }

            .services-grid {
                grid-template-columns: 1fr;
            }

            .category-grid {
                grid-template-columns: 1fr;
            }

            .footer-content {
                grid-template-columns: 1fr;
                text-align: center;
            }
        }
    </style>
</head>
<body>
    <!-- Navigation - WHITE -->
    <nav>
        <div class="nav-container">
            <div class="logo">PawConnect</div>
            <ul class="nav-links">
                <li><a href="#">Home</a></li>
                <li><a href="#">Find Pets</a></li>
                <li><a href="#" style="color: #8B5FBF;">Services</a></li>
                <li><a href="#">Delivery</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Contact</a></li>
            </ul>
            <div class="auth-buttons">
                <button class="btn btn-login">Login</button>
                <button class="btn btn-register">Register</button>
            </div>
        </div>
    </nav>

    <!-- Services Hero Section - LAVENDER GRADIENT -->
    <section class="services-hero">
        <h1>Comprehensive Pet Services</h1>
        <p>From grooming to veterinary care, we provide everything your furry friend needs for a happy and healthy life</p>
        <div class="service-buttons">
            <button class="btn btn-primary">Explore All Services</button>
            <button class="btn btn-secondary">Book Consultation</button>
        </div>
    </section>

    <!-- Main Content - WHITE BACKGROUND -->
    <div class="main-content">
        <!-- Main Services Grid -->
        <section class="services-container">
            <h2>Our Services</h2>
            <p>Choose from our wide range of professional pet services</p>

            <div class="services-grid">
               
                <!-- Service 1 -->
                <div class="service-card">
                    <img src="https://static.vecteezy.com/system/resources/previews/020/000/942/non_2x/professional-dog-care-in-a-specialized-salon-groomers-hold-tools-in-their-hands-on-a-gray-background-papillon-dog-on-the-background-of-a-grooming-tool-photo.jpg" alt="Grooming" class="service-icon">
                    <h3>Professional Grooming</h3>
                    <p>Full grooming service including bath, haircut, nail trimming, and ear cleaning</p>
                    <div class="service-price">1500rs-2700rs</div>
                    <button class="btn-service">Book Now</button>
                </div>

                <!-- Service 2 -->
                <div class="service-card">
                    <img src="https://tse2.mm.bing.net/th/id/OIP.5ABADFy56bWB9hLt6VrTlgHaEo?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Veterinary Care" class="service-icon">
                    <h3>Veterinary Care</h3>
                    <p>Comprehensive health checkups, vaccinations, and medical treatments</p>
                    <div class="service-price">2000rs-6000rs</div>
                    <button class="btn-service">Book Appointment</button>
                </div>

                <!-- Service 3 -->
                <div class="service-card">
                    <img src="https://tse2.mm.bing.net/th/id/OIP.cdjlUokGcaESZTCuOp1aUAHaE7?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Pet Boarding" class="service-icon">
                    <h3>Pet Boarding</h3>
                    <p>Safe and comfortable boarding facilities with 24/7 supervision</p>
                    <div class="service-price">2500rs/day</div>
                    <button class="btn-service">Reserve Spot</button>
                </div>

                <!-- Service 4 -->
                <div class="service-card">
                    <img src="https://th.bing.com/th/id/R.d77a537af0ba252e7b2424dcf6162cbc?rik=zNM9aWdQ5hs%2bkA&riu=http%3a%2f%2fohmydogwalking.ca%2fwp-content%2fuploads%2f2015%2f01%2fshutterstock_164195969.jpg&ehk=ZnzsAkF%2fpqEBwJmy7uelCiT3%2bP9yeRpu3Rzlcv5gGL4%3d&risl=&pid=ImgRaw&r=0" alt="Dog Walking" class="service-icon">
                    <h3>Dog Walking</h3>
                    <p>Regular walking services to keep your pet active and healthy</p>
                    <div class="service-price">350rs/walk</div>
                    <button class="btn-service">Schedule Walk</button>
                </div>

                <!-- Service 5 -->
                <div class="service-card">
                    <img src=https://tse1.mm.bing.net/th/id/OIP.DfLXt3dA4OCsJTpY3cElOwHaEK?rs=1&pid=ImgDetMain&o=7&rm=3"" alt="Pet Sitting" class="service-icon">
                    <h3>Pet Sitting</h3>
                    <p>In-home pet sitting services while you're away</p>
                    <div class="service-price">700rs/day</div>
                    <button class="btn-service">Book Sitter</button>
                </div>

                <!-- Service 6 -->
                <div class="service-card">
                    <img src="images/training-icon.png" alt="Obedience Training" class="service-icon">
                    <h3>Obedience Training</h3>
                    <p>Professional training sessions for better behavior and obedience</p>
                    <div class="service-price">1800rs/session</div>
                    <button class="btn-service">Start Training</button>
                </div>

                <!-- Service 7 -->
                <div class="service-card">
                    <img src="images/spa-icon.png" alt="Pet Spa" class="service-icon">
                    <h3>Pet Spa & Massage</h3>
                    <p>Relaxing spa treatments and therapeutic massages</p>
                    <div class="service-price">1500rs-3000rs</div>
                    <button class="btn-service">Book Spa</button>
                </div>

                <!-- Service 8 -->
                <div class="service-card">
                    <img src="images/photography-icon.png" alt="Pet Photography" class="service-icon">
                    <h3>Pet Photography</h3>
                    <p>Professional photoshoots to capture your pet's best moments</p>
                    <div class="service-price">3000rs/session</div>
                    <button class="btn-service">Book Shoot</button>
                </div>

                <!-- Service 9 -->
                <div class="service-card">
                    <img src="images/transportation-icon.png" alt="Pet Transportation" class="service-icon">
                    <h3>Pet Transportation</h3>
                    <p>Safe and comfortable transportation for your pets</p>
                    <div class="service-price">650rs/trip</div>
                    <button class="btn-service">Book Ride</button>
                </div>

                <!-- Service 10 -->
                <div class="service-card">
                    <img src="images/party-icon.png" alt="Pet Party" class="service-icon">
                    <h3>Pet Party Planning</h3>
                    <p>Organize memorable birthday parties and celebrations for your pet</p>
                    <div class="service-price">3500+rs</div>
                    <button class="btn-service">Plan Event</button>
                </div>

                <!-- Service 11 -->
                <div class="service-card">
                    <img src="images/mobile-grooming-icon.png" alt="Mobile Grooming" class="service-icon">
                    <h3>Mobile Grooming</h3>
                    <p>Grooming services that come to your doorstep</p>
                    <div class="service-price">1500rs-1900rs</div>
                    <button class="btn-service">Book Mobile</button>
                </div>

                <!-- Service 12 -->
                <div class="service-card">
                    <img src="images/emergency-icon.png" alt="Emergency Care" class="service-icon">
                    <h3>Emergency Care</h3>
                    <p>24/7 emergency veterinary services for urgent situations</p>
                    <div class="service-price">1700+rs</div>
                    <button class="btn-service">Emergency</button>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features">
            <h2>Why Choose Our Services?</h2>
            <div class="features-grid">
                <div class="feature-card">
                    <img src="images/expert-icon.png" alt="Expert Professionals" class="feature-icon">
                    <h3>Expert Professionals</h3>
                    <p>Certified and experienced pet care specialists</p>
                </div>
                <div class="feature-card">
                    <img src="images/quick-booking-icon.png" alt="Quick Booking" class="feature-icon">
                    <h3>Quick Booking</h3>
                    <p>Easy online booking with instant confirmation</p>
                </div>
                <div class="feature-card">
                    <img src="images/loving-care-icon.png" alt="Loving Care" class="feature-icon">
                    <h3>Loving Care</h3>
                    <p>Your pets are treated like family</p>
                </div>
                <div class="feature-card">
                    <img src="images/safe-icon.png" alt="Safe & Secure" class="feature-icon">
                    <h3>Safe & Secure</h3>
                    <p>Fully insured and bonded services</p>
                </div>
            </div>
        </section>

        <!-- Service Categories -->
        <section class="categories">
            <h2>Service Categories</h2>
            <div class="category-grid">
                <div class="category-item">
                    <h3>Health & Wellness</h3>
                    <p>Vet care, grooming, dental</p>
                </div>
                <div class="category-item">
                    <h3>Care & Boarding</h3>
                    <p>Boarding, sitting, walking</p>
                </div>
                <div class="category-item">
                    <h3>Training & Behavior</h3>
                    <p>Obedience, socialization</p>
                </div>
                <div class="category-item">
                    <h3>Luxury Services</h3>
                    <p>Spa, photography, parties</p>
                </div>
            </div>
        </section>
    </div>

    <!-- Footer Section -->
    <footer>
        <div class="footer-content">
            <div class="footer-section">
                <h3>PawConnect</h3>
                <p>Connecting loving homes with pets in need. Making pet care simple, accessible, and joyful for everyone.</p>
            </div>
            
            <div class="footer-section">
                <h3>Quick Links</h3>
                <ul class="footer-links">
                    <li><a href="#">Home</a></li>
                    <li><a href="#">Adopt a Pet</a></li>
                    <li><a href="#">About Us</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Services</h3>
                <ul class="footer-links">
                    <li><a href="#">Pet Adoption</a></li>
                    <li><a href="#">Pet Supplies</a></li>
                    <li><a href="#">Veterinary Care</a></li>
                    <li><a href="#">Pet Training</a></li>
                </ul>
            </div>
            
            <div class="footer-section">
                <h3>Contact Us</h3>
                <div class="contact-info">
                    <p>Devarachikkaniahill, Bengaluru, Karnataka - 560068</p>
                    <p>+91 8951505875</p>
                    <p>info@pawconnect.com</p>
                </div>
            </div>
        </div>
        
        <div class="copyright">
            <p>© 2023 PawConnect. All rights reserved.</p>
        </div>
    </footer>

    <script>
        // Simple JavaScript for service booking
        document.querySelectorAll('.btn-service').forEach(button => {
            button.addEventListener('click', function() {
                const serviceName = this.parentElement.querySelector('h3').textContent;
                alert(`Booking requested for: ${serviceName}\nOur team will contact you shortly!`);
            });
        });

        // Add smooth scrolling
        document.querySelectorAll('a[href^="#"]').forEach(anchor => {
            anchor.addEventListener('click', function (e) {
                e.preventDefault();
                document.querySelector(this.getAttribute('href')).scrollIntoView({
                    behavior: 'smooth'
                });
            });
        });
    </script>
</body>
</html>