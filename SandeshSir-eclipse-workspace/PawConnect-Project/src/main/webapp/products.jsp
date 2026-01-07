<%@page import="java.util.List"%>
<%@page import="com.servlet.adoption.model.Product"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pet Products</title>

<style>
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

/* ===== RESET ===== */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

/* ===== BODY ===== */
body {
    font-family: Arial, sans-serif;
    background: var(--gradient-light);
    color: var(--text);
    min-height: 100vh;
    display: flex;
    flex-direction: column;
}

/* ===== HEADER ===== */
header {
    background: var(--primary);
    color: var(--light);
    padding: 15px 40px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

header h1 {
    font-size: 22px;
}

header a {
    color: var(--light);
    text-decoration: none;
    font-weight: bold;
}

/* ===== MAIN ===== */
main {
    flex: 1;
    padding: 30px 40px;
}

/* ===== GRID ===== */
.grid {
    display: flex;
    flex-wrap: wrap;
    gap: 25px;
    justify-content: center;
}

/* ===== CARD ===== */
.card {
    width: 220px;
    background: var(--light);
    padding: 15px;
    border-radius: 10px;
    text-align: center;
    box-shadow: 0 4px 10px rgba(0,0,0,0.1);
}

.card img {
    width: 100%;
    height: 150px;
    object-fit: contain;
    margin-bottom: 10px;
}

.card h4 {
    margin: 8px 0;
    color: var(--dark);
}

/* ===== QUANTITY ===== */
.qty-box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;
    margin: 10px 0;
}

.qty-btn {
    width: 30px;
    height: 30px;
    font-size: 18px;
    background: var(--secondary);
    color: var(--light);
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

.qty {
    font-size: 16px;
    min-width: 20px;
}

/* ===== BUTTON ===== */
.cart-btn {
    background: var(--accent);
    color: var(--light);
    border: none;
    padding: 8px;
    width: 100%;
    border-radius: 5px;
    cursor: pointer;
}

.cart-btn:hover {
    background: var(--secondary);
}

/* ===== TOTAL ===== */
.total {
    font-weight: bold;
    margin: 5px 0 10px;
}

/* ===== FOOTER ===== */
footer {
    background: var(--dark);
    color: var(--light);
    text-align: center;
    padding: 12px;
    font-size: 14px;
}
</style>
</head>

<body>

<!-- ===== HEADER ===== -->
<header>
    <h1>PawConnect – Pet Products</h1>
    <div>
    <a href="cart.jsp">🛒 View Cart</a><br><br>
    <a href="index.jsp"> Back To Home</a>
    </div>
</header>

<!-- ===== MAIN CONTENT ===== -->
<main>
<div class="grid">

<%
List<Product> list = (List<Product>) request.getAttribute("products");

if (list != null && !list.isEmpty()) {
    int index = 0;
    for (Product p : list) {
%>

<div class="card">
    <img src="<%=p.getImageUrl()%>">
    <h4><%=p.getProductName()%></h4>
    <p>Price: ₹<span id="price-<%=index%>"><%=p.getPrice()%></span></p>

    <div class="qty-box">
        <button class="qty-btn" onclick="changeQty(<%=index%>, -1)">−</button>
        <span class="qty" id="qty-<%=index%>">0</span>
        <button class="qty-btn" onclick="changeQty(<%=index%>, 1)">+</button>
    </div>

    <p class="total">Total: ₹<span id="total-<%=index%>">0</span></p>

    <button class="cart-btn"
        onclick="addToCart('<%=p.getProductName()%>', <%=p.getPrice()%>, <%=index%>)">
        Add to Cart
    </button>
</div>

<%
        index++;
    }
} else {
%>
<h3>No products found</h3>
<%
}
%>

</div>
</main>

<!-- ===== FOOTER ===== -->
<footer>
    © 2025 PawConnect | All Rights Reserved
</footer>

<script>
function changeQty(index, change) {
    let qtyEl = document.getElementById("qty-" + index);
    let price = parseFloat(document.getElementById("price-" + index).innerText);
    let totalEl = document.getElementById("total-" + index);

    let qty = parseInt(qtyEl.innerText) + change;
    if (qty < 0) qty = 0;

    qtyEl.innerText = qty;
    totalEl.innerText = (qty * price).toFixed(2);
}

function addToCart(name, price, index) {
    let qty = parseInt(document.getElementById("qty-" + index).innerText);

    if (qty === 0) {
        alert("Please select quantity");
        return;
    }

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    cart.push({
        name: name,
        price: price,
        quantity: qty,
        total: qty * price
    });

    sessionStorage.setItem("cart", JSON.stringify(cart));
    window.location.href = "cart.jsp";
}
</script>

</body>
</html>