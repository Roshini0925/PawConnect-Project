<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    padding: 30px;
}
.container {
    max-width: 900px;
    margin: auto;
    background: #ffffff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
}
h2 {
    text-align: center;
    margin-bottom: 25px;
}
table {
    width: 100%;
    border-collapse: collapse;
}
th, td {
    padding: 12px;
    text-align: center;
}
th {
    background: #343a40;
    color: white;
}
td {
    border-bottom: 1px solid #ddd;
}
.qty-btn {
    padding: 5px 10px;
    font-size: 14px;
    cursor: pointer;
}
.remove-btn {
    background: #dc3545;
    color: white;
    border: none;
    padding: 6px 10px;
    cursor: pointer;
}
.summary {
    text-align: right;
    margin-top: 20px;
    font-size: 18px;
}
.actions {
    display: flex;
    justify-content: space-between;
    margin-top: 25px;
}
.actions button {
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
}
.order-btn {
    background: #28a745;
    color: white;
}
.cancel-btn {
    background: #6c757d;
    color: white;
}
</style>
</head>

<body>

<div class="container">
    <h2>🛒 Your Cart</h2>

    <table id="cartTable">
        <thead>
            <tr>
                <th>Product</th>
                <th>Price (₹)</th>
                <th>Quantity</th>
                <th>Total (₹)</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody></tbody>
    </table>

    <div class="summary">
        <strong>Grand Total: ₹<span id="grandTotal">0</span></strong>
    </div>

    <div class="actions">
        <button class="cancel-btn" onclick="cancelCart()">Cancel</button>
        <button class="order-btn" onclick="placeOrder()">Place Order</button>
    </div>
</div>

<script>
let cart = JSON.parse(sessionStorage.getItem("cart")) || [];

function renderCart() {
    const tbody = document.querySelector("#cartTable tbody");
    tbody.innerHTML = "";
    let grandTotal = 0;

    if (cart.length === 0) {
        tbody.innerHTML =
            `<tr><td colspan="5"><b>Your cart is empty</b></td></tr>`;
        document.getElementById("grandTotal").innerText = 0;
        return;
    }

    cart.forEach((item, index) => {
        item.total = item.price * item.quantity;
        grandTotal += item.total;

        tbody.innerHTML += `
            <tr>
                <td>${item.name}</td>
                <td>${item.price}</td>
                <td>
                    <button class="qty-btn" onclick="updateQty(${index}, -1)">−</button>
                    ${item.quantity}
                    <button class="qty-btn" onclick="updateQty(${index}, 1)">+</button>
                </td>
                <td>${item.total}</td>
                <td>
                    <button class="remove-btn" onclick="removeItem(${index})">
                        Remove
                    </button>
                </td>
            </tr>
        `;
    });

    document.getElementById("grandTotal").innerText = grandTotal;
    sessionStorage.setItem("cart", JSON.stringify(cart));
}

function updateQty(index, change) {
    cart[index].quantity += change;
    if (cart[index].quantity < 1) {
        cart[index].quantity = 1;
    }
    renderCart();
}

function removeItem(index) {
    cart.splice(index, 1);
    renderCart();
}

function cancelCart() {
    if (confirm("Cancel entire cart?")) {
        sessionStorage.removeItem("cart");
        window.location.href = "products";
    }
}

function placeOrder() {
    if (cart.length === 0) {
        alert("Cart is empty!");
        return;
    }

    let total = cart.reduce((sum, i) => sum + i.total, 0);

    fetch("<%=request.getContextPath()%>/placeOrder", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ cart, total })
    })
    .then(res => {
        if (!res.ok) throw new Error("Server error");
        return res.json();
    })
    .then(data => {
        sessionStorage.removeItem("cart");
        window.location.href =
            "payments.jsp?orderId=" + data.orderId + "&amount=" + total;
    })
    .catch(err => {
        alert("Order failed");
        console.error(err);
    });
}

renderCart();
</script>

</body>
</html>