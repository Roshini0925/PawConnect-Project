<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PawConnect - Find Your Perfect Pet Companion</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <!-- ADDED: Main content wrapper -->
    <div class="main-content">
    
        <!-- Hero Section -->
        <section class="hero">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-text">
                    
                        <h1>Find Your Perfect <span class="highlight">Pet Companion</span></h1>
                        <p>PawConnect is established with the motto "Pet Me Good" which helps you find your dream pet. Our services enable you to cater to all your pet needs with ease and from the comfort of your home.</p>
                        <p>Get all your pet supplies at your doorstep via our application. Our aim is to provide customers with the best services so you can focus on what matters most - the love and care for your furry friends.</p>
                        <div class="hero-buttons">
                            <button class="btn btn-primary" onclick="window.location.href='pets.jsp'">Find a Pet</button>
                            <button class="btn btn-secondary" onclick="window.location.href='about.jsp'">Learn More</button>
                        </div>
                    </div>
                    <div class="hero-image">
                        <div class="hero-slider">
                            <div class="slide active">
                                <img src="https://images.unsplash.com/photo-1450778869180-41d0601e046e?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Happy pets playing together">
                            </div>
                            <div class="slide">
                                <img src="https://images.unsplash.com/photo-1552053831-71594a27632d?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Cute dog waiting for adoption">
                            </div>
                            <div class="slide">
                                <img src="https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Adorable cat looking for home">
                            </div>
                            <div class="slide">
                                <img src="https://images.unsplash.com/photo-1548767797-d8c844163c4c?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="Happy family with their new pet">
                            </div>
                            <div class="slider-controls">
                                <div class="slider-dot active" onclick="showSlide(0)"></div>
                                <div class="slider-dot" onclick="showSlide(1)"></div>
                                <div class="slider-dot" onclick="showSlide(2)"></div>
                                <div class="slider-dot" onclick="showSlide(3)"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Features Section -->
        <section class="features">
            <div class="container">
                <div class="section-title">
                    <h2>Why Choose PawConnect?</h2>
                    <p>We provide comprehensive services to make pet adoption and care simple and enjoyable</p>
                </div>
                <div class="features-grid">
                    <!-- Adoption Process Card -->
                    <div class="feature-card" onclick="window.location.href='pets.jsp'">
                        <div class="feature-icon">
                            <i class="fas fa-dog"></i>
                        </div>
                        <h3>Easy Adoption Process</h3>
                        <p>Find your perfect pet with our simple and transparent adoption process.</p>
                        <button class="learn-more-btn">Start Adoption</button>
                    </div>
                    
                    <!-- Fast Delivery Card -->
                    <div class="feature-card" onclick="window.location.href='products'">
                        <div class="feature-icon">
                            <i class="fas fa-shipping-fast"></i>
                        </div>
                        <h3>Fast Delivery</h3>
                        <p>Get all your pet supplies delivered right to your doorstep.</p>
                        <button class="learn-more-btn">Shop Now</button>
                    </div>
                    
                    
                    
                    <!-- Veterinary Support Card -->
                    <div class="feature-card" onclick="window.location.href='vet-care.jsp'">
                        <div class="feature-icon">
                            <i class="fas fa-user-md"></i>
                        </div>
                        <h3>Veterinary Support</h3>
                        <p>Access our network of trusted veterinarians for your pet's health needs.</p>
                        <button class="learn-more-btn">Book Appointment</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Statistics Section -->
        <section class="stats-section">
            <div class="container">
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-number" data-target="500">0</div>
                        <div class="stat-label">Pets Adopted</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number" data-target="1000">0</div>
                        <div class="stat-label">Happy Families</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number" data-target="50">0</div>
                        <div class="stat-label">Partner Vets</div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-number" data-target="24">0</div>
                        <div class="stat-label">Hours Support</div>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials Section with Sliding Effect -->
        <section class="testimonials">
            <div class="container">
                <div class="section-title">
                    <h2>What Pet Parents Say</h2>
                    <p>Read stories from our happy customers</p>
                </div>
                <div class="testimonials-slider">
                    <div class="testimonials-track">
                        <!-- Review 1 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"PawConnect helped me find my perfect companion, Max. The adoption process was smooth and the team was very supportive throughout!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Sarah Johnson</h4>
                                    <span>Dog Mom</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 2 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"The veterinary services are exceptional! Dr. Smith took great care of my cat Luna during her emergency. Highly recommended!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Mike Chen</h4>
                                    <span>Cat Dad</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 3 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"Fast delivery and great quality products! My dog Buddy loves his new toys and the food delivery service is a lifesaver."</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Priya Sharma</h4>
                                    <span>Pet Parent</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 4 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"Adopted my second pet through PawConnect! The matching system is amazing - found the perfect fit for our family both times."</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Emily Rodriguez</h4>
                                    <span>Two-time Adopter</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 5 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"The 24/7 support team answered all my new pet parent questions. So grateful for their patience and expertise!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>David Thompson</h4>
                                    <span>First-time Owner</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 6 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"From adoption to ongoing care, PawConnect has been there every step. The community and resources are incredible!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Lisa Wang</h4>
                                    <span>Happy Customer</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 7 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"The mobile app makes everything so easy! I can track deliveries, book vet appointments, and connect with other pet lovers."</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Alex Turner</h4>
                                    <span>Tech Enthusiast</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 8 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"Our senior dog received such compassionate care through PawConnect's partner vets. They truly understand special needs pets."</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Maria Garcia</h4>
                                    <span>Senior Pet Owner</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 9 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"The adoption counseling helped us choose the right pet for our lifestyle. Couldn't be happier with our new family member!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>James Wilson</h4>
                                    <span>Family Man</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 10 -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"PawConnect's emergency response team saved my cat's life. Quick, professional, and compassionate when it mattered most."</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Sophie Brown</h4>
                                    <span>Forever Grateful</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Duplicate slides for seamless loop -->
                        <!-- Review 1 Duplicate -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"PawConnect helped me find my perfect companion, Max. The adoption process was smooth and the team was very supportive throughout!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Sarah Johnson</h4>
                                    <span>Dog Mom</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 2 Duplicate -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"The veterinary services are exceptional! Dr. Smith took great care of my cat Luna during her emergency. Highly recommended!"</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Mike Chen</h4>
                                    <span>Cat Dad</span>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Review 3 Duplicate -->
                        <div class="testimonial-slide">
                            <div class="testimonial-content">
                                <p>"Fast delivery and great quality products! My dog Buddy loves his new toys and the food delivery service is a lifesaver."</p>
                            </div>
                            <div class="testimonial-author">
                                <div class="author-avatar">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <h4>Priya Sharma</h4>
                                    <span>Pet Parent</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    
    </div> <!-- END: Main content wrapper -->

    <%@ include file="footer.jsp" %>
    
    <script>
        // Hero Image Slider
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide');
        const dots = document.querySelectorAll('.slider-dot');
        const totalSlides = slides.length;

        function showSlide(n) {
            // Remove active class from all slides and dots
            slides.forEach(slide => slide.classList.remove('active'));
            dots.forEach(dot => dot.classList.remove('active'));
            
            // Calculate current slide index
            currentSlide = (n + totalSlides) % totalSlides;
            
            // Add active class to current slide and dot
            slides[currentSlide].classList.add('active');
            dots[currentSlide].classList.add('active');
        }

        function nextSlide() {
            showSlide(currentSlide + 1);
        }

        // Auto slide every 2 seconds
        let slideInterval = setInterval(nextSlide, 2000);

        // Pause slider on hover
        const heroSlider = document.querySelector('.hero-slider');
        if (heroSlider) {
            heroSlider.addEventListener('mouseenter', () => {
                clearInterval(slideInterval);
            });

            heroSlider.addEventListener('mouseleave', () => {
                slideInterval = setInterval(nextSlide, 2000);
            });
        }

        // Dot click functionality
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                clearInterval(slideInterval);
                showSlide(index);
                slideInterval = setInterval(nextSlide, 2000);
            });
        });

        // Animated counters with plus sign
        function animateCounters() {
            const counters = document.querySelectorAll('.stat-number');
            const speed = 200;

            counters.forEach(counter => {
                const target = +counter.getAttribute('data-target');
                const increment = target / speed;
                let current = 0;

                const updateCounter = () => {
                    if (current < target) {
                        current += increment;
                        counter.innerText = Math.ceil(current);
                        setTimeout(updateCounter, 10);
                    } else {
                        counter.innerText = target;
                    }
                };

                updateCounter();
            });
        }

        // Intersection Observer for counter animation
        const observer = new IntersectionObserver((entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    animateCounters();
                }
            });
        });

        const statsSection = document.querySelector('.stats-section');
        if (statsSection) {
            observer.observe(statsSection);
        }

        // Feature card hover effects
        document.addEventListener('DOMContentLoaded', function() {
            const featureCards = document.querySelectorAll('.feature-card');
            
            featureCards.forEach(card => {
                card.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-10px) scale(1.02)';
                });
                
                card.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0) scale(1)';
                });
            });
        });
    </script>
</body>
</html>