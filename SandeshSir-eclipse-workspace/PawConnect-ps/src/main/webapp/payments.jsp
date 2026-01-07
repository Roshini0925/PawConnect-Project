<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Order Success</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}
.card {
    background: #ffffff;
    padding: 35px;
    border-radius: 12px;
    width: 520px;
    text-align: center;
    box-shadow: 0 10px 25px rgba(0,0,0,0.15);
}
.check {
    font-size: 65px;
    color: #28a745;
}
h2 {
    margin: 10px 0;
}
.info {
    background: #f8f9fa;
    padding: 15px;
    margin: 15px 0;
    border-radius: 6px;
    text-align: left;
}
.status {
    display: flex;
    justify-content: space-between;
    margin: 20px 0;
}
.step {
    width: 25%;
    font-size: 13px;
}
.active {
    color: #28a745;
    font-weight: bold;
}
.btn {
    padding: 12px 18px;
    font-size: 15px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin: 8px;
}
.home-btn {
    background: #007bff;
    color: white;
}
.invoice-btn {
    background: #28a745;
    color: white;
}
.track-btn {
    background: #6c757d;
    color: white;
}
</style>
</head>

<body>

<div class="card" id="invoice">
    <div class="check">✔</div>
    <h2>Order Placed Successfully</h2>
    <p>Thank you for your purchase 🐾</p>

    <div class="info">
        <p><b>Order ID:</b> <span id="orderId"></span></p>
<p><b>Amount Paid:</b> ₹<span id="amount"></span></p>
    </div>

    <!-- Order Tracking -->
    <div class="status">
        <div class="step active">Ordered</div>
        <div class="step">Packed</div>
        <div class="step">Shipped</div>
        <div class="step">Delivered</div>
    </div>

    <div>
        <button class="btn home-btn" onclick="goHome()">Continue Shopping</button>
        <button class="btn invoice-btn" onclick="downloadInvoice()">Download Invoice</button>
        <button class="btn track-btn" onclick="trackOrder()">Track Order</button>
    </div>
</div>

<script>
// Read data from URL
const params = new URLSearchParams(window.location.search);
document.getElementById("orderId").innerText =
    params.get("orderId") || "N/A";

document.getElementById("amount").innerText =
    params.get("amount") || "0";
// Clear cart after success
sessionStorage.removeItem("cart");

function goHome() {
    window.location.href = "products";
}

// Invoice (Print as PDF)
function downloadInvoice() {
    window.print();
}

// Tracking simulation
function trackOrder() {
    alert(
        "Order Status:\n\n" +
        "✔ Ordered\n" +
        "⏳ Packed\n" +
        "⏳ Shipped\n" +
        "⏳ Delivered"
    );
}
</script>

</body>
</html>