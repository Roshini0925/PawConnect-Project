/**
 * 
 */// Hero Image Slider
let currentSlide = 0;
const slides = document.querySelectorAll('.slide');
const totalSlides = slides.length;

function showSlide(n) {
    slides.forEach(slide => slide.classList.remove('active'));
    currentSlide = (n + totalSlides) % totalSlides;
    slides[currentSlide].classList.add('active');
}

function nextSlide() {
    showSlide(currentSlide + 1);
}

// Change slide every 3 seconds
setInterval(nextSlide, 3000);

// Reviews Data
const reviews = [
    {
        id: 1,
        text: "Paw Connect helped me find my perfect companion! The process was smooth and the support amazing.",
        author: "Sarah Johnson",
        initial: "S"
    },
    {
        id: 2,
        text: "I adopted two beautiful cats through this platform. Best decision ever!",
        author: "Mike Chen",
        initial: "M"
    },
    {
        id: 3,
        text: "The team at Paw Connect is incredibly supportive. They made our adoption journey wonderful.",
        author: "Priya Patel",
        initial: "P"
    },
    {
        id: 4,
        text: "Found our family dog here! The matching process was perfect for our lifestyle.",
        author: "David Brown",
        initial: "D"
    },
    {
        id: 5,
        text: "Amazing platform! The vet support after adoption is exceptional.",
        author: "Lisa Wang",
        initial: "L"
    },
    {
        id: 6,
        text: "Adopted a senior dog and it's been the most rewarding experience. Thank you Paw Connect!",
        author: "Robert Garcia",
        initial: "R"
    },
    {
        id: 7,
        text: "The community here is wonderful. So many caring people helping animals find homes.",
        author: "Emily Davis",
        initial: "E"
    },
    {
        id: 8,
        text: "Professional, caring, and efficient. Everything you want in an adoption service.",
        author: "James Wilson",
        initial: "J"
    },
    {
        id: 9,
        text: "My new kitten has brought so much joy to my life. Thank you for making it possible!",
        author: "Maria Rodriguez",
        initial: "M"
    },
    {
        id: 10,
        text: "Outstanding service from start to finish. Highly recommend Paw Connect to everyone!",
        author: "Thomas Taylor",
        initial: "T"
    }
];

// Pets Data
const pets = [
    {
        name: "Cleo",
        type: "cat",
        breed: "Bengal",
        age: "4 years",
        gender: "Female",
        location: "Lucknow",
        image: "images/cleo.jpg"
    },
    {
        name: "Rio",
        type: "bird", 
        breed: "Parrot",
        age: "2 years",
        gender: "Male",
        location: "Bangalore",
        image: "images/rio.jpg"
    },
    {
        name: "Buddy",
        type: "dog",
        breed: "Labrador Mix",
        age: "2 years", 
        gender: "Male",
        location: "Mumbai",
        image: "images/buddy.jpg"
    },
    {
        name: "Max",
        type: "dog",
        breed: "Golden Retriever",
        age: "1 year",
        gender: "Male",
        location: "Bangalore",
        image: "images/max.jpg"
    },
    {
        name: "Luna",
        type: "cat",
        breed: "Siamese",
        age: "3 years",
        gender: "Female",
        location: "Delhi",
        image: "images/luna.jpg"
    },
    {
        name: "Charlie",
        type: "dog",
        breed: "German Shepherd",
        age: "5 years",
        gender: "Male",
        location: "Mumbai",
        image: "images/charlie.jpg"
    }
];

// Initialize when page loads
document.addEventListener('DOMContentLoaded', function() {
    displayPets(pets);
    displayReviews();
    startReviewSlider();
});

// Display Pets
function displayPets(petsArray) {
    const petsGrid = document.getElementById('petsGrid');
    petsGrid.innerHTML = '';

    petsArray.forEach(pet => {
        const petCard = `
            <div class="pet-card">
                <div class="pet-image">
                    ${pet.image ? `<img src="${pet.image}" alt="${pet.name}" style="width:100%;height:100%;object-fit:cover;">` : '[Image: ' + pet.name + ']'}
                </div>
                <div class="pet-info">
                    <div class="pet-name">${pet.name}</div>
                    <span class="pet-type">${pet.type.charAt(0).toUpperCase() + pet.type.slice(1)}</span>
                    <div class="pet-details">
                        <div class="pet-detail"><strong>Breed:</strong> ${pet.breed}</div>
                        <div class="pet-detail"><strong>Age:</strong> ${pet.age}</div>
                        <div class="pet-detail"><strong>Gender:</strong> ${pet.gender}</div>
                    </div>
                    <div class="pet-location">${pet.location}</div>
                    <button class="adopt-btn" onclick="adoptPet('${pet.name}')">Adopt Me</button>
                </div>
            </div>
        `;
        petsGrid.innerHTML += petCard;
    });
}

// Display Reviews
function displayReviews() {
    const reviewsContainer = document.getElementById('reviewsContainer');
    reviewsContainer.innerHTML = '';

    reviews.forEach(review => {
        const reviewCard = `
            <div class="review-card">
                <div class="review-avatar">${review.initial}</div>
                <p class="review-text">"${review.text}"</p>
                <div class="review-author">- ${review.author}</div>
            </div>
        `;
        reviewsContainer.innerHTML += reviewCard;
    });
}

// Review Slider
let currentReview = 0;
const reviewCards = document.querySelectorAll('.review-card');

function startReviewSlider() {
    setInterval(() => {
        const reviewsContainer = document.getElementById('reviewsContainer');
        currentReview = (currentReview + 1) % reviews.length;
        reviewsContainer.style.transform = `translateX(-${currentReview * 100}%)`;
    }, 4000); // Change every 4 seconds
}

// Search and Filter Functions
function searchPets() {
    const searchTerm = document.getElementById('searchInput').value.toLowerCase();
    const filteredPets = pets.filter(pet => 
        pet.name.toLowerCase().includes(searchTerm) ||
        pet.breed.toLowerCase().includes(searchTerm) ||
        pet.location.toLowerCase().includes(searchTerm)
    );
    displayPets(filteredPets);
}

function filterPets() {
    const speciesFilter = document.getElementById('speciesFilter').value;
    const ageFilter = document.getElementById('ageFilter').value;
    const genderFilter = document.getElementById('genderFilter').value;
    const locationFilter = document.getElementById('locationFilter').value;

    const filteredPets = pets.filter(pet => {
        return (!speciesFilter || pet.type === speciesFilter) &&
               (!genderFilter || pet.gender.toLowerCase() === genderFilter) &&
               (!locationFilter || pet.location.toLowerCase() === locationFilter);
    });
    
    displayPets(filteredPets);
}

function adoptPet(petName) {
    alert(`Thank you for your interest in adopting ${petName}! We will contact you soon.`);
}                       this is script.js