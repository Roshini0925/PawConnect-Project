<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Pet Supplies Delivery - PawConnect</title>

    <!-- Font Awesome -->
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        h2 {
            text-align: center;
            margin: 30px 0;
        }

        /* Category buttons */
        .category-bar {
            text-align: center;
            margin-bottom: 25px;
        }

        .category-bar button {
            margin: 5px;
            padding: 8px 18px;
            border: none;
            border-radius: 20px;
            cursor: pointer;
            background: #ddd;
        }

        .category-bar button.active,
        .category-bar button:hover {
            background: #ff7b00;
            color: #fff;
        }

        /* Product grid */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 20px;
            padding: 0 30px 40px;
        }

        .product-card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.1);
            overflow: hidden;
            text-align: center;
            padding-bottom: 15px;
        }

        .product-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .product-info {
            padding: 15px;
        }

        .product-info h3 {
            margin: 8px 0;
        }

        .product-desc {
            font-size: 14px;
            color: #666;
        }

        .price {
            font-size: 18px;
            font-weight: bold;
            margin: 10px 0;
            color: #28a745;
        }

        /* Quantity controls */
        .qty-controls {
            display: flex;
            justify-content: center;
            align-items: center;
            margin-bottom: 10px;
        }

        .qty-controls button {
            width: 30px;
            height: 30px;
            border: none;
            background: #ff7b00;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            border-radius: 5px;
        }

        .qty-controls input {
            width: 40px;
            text-align: center;
            border: 1px solid #ccc;
            margin: 0 8px;
            border-radius: 5px;
        }

        /* Add to cart */
        .add-btn {
            background: #007bff;
            color: #fff;
            border: none;
            padding: 8px 18px;
            border-radius: 20px;
            cursor: pointer;
        }

        .add-btn:hover {
            background: #0056b3;
        }
    </style>
</head>

<body>

<h2>🐾 Pet Supplies Delivery</h2>

<!-- Category Filter -->
<div class="category-bar">
    <button class="active" onclick="filterCategory('all')">All</button>
    <button onclick="filterCategory('food')">Food</button>
    <button onclick="filterCategory('toys')">Toys</button>
    <button onclick="filterCategory('health')">Health</button>
    <button onclick="filterCategory('accessories')">Accessories</button>
</div>

<!-- Products -->
<div class="products-grid">

    <c:forEach var="p" items="${productList}">
        <div class="product-card" data-category="${p.category}">
            <img src="${p.imageUrl}" alt="${p.name}">

            <div class="product-info">
                <h3>${p.name}</h3>
                <p class="product-desc">${p.description}</p>
                <div class="price">₹${p.price}</div>

                <!-- Quantity -->
                <div class="qty-controls">
                    <button onclick="decrement(${p.id})">−</button>
                    <input type="text" id="qty-${p.id}" value="1" readonly>
                    <button onclick="increment(${p.id})">+</button>
                </div>

                <!-- Add to Cart -->
                <button class="add-btn"
                        onclick="addToCart(${p.id}, '${p.name}', ${p.price})">
                    <i class="fa fa-cart-plus"></i> Add to Cart
                </button>
            </div>
        </div>
    </c:forEach>

</div>

<!-- JavaScript -->
<script>
    function increment(id) {
        let qty = document.getElementById("qty-" + id);
        qty.value = parseInt(qty.value) + 1;
    }

    function decrement(id) {
        let qty = document.getElementById("qty-" + id);
        if (parseInt(qty.value) > 1) {
            qty.value = parseInt(qty.value) - 1;
        }
    }

    function addToCart(id, name, price) {
        let qty = document.getElementById("qty-" + id).value;

        window.location.href =
            "AddToCartServlet?id=" + id +
            "&name=" + name +
            "&price=" + price +
            "&qty=" + qty;
    }

    function filterCategory(category) {
        let cards = document.querySelectorAll(".product-card");
        let buttons = document.querySelectorAll(".category-bar button");

        buttons.forEach(btn => btn.classList.remove("active"));
        event.target.classList.add("active");

        cards.forEach(card => {
            if (category === "all" || card.dataset.category === category) {
                card.style.display = "block";
            } else {
                card.style.display = "none";
            }
        });
    }
</script>

</body>
</html>
