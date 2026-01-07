<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adopt a Pet - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
   <jsp:include page="header.jsp" />
    <div class="main-content">
    
    <section class="pets-section">
        <div class="container">
            <div class="section-title">
                <h2>Available Pets for Adoption</h2>
                <p>Find your perfect furry companion from our loving pets</p>
            </div>
            
            <!-- ADDED: Success message for adoption -->
            <%
            String adoption = request.getParameter("adoption");
            String pet = request.getParameter("pet");
            if("success".equals(adoption) && pet != null) {
            %>
                <div class="success-message" style="background: #e8f5e8; color: #2e7d32; padding: 12px; border-radius: 8px; margin-bottom: 20px; border: 1px solid #c8e6c9; text-align: center;">
                    Thank you! Your adoption application for <%= pet %> has been submitted successfully.
                </div>
            <%
            }
            %>
            
            <div class="filters-container">
                <div class="filters">
                    <select id="speciesFilter">
                        <option value="">All Species</option>
                        <option value="Dog">🐕 Dogs</option>
                        <option value="Cat">🐱 Cats</option>
                        <option value="Bird">🐦 Birds</option>
                        <option value="Fish">🐠 Fishes</option>
                    </select>
                    <select id="ageFilter">
                        <option value="">Any Age</option>
                        <option value="0-1">🐾 Puppy/Kitten (0-1)</option>
                        <option value="1-3">🌟 Young (1-3)</option>
                        <option value="4-7">🐶 Adult (4-7)</option>
                        <option value="8+">👴 Senior (8+)</option>
                    </select>
                    <button class="btn btn-secondary" onclick="resetFilters()">Reset Filters</button>
                </div>
                <div class="pets-count">
                    <span id="petsCount">26</span> pets available for adoption
                </div>
            </div>
            
            <div class="pets-grid">
                <!-- Dogs - 8 Animals -->
                <div class="pet-card" data-species="Dog" data-age="1">
                    <div class="pet-image">
                        <img src="https://tse3.mm.bing.net/th/id/OIP.9jp3vrVA5qHN5WLPI6ebQAHaLH?rs=1&pid=ImgDetMain&o=7&rm=3" alt="Max">
                        <div class="pet-tag puppy-tag">Puppy</div>
                    </div>
                    <div class="pet-info">
                        <h3>Max</h3>
                        <span class="species-tag dog-tag">Dog</span>
                        <p><strong>Breed:</strong> Golden Retriever</p>
                        <p><strong>Age:</strong> 1 year</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Bangalore</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(1, 'Max')">Adopt Me</button>
                    </div>
                </div>
                
                
                <div class="pet-card" data-species="Dog" data-age="5">
                    <div class="pet-image">
                        <img src="https://thumbs.dreamstime.com/b/senior-german-shepherd-dog-headshot-against-blurry-green-background-portrait-beautiful-old-white-muzzle-188817290.jpg" alt="Charlie">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Charlie</h3>
                        <span class="species-tag dog-tag">Dog</span>
                        <p><strong>Breed:</strong> German Shepherd</p>
                        <p><strong>Age:</strong> 5 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Delhi</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(3, 'Charlie')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Dog" data-age="9">
                    <div class="pet-image">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.strwfJDk3H1S6F2D3CSDUgHaHw?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Daisy">
                        <div class="pet-tag senior-tag">Senior</div>
                    </div>
                    <div class="pet-info">
                        <h3>Daisy</h3>
                        <span class="species-tag dog-tag">Dog</span>
                        <p><strong>Breed:</strong> Beagle</p>
                        <p><strong>Age:</strong> 9 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Chennai</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(4, 'Daisy')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Dog" data-age="3">
                    <div class="pet-image">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.6O-G-5WptNkv8335ymWBNwHaNL?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Rocky">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Rocky</h3>
                        <span class="species-tag dog-tag">Dog</span>
                        <p><strong>Breed:</strong> Rottweiler</p>
                        <p><strong>Age:</strong> 3 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Hyderabad</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(5, 'Rocky')">Adopt Me</button>
                    </div>
                </div>

                

                <div class="pet-card" data-species="Dog" data-age="4">
                    <div class="pet-image">
                        <img src="https://th.bing.com/th/id/OIP.7YQmeo6ZRVP7tiVZ-LxNhgHaH1?o=7&cb=ucfimg2rm=3&ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Bella">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Bella</h3>
                        <span class="species-tag dog-tag">Dog</span>
                        <p><strong>Breed:</strong> Siberian Husky</p>
                        <p><strong>Age:</strong> 4 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Kolkata</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(17, 'Bella')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Dog" data-age="7">
                    <div class="pet-image">
                        <img src="https://animalcorner.org/wp-content/uploads/2022/04/adorable-boxer-dog-posing-outdoor.jpg" alt="Cooper">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Cooper</h3>
                        <span class="species-tag dog-tag">Dog</span>
                        <p><strong>Breed:</strong> Boxer</p>
                        <p><strong>Age:</strong> 7 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Ahmedabad</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(18, 'Cooper')">Adopt Me</button>
                    </div>
                </div>

                <!-- Cats - 8 Animals -->
                <div class="pet-card" data-species="Cat" data-age="1">
                    <div class="pet-image">
                        <img src="https://tse1.explicit.bing.net/th/id/OIP.dEMXTcBMUZDRUIE8E7nweAHaHi?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Luna">
                        <div class="pet-tag kitten-tag">Kitten</div>
                    </div>
                    <div class="pet-info">
                        <h3>Luna</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Siamese</p>
                        <p><strong>Age:</strong> 1 year</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Pune</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(6, 'Luna')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Cat" data-age="2">
                    <div class="pet-image">
                        <img src="https://i.redd.it/81e8p94q1lv91.jpg" alt="Mittens">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Mittens</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Domestic Shorthair</p>
                        <p><strong>Age:</strong> 2 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Kolkata</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(7, 'Mittens')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Cat" data-age="6">
                    <div class="pet-image">
                        <img src="https://st3.depositphotos.com/1594920/17246/i/450/depositphotos_172463450-stock-photo-persian-kitten-3-months-old.jpg" alt="Simba">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Simba</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Persian</p>
                        <p><strong>Age:</strong> 6 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Ahmedabad</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(8, 'Simba')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Cat" data-age="10">
                    <div class="pet-image">
                        <img src="https://1.bp.blogspot.com/-ZQ9mwrVbSKg/YZppU_MWe8I/AAAAAAAAyuo/VWxm3244fM8vVtBLgnB9jQUVXXnou66dgCLcBGAsYHQ/s798/Maine%2BCoon%2Bwith%2Bvery%2Bshaggy%2Bfur.jpg" alt="Whiskers">
                        <div class="pet-tag senior-tag">Senior</div>
                    </div>
                    <div class="pet-info">
                        <h3>Whiskers</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Maine Coon</p>
                        <p><strong>Age:</strong> 10 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Jaipur</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(9, 'Whiskers')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Cat" data-age="4">
                    <div class="pet-image">
                        <img src="https://dinoanimals.com/wp-content/uploads/2020/12/Bengal-cat-19.jpg" alt="Cleo">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Cleo</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Bengal</p>
                        <p><strong>Age:</strong> 4 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Lucknow</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(10, 'Cleo')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Cat" data-age="1">
                    <div class="pet-image">
                        <img src="https://tse3.mm.bing.net/th/id/OIP.Eqh7QTgp1sXOgxr2pcJu0QHaE8?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Oscar">
                        <div class="pet-tag kitten-tag">Kitten</div>
                    </div>
                    <div class="pet-info">
                        <h3>Oscar</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> British Shorthair</p>
                        <p><strong>Age:</strong> 1 year</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Surat</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(19, 'Oscar')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Cat" data-age="3">
                    <div class="pet-image">
                        <img src="https://preview.redd.it/meet-winston-our-3-year-old-blue-lynx-ragdoll-v0-vdpaaavfhxhc1.jpeg?width=1080&crop=smart&auto=webp&s=0994cbcacfd62d228cb2d0f11224864164ba7dd3" alt="Chloe">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Chloe</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Ragdoll</p>
                        <p><strong>Age:</strong> 3 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Bhopal</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(20, 'Chloe')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Cat" data-age="8">
                    <div class="pet-image">
                        <img src="https://i.ytimg.com/vi/sxOHuHgJJVY/maxresdefault.jpg" alt="Smokey">
                        <div class="pet-tag senior-tag">Senior</div>
                    </div>
                    <div class="pet-info">
                        <h3>Smokey</h3>
                        <span class="species-tag cat-tag">Cat</span>
                        <p><strong>Breed:</strong> Russian Blue</p>
                        <p><strong>Age:</strong> 8 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Indore</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(21, 'Smokey')">Adopt Me</button>
                    </div>
                </div>

                <!-- Birds - 5 Animals -->
                <div class="pet-card" data-species="Bird" data-age="2">
                    <div class="pet-image">
                        <img src="https://tse2.mm.bing.net/th/id/OIP.8UBYOlR_WLy5MjM8TSFx-wHaJN?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Rio">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Rio</h3>
                        <span class="species-tag bird-tag">Bird</span>
                        <p><strong>Breed:</strong> Parrot</p>
                        <p><strong>Age:</strong> 2 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Bangalore</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(11, 'Rio')">Adopt Me</button>
                    </div>
                </div>
                
               <div class="pet-card" data-species="Bird" data-age="1">
    <div class="pet-image">
        <img src="https://th.bing.com/th/id/R.585205c60ad83e20a5ac6c861271e2b1?rik=tlYEZ9zaIvFuJQ&riu=http%3a%2f%2fwww.singing-wings-aviary.com%2fwp-content%2fuploads%2f2015%2f02%2fDomestic-Canary-Images.jpg&ehk=KQ2ZIqhufn0kYg9rnvmLKaJunk8YiogvBU4Aj31Fbp0%3d&risl=&pid=ImgRaw&r=0" alt="Sunny">
        <div class="pet-tag young-tag">Young</div>
    </div>
    <div class="pet-info">
        <h3>Sunny</h3>
        <span class="species-tag bird-tag">Bird</span>
        <p><strong>Breed:</strong> Canary</p>
        <p><strong>Age:</strong> 1 year</p>
        <p><strong>Gender:</strong> Female</p>
        <p class="pet-location">📍 Mumbai</p>
        <button class="btn btn-primary" onclick="openAdoptionForm(12, 'Sunny')">Adopt Me</button>
    </div>
