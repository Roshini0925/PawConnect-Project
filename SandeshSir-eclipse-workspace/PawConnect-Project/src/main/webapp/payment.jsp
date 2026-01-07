<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Payment</title>

<style>
body {
    font-family: Arial, sans-serif;
    background: #f4f6f8;
    padding: 30px;
}
.container {
    max-width: 800px;
    margin: auto;
    background: #ffffff;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 6px 18px rgba(0,0,0,0.1);
}
h2 { text-align: center; }
.payment-option {
    padding: 15px;
    border: 1px solid #ddd;
    border-radius: 6px;
    margin-bottom: 10px;
}
.payment-form { display: none; margin-top: 15px; }
.btn {
    padding: 12px;
    font-size: 16px;
    border: none;
    cursor: pointer;
    border-radius: 5px;
    margin-top: 10px;
}
.pay-btn { background: #28a745; color: white; }
.cancel-btn { background: #6c757d; color: white; }
.do-pay-btn { background: #007bff; color: white; }
.summary {
    background: #f8f9fa;
    padding: 15px;
    border-radius: 6px;
    margin-bottom: 20px;
}
</style>
</head>

<body>
<%
    String email = (String) session.getAttribute("email");

    if (email == null) {
        // Not logged in → redirect to login
        response.sendRedirect("login.jsp?redirect=payment.jsp");
        return;
    }
%>
<p><strong>Your EmailID:</strong> <%= email %></p>
<div class="container">
    <h2>💳 Payment</h2>

    <div class="summary">
        <p><b>Order ID:</b> <%=request.getParameter("orderId")%></p>
        <p><b>Amount:</b> ₹<%=request.getParameter("amount")%></p>
        
    </div>

    <h3>Select Payment Method</h3>

    <!-- UPI -->
    <div class="payment-option">
        <input type="radio" name="payment"
               onclick="selectMode('UPI','upi')"> UPI
        <div id="upi" class="payment-form">
            <input type="text" placeholder="example@upi">
            <button class="btn do-pay-btn" onclick="completePayment()">Pay Now</button>
        </div>
    </div>

    <!-- QR -->
    <div class="payment-option">
        <input type="radio" name="payment"
               onclick="selectMode('QR','qr')"> QR Code
        <div id="qr" class="payment-form" style="text-align:center">
            <img id="qrImg" width="200">
            <button class="btn do-pay-btn" onclick="completePayment()">Pay Now</button>
        </div>
    </div>

    <!-- Card -->
    <div class="payment-option">
        <input type="radio" name="payment"
               onclick="selectMode('CARD','card')"> Card
        <div id="card" class="payment-form">
            <input type="text" placeholder="Card Number">
            <input type="month">
            <input type="password" placeholder="CVV">
            <button class="btn do-pay-btn" onclick="completePayment()">Pay Now</button>
        </div>
    </div>

    <!-- COD -->
    <div class="payment-option">
        <input type="radio" name="payment"
               onclick="selectMode('COD','cod')"> Cash on Delivery
        <div id="cod" class="payment-form">
            <p>No payment required now.</p>
        </div>
    </div>
<form id="paymentForm" action="orderSuccess" method="post">
<input type="hidden" name="orderId" id="orderId">
    <input type="hidden" name="amount" id="amount">
    <button type="submit" id="confirmBtn" class="btn pay-btn"
        onclick="confirmOrder()" disabled>
    Confirm Order
</button>
<button class="btn cancel-btn" onclick="cancel()">Cancel</button>
</form>
</div>

<script>
let selectedMode = "";
let paymentDone = false;

const amount = "<%=request.getParameter("amount")%>";
const confirmBtn = document.getElementById("confirmBtn");

function hideAll() {
    document.querySelectorAll(".payment-form")
        .forEach(f => f.style.display = "none");
}

function selectMode(mode, id) {
    hideAll();
    selectedMode = mode;

    // COD: enable immediately
    if (mode === "COD") {
        paymentDone = true;
        confirmBtn.disabled = false;
    } else {
        paymentDone = false;
        confirmBtn.disabled = true;
    }

    document.getElementById(id).style.display = "block";

    // Generate QR dynamically
    if (mode === "QR") {
        const upiUrl =
            `upi://pay?pa=demo@upi&pn=PetStore&am=${amount}&cu=INR`;

        document.getElementById("qrImg").src =
            "https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=" +
            encodeURIComponent(upiUrl);
    }
}

function completePayment() {
    alert("Payment completed successfully ✅");
    paymentDone = true;
    confirmBtn.disabled = false;
}

function confirmOrder() {
    if (!paymentDone) {
        alert("Please complete payment first");
        return;
    }

    const params = new URLSearchParams(window.location.search);
    const orderId = params.get("orderId");
    const amount = params.get("amount");
    document.getElementById("orderId").value = orderId;
    document.getElementById("amount").value = amount;
   
    document.getElementById("paymentForm").submit();
    window.location.href =
        "orderSuccess.jsp?orderId=" + orderId +
        "&amount=" + amount +
        "&selectMode=" + selectedMode +
        "&email=<%= email %>";
}

function cancel() {
    window.location.href = "products";
}
</script>


</body>
</html>