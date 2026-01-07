<%@page import="java.util.List"%>
<%@page import="com.servlet.adoption.model.Product"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Products</title>

<style>
body { font-family: Arial; background:#f4f6f8; 
       width:100%}
.grid { display:flex; flex-wrap:wrap; gap:20px; }
.card {
    width:220px; background:white; padding:15px;
    border-radius:8px; text-align:center;
    box-shadow:0 4px 10px rgba(0,0,0,0.1);
}
img { width:100%; height:150px; object-fit:contain; }
.qty-box {
    display:flex;
    justify-content:center;
    align-items:center;
    gap:10px;
    margin:10px 0;
}
.qty-btn {
    width:30px;
    height:30px;
    font-size:18px;
    background:#007bff;
    color:white;
    border:none;
    border-radius:5px;
    cursor:pointer;
}
.qty {
    font-size:16px;
    min-width:20px;
}
button.cart-btn {
    background:#28a745;
    color:white;
    border:none;
    padding:8px;
    width:100%;
    border-radius:5px;
}
.total {
    font-weight:bold;
    margin-top:5px;
}
</style>
</head>

<body>
<div>
<h2 align="center">Pet Products</h2>
<h2 align="right"><a href="cart.jsp">🛒 View Cart</a></h2>
<div>
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
    
    <!-- Quantity Controls -->
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

    let total = qty * price;
    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    cart.push({
        name: name,
        price: price,
        quantity: qty,
        total: total
    });

    sessionStorage.setItem("cart", JSON.stringify(cart));
    alert("Added to Cart");
}
function addToCart(name, price, index) {
    let qty = parseInt(document.getElementById("qty-" + index).innerText);

    if (qty === 0) {
        alert("Please select quantity");
        return;
    }

    let total = qty * price;

    let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

    cart.push({
        name: name,
        price: price,
        quantity: qty,
        total: total
    });

    sessionStorage.setItem("cart", JSON.stringify(cart));

    // ✅ Redirect to cart page
    window.location.href = "cart.jsp";
}

</script>

</body>
</html>