</div>

                <div class="pet-card" data-species="Bird" data-age="4">
                    <div class="pet-image">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.VsBhN5WWYcNWLVBXkdiABAAAAA?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Kiwi">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Kiwi</h3>
                        <span class="species-tag bird-tag">Bird</span>
                        <p><strong>Breed:</strong> Lovebird</p>
                        <p><strong>Age:</strong> 4 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Goa</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(22, 'Kiwi')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Bird" data-age="3">
                    <div class="pet-image">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.JjO-C-cypqzb1eoUGJPArQHaLH?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Sky">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Sky</h3>
                        <span class="species-tag bird-tag">Bird</span>
                        <p><strong>Breed:</strong> Cockatiel</p>
                        <p><strong>Age:</strong> 3 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Kochi</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(23, 'Sky')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Bird" data-age="6">
                    <div class="pet-image">
                        <img src="https://academy.allaboutbirds.org/wp-content/uploads/2022/11/House-Finch_Scott-Martin_ML125733241_Gallery.jpg" alt="Feather">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Feather</h3>
                        <span class="species-tag bird-tag">Bird</span>
                        <p><strong>Breed:</strong> Finch</p>
                        <p><strong>Age:</strong> 6 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Chandigarh</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(24, 'Feather')">Adopt Me</button>
                    </div>
                </div>

                <!-- Fishes - 5 Animals -->
                <div class="pet-card" data-species="Fish" data-age="1">
                    <div class="pet-image">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.ceyEnmpB0BBGkHV_fknJ5QHaEh?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Bubbles">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Bubbles</h3>
                        <span class="species-tag fish-tag">Fish</span>
                        <p><strong>Breed:</strong> Goldfish</p>
                        <p><strong>Age:</strong> 1 year</p>
                        <p><strong>Gender:</strong> Unknown</p>
                        <p class="pet-location">📍 Delhi</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(13, 'Bubbles')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Fish" data-age="2">
                    <div class="pet-image">
                        <img src="https://tse1.explicit.bing.net/th/id/OIP.LXy40lt24C-6jikAliYIyAHaFj?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Nemo">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Nemo</h3>
                        <span class="species-tag fish-tag">Fish</span>
                        <p><strong>Breed:</strong> Clownfish</p>
                        <p><strong>Age:</strong> 2 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Chennai</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(14, 'Nemo')">Adopt Me</button>
                    </div>
                </div>
                
                <div class="pet-card" data-species="Fish" data-age="3">
                    <div class="pet-image">
                        <img src="https://tse4.mm.bing.net/th/id/OIP.XNCqdBvIlz8dKGeHv9ZKnQHaHa?cb=ucfimg2ucfimg=1&rs=1&pid=ImgDetMain&o=7&rm=3" alt="Splash">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Splash</h3>
                        <span class="species-tag fish-tag">Fish</span>
                        <p><strong>Breed:</strong> Betta</p>
                        <p><strong>Age:</strong> 3 years</p>
                        <p><strong>Gender:</strong> Male</p>
                        <p class="pet-location">📍 Hyderabad</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(15, 'Splash')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Fish" data-age="2">
                    <div class="pet-image">
                        <img src="https://thumbs.dreamstime.com/b/golden-carp-lake-72591890.jpg" alt="Goldie">
                        <div class="pet-tag young-tag">Young</div>
                    </div>
                    <div class="pet-info">
                        <h3>Goldie</h3>
                        <span class="species-tag fish-tag">Fish</span>
                        <p><strong>Breed:</strong> Golden Carp</p>
                        <p><strong>Age:</strong> 2 years</p>
                        <p><strong>Gender:</strong> Unknown</p>
                        <p class="pet-location">📍 Pune</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(25, 'Goldie')">Adopt Me</button>
                    </div>
                </div>

                <div class="pet-card" data-species="Fish" data-age="4">
                    <div class="pet-image">
                        <img src="https://i0.wp.com/aquariumtidings.com/wp-content/uploads/2017/12/Depositphotos_67399819_original.jpg?fit=3300%2C2200&ssl=1" alt="Angel">
                        <div class="pet-tag adult-tag">Adult</div>
                    </div>
                    <div class="pet-info">
                        <h3>Angel</h3>
                        <span class="species-tag fish-tag">Fish</span>
                        <p><strong>Breed:</strong> Angelfish</p>
                        <p><strong>Age:</strong> 4 years</p>
                        <p><strong>Gender:</strong> Female</p>
                        <p class="pet-location">📍 Kolkata</p>
                        <button class="btn btn-primary" onclick="openAdoptionForm(26, 'Angel')">Adopt Me</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Adoption Form Modal -->
    <!-- Adoption Form Modal - FIXED SCROLLING -->
    <div id="adoptionModal" class="modal" style="display: none; position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.8); z-index: 9999; overflow: auto; padding: 20px 0;">
        <div class="modal-content" style="background: white; max-width: 500px; margin: 50px auto; padding: 30px; border-radius: 15px; position: relative;">
            <span onclick="closeAdoptionForm()" style="position: absolute; right: 20px; top: 15px; font-size: 30px; cursor: pointer; color: #000; font-weight: bold;">&times;</span>
            <h2 id="modalTitle">Adoption Application</h2>
            <form action="adoption-process.jsp" method="post">
                <input type="hidden" id="petId" name="petId">
                <input type="hidden" id="petName" name="petName">
                
                <div class="form-group">
                    <label for="fullName">Full Name *</label>
                    <input type="text" id="fullName" name="fullName" required>
                </div>
                
                <div class="form-group">
                    <label for="email">Email *</label>
                    <input type="email" id="email" name="email" required>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone *</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>
                
                <div class="form-group">
                    <label for="address">Address</label>
                    <textarea id="address" name="address" rows="3"></textarea>
                </div>
                
                <div class="form-group">
                    <label for="message">Why do you want to adopt this pet?</label>
                    <textarea id="message" name="message" rows="4"></textarea>
                </div>
                
                <button type="submit" class="btn btn-primary">Submit Application</button>
            </form>
        </div>
    </div>
    </div>

    <%@ include file="footer.jsp" %>
    
    <script>
    function openAdoptionForm(petId, petName) {
	    <%
	    if(session.getAttribute("user") == null) {
	    %>
	        if(confirm('Please login to adopt a pet. Would you like to login now?')) {
	            window.location.href = 'login.jsp?redirect=' + encodeURIComponent('pets.jsp?action=adopt&pet=' + petId);
	        }
	    <%
	    } else {
	    %>
	        document.getElementById('petId').value = petId;
	        document.getElementById('petName').value = petName;
	        document.getElementById('adoptionModal').style.display = 'block';
	        document.getElementById('modalTitle').textContent = 'Adopt ' + petName;
	        
	        // Simple scroll to top
	        window.scrollTo(0, 0);
	        
	        // Focus on the first input field
	        setTimeout(function() {
	            document.getElementById('fullName').focus();
	        }, 100);
	    <%
	    }
	    %>
	}

	function closeAdoptionForm() {
	    document.getElementById('adoptionModal').style.display = 'none';
	}

        function resetFilters() {
            document.getElementById('speciesFilter').value = '';
            document.getElementById('ageFilter').value = '';
            filterPets();
        }

        // Filter functionality
        document.addEventListener('DOMContentLoaded', function() {
            const speciesFilter = document.getElementById('speciesFilter');
            const ageFilter = document.getElementById('ageFilter');
            const petCards = document.querySelectorAll('.pet-card');
            
            function filterPets() {
                const selectedSpecies = speciesFilter.value;
                const selectedAge = ageFilter.value;
                let visibleCount = 0;
                
                petCards.forEach(card => {
                    const species = card.getAttribute('data-species');
                    const age = parseInt(card.getAttribute('data-age'));
                    
                    let speciesMatch = selectedSpecies === '' || species === selectedSpecies;
                    let ageMatch = selectedAge === '' || checkAgeRange(age, selectedAge);
                    
                    if (speciesMatch && ageMatch) {
                        card.style.display = 'block';
                        visibleCount++;
                    } else {
                        card.style.display = 'none';
                    }
                });
                
                document.getElementById('petsCount').textContent = visibleCount;
            }
            
            function checkAgeRange(age, range) {
                switch(range) {
                    case '0-1': return age >= 0 && age <= 1;
                    case '1-3': return age >= 1 && age <= 3;
                    case '4-7': return age >= 4 && age <= 7;
                    case '8+': return age >= 8;
                    default: return true;
                }
            }
            
            speciesFilter.addEventListener('change', filterPets);
            ageFilter.addEventListener('change', filterPets);
            
            // Initialize count
            filterPets();
        });

        // Close modal when clicking outside
        window.onclick = function(event) {
            const modal = document.getElementById('adoptionModal');
            if (event.target === modal) {
                closeAdoptionForm();
            }
        }

        // Close modal with Escape key
        document.addEventListener('keydown', function(event) {
            if (event.key === 'Escape') {
                closeAdoptionForm();
            }
        });
    </script>
</body>
</html>