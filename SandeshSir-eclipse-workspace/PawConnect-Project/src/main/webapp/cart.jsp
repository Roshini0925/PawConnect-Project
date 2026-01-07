<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Cart</title>

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
}

body {
    font-family: Arial, sans-serif;
    background: var(--gradient-light);
    color: var(--text);
    padding: 30px;
}

.container {
    max-width: 900px;
    margin: auto;
    background: var(--light);
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
}

h2 {
    text-align: center;
    margin-bottom: 25px;
    color: var(--primary);
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
    background: var(--dark);
    color: var(--light);
}

td {
    border-bottom: 1px solid #ddd;
}

.qty-btn {
    padding: 5px 10px;
    font-size: 14px;
    cursor: pointer;
    background: var(--secondary);
    color: var(--light);
    border: none;
    border-radius: 5px;
}

.qty-btn:hover {
    background: var(--primary);
}

.remove-btn {
    background: #dc3545;
    color: var(--light);
    border: none;
    padding: 6px 10px;
    cursor: pointer;
    border-radius: 5px;
}

.remove-btn:hover {
    background: #b02a37;
}

.summary {
    text-align: right;
    margin-top: 20px;
    font-size: 18px;
    color: var(--dark);
}

.actions {
    display: flex;
    justify-content: space-between;
    margin-top: 25px;
    flex-wrap: wrap;
    gap: 10px;
}

.actions button {
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    flex: 1;
}

.order-btn {
    background: var(--accent);
    color: var(--light);
}

.order-btn:hover {
    background: var(--secondary);
}

.cancel-btn {
    background: var(--dark);
    color: var(--light);
}

.cancel-btn:hover {
    background: #343a40;
}

/* ===== RESPONSIVE ===== */
@media (max-width: 768px) {
    table, thead, tbody, th, td, tr {
        display: block;
        width: 100%;
    }

    thead tr {
        display: none;
    }

    tbody tr {
        background: var(--light);
        margin-bottom: 15px;
        padding: 15px;
        border-radius: 10px;
        box-shadow: 0 4px 10px rgba(0,0,0,0.05);
    }

    td {
        text-align: left;
        padding: 8px 0;
        border: none;
        display: flex;
        justify-content: space-between;
    }

    td::before {
        content: attr(data-label);
        font-weight: bold;
        color: var(--text);
    }

    .qty-btn {
        padding: 5px 8px;
    }

    .actions {
        flex-direction: column;
    }
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
                <td data-label="Product">${item.name}</td>
                <td data-label="Price">${item.price}</td>
                <td data-label="Quantity">
                    <button class="qty-btn" onclick="updateQty(${index}, -1)">−</button>
                    ${item.quantity}
                    <button class="qty-btn" onclick="updateQty(${index}, 1)">+</button>
                </td>
                <td data-label="Total">${item.total}</td>
                <td data-label="Action">
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
            "payment.jsp?orderId=" + data.orderId + "&amount=" + total;
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