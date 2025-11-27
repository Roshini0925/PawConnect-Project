<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Veterinary Care - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <!-- ADDED: Main content wrapper -->
    <div class="main-content">
    
        <section class="service-hero">
            <div class="container">
                <div class="hero-content">
                    <div class="hero-text">
                        <h1>Veterinary Care</h1>
                        <p>Professional healthcare services for your beloved pets. Book appointments with trusted veterinarians.</p>
                    </div>
                    <div class="hero-image">
                        <img src="https://www.pngkit.com/png/detail/56-561275_dog-with-stethoscope-and-cat-cat-dog-vet.png" alt="Veterinary Care">
                    </div>
                </div>
            </div>
        </section>

        <section class="service-features">
            <div class="container">
                <div class="features-grid">
                    <div class="service-feature-card">
                        <i class="fas fa-stethoscope"></i>
                        <h3>Regular Checkups</h3>
                        <p>Comprehensive health examinations for your pets</p>
                    </div>
                    <div class="service-feature-card">
                        <i class="fas fa-syringe"></i>
                        <h3>Vaccinations</h3>
                        <p>Complete vaccination schedules and preventive care</p>
                    </div>
                    <div class="service-feature-card">
                        <i class="fas fa-ambulance"></i>
                        <h3>Emergency Care</h3>
                        <p>24/7 emergency veterinary services</p>
                    </div>
                    <div class="service-feature-card">
                        <i class="fas fa-teeth"></i>
                        <h3>Dental Care</h3>
                        <p>Professional dental cleaning and oral health services</p>
                    </div>
                </div>
            </div>
        </section>

        <section class="appointment-section">
            <div class="container">
                <div class="section-title">
                    <h2>Book an Appointment</h2>
                    <p>Schedule a visit with our expert veterinarians</p>
                </div>
                
                <div class="appointment-content">
                    <div class="vet-list">
                        <h3>Available Veterinarians</h3>
                        <div class="vet-cards">
                            <!-- Existing Doctors -->
                            <div class="vet-card">
                                <img src="https://img.freepik.com/premium-photo/veterinary-clinic-female-doctor-portrait-animal-hospital-holding-cute-sick-cat_530697-103442.jpg" alt="Dr. Smith">
                                <div class="vet-info">
                                    <h4>Dr. Sarah Smith</h4>
                                    <p class="specialization">General Practice & Surgery</p>
                                    <p class="experience">10+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>4.5 (120 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. Sarah Smith')">Book Appointment</button>
                                </div>
                            </div>
                            
                            <div class="vet-card">
                                <img src="https://img.freepik.com/premium-photo/young-male-indian-doctor-white-background_1239886-2044.jpg?w=1380" alt="Dr. Johnson">
                                <div class="vet-info">
                                    <h4>Dr. Mike Johnson</h4>
                                    <p class="specialization">Emergency & Critical Care</p>
                                    <p class="experience">8+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>5.0 (95 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. Mike Johnson')">Book Appointment</button>
                                </div>
                            </div>

                            <!-- New Doctors Added -->
                            <div class="vet-card">
                                <img src="https://tse1.mm.bing.net/th/id/OIP.Ft6BFqeJsJx4BYxweaDqegAAAA?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Dr. Patel">
                                <div class="vet-info">
                                    <h4>Dr. Priya Patel</h4>
                                    <p class="specialization">Dermatology & Allergy</p>
                                    <p class="experience">12+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>4.9 (156 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. Priya Patel')">Book Appointment</button>
                                </div>
                            </div>

                            <div class="vet-card">
                                <img src="https://tse4.mm.bing.net/th/id/OIP.pklcXYA1t5VwFZgnwB1fWQHaFj?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Dr. Rodriguez">
                                <div class="vet-info">
                                    <h4>Dr. Maria Rodriguez</h4>
                                    <p class="specialization">Orthopedic Surgery</p>
                                    <p class="experience">15+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>4.7 (203 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. Maria Rodriguez')">Book Appointment</button>
                                </div>
                            </div>

                            <div class="vet-card">
                                <img src="https://media.istockphoto.com/photos/portrait-of-indian-doctor-picture-id1124684854?k=20&m=1124684854&s=612x612&w=0&h=giILm6W9_EGA3rpfdv0lPPZn1jX45oKiNUxHsMVWnI4=" alt="Dr. Chen">
                                <div class="vet-info">
                                    <h4>Dr. James Chen</h4>
                                    <p class="specialization">Cardiology & Internal Medicine</p>
                                    <p class="experience">9+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>5.0 (89 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. James Chen')">Book Appointment</button>
                                </div>
                            </div>

                            <div class="vet-card">
                                <img src="https://images.squarespace-cdn.com/content/v1/5a6a55c0f09ca458ce51a4cf/1567183090710-VO23V3QSWPPL8ORLZECB/Dr.%2BEmily%2BWilliams3.jpg" alt="Dr. Williams">
                                <div class="vet-info">
                                    <h4>Dr. Emily Williams</h4>
                                    <p class="specialization">Oncology & Cancer Care</p>
                                    <p class="experience">11+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star-half-alt"></i>
                                        <span>4.8 (134 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. Emily Williams')">Book Appointment</button>
                                </div>
                            </div>

                            <div class="vet-card">
                                <img src="https://medicaldialogues.in/h-upload/2023/07/25/214945-dr-rajkumar.webp?width=500&height=300" alt="Dr. Kumar">
                                <div class="vet-info">
                                    <h4>Dr. Raj Kumar</h4>
                                    <p class="specialization">Neurology & Spinal Surgery</p>
                                    <p class="experience">14+ years experience</p>
                                    <div class="rating">
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <i class="fas fa-star"></i>
                                        <span>4.9 (178 reviews)</span>
                                    </div>
                                    <button class="btn btn-primary" onclick="selectVet('Dr. Raj Kumar')">Book Appointment</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="appointment-form-section">
                        <h3>Schedule Your Visit</h3>
                        <form class="appointment-form" id="appointmentForm">
                            <input type="hidden" id="selectedVet" name="vetName">
                            
                            <div class="form-group">
                                <label for="petName">Pet's Name *</label>
                                <input type="text" id="petName" name="petName" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="petType">Pet Type *</label>
                                <select id="petType" name="petType" required>
                                    <option value="">Select Pet Type</option>
                                    <option value="Dog">Dog</option>
                                    <option value="Cat">Cat</option>
                                    <option value="Bird">Bird</option>
                                    <option value="Other">Other</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="breed">Breed</label>
                                <input type="text" id="breed" name="breed">
                            </div>
                            
                            <div class="form-group">
                                <label for="appointmentDate">Preferred Date *</label>
                                <input type="date" id="appointmentDate" name="appointmentDate" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="appointmentTime">Preferred Time *</label>
                                <select id="appointmentTime" name="appointmentTime" required>
                                    <option value="">Select Time</option>
                                    <option value="09:00">9:00 AM</option>
                                    <option value="10:00">10:00 AM</option>
                                    <option value="11:00">11:00 AM</option>
                                    <option value="14:00">2:00 PM</option>
                                    <option value="15:00">3:00 PM</option>
                                    <option value="16:00">4:00 PM</option>
                                </select>
                            </div>
                            
                            <div class="form-group">
                                <label for="symptoms">Symptoms / Reason for Visit</label>
                                <textarea id="symptoms" name="symptoms" rows="4" placeholder="Describe your pet's symptoms or reason for visit"></textarea>
                            </div>
                            
                            <div class="form-group">
                                <label for="ownerName">Your Name *</label>
                                <input type="text" id="ownerName" name="ownerName" required>
                            </div>
                            
                            <div class="form-group">
                                <label for="ownerPhone">Your Phone *</label>
                                <input type="tel" id="ownerPhone" name="ownerPhone" required>
                            </div>
                            
                            <button type="submit" class="btn btn-primary btn-full">Book Appointment</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    
    </div> <!-- END: Main content wrapper -->

    <%@ include file="footer.jsp" %>
    
    <script>
    function selectVet(vetName) {
        <%
        if(session.getAttribute("user") == null) {
        %>
            // User not logged in
            if(confirm('Please login to book appointments. Would you like to login now?')) {
                window.location.href = 'login.jsp?redirect=' + encodeURIComponent('vet-care.jsp');
            }
            return;
        <%
        }
        %>
        
        // User is logged in - proceed with booking
        document.getElementById('selectedVet').value = vetName;
        document.querySelector('.appointment-form-section h3').textContent = 'Book with ' + vetName;
        document.querySelector('.appointment-form-section').scrollIntoView({ behavior: 'smooth' });
    }

        document.getElementById('appointmentForm').addEventListener('submit', function(e) {
            e.preventDefault();
            const vetName = document.getElementById('selectedVet').value;
            if (!vetName) {
                alert('Please select a veterinarian first.');
                return;
            }
            
            alert('Appointment request submitted! We will contact you shortly to confirm.');
            this.reset();
        });

        // Set minimum date to today
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('appointmentDate').min = today;
    </script>
</body>
</html>