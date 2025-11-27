<%@page import="com.servlet.adoption.model.Pets"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.servlet.adoption.controller.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pet Adoption</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f2f2f2;
        }
      /* Modal Background */
.modal {
    display: none;
    position: fixed;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow-y: auto;           /* IMPORTANT */
    background: rgba(0,0,0,0.6);
    padding-top: 40px; 
    
             /* Space from top */
}

/* Modal Box */
.modal-content {
    background: #fff;
    width: 50%;                 /* Bigger width */
    margin: auto;
    padding: 25px;
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(0,0,0,0.4);
}

/* Close button */
.close {
    float: right;
    font-size: 28px;
    cursor: pointer;
}

/* Form fields */
input, textarea {
    width: 100%;
    padding: 12px;
    margin-top: 10px;
    border-radius: 5px;
    border: 1px solid #999;
    font-size: 15px;
}
      
        .container {
            width: 70%;
            margin: auto;
        }
        h1 {
            text-align: center;
            margin: 20px 0;
        }
        .pet-card {
            display: inline-block;
            width: 280px;
            background: #fff;
            padding: 15px;
            border-radius: 10px;
            margin: 15px;
            box-shadow: 0px 2px 6px rgba(0,0,0,0.2);
            text-align: center;
        }
        .pet-card img {
            width: 100%;
            height: 180px;
            border-radius: 8px;
            object-fit: cover;
        }
        .btn {
            background: #ff6600;
            padding: 10px 18px;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
            margin-top: 10px;
        }
        .btn:hover {
            background: #e65c00;
        }

        /* Modal CSS */
        .modal {
            display: none;
            position: fixed;
            left: 0;
            top: 0;
            width: 90%;
            height: 100%;
            background: rgba(0,0,0,0.5);
        }
        .modal-content {
            background: #fff;
            width: 35%;
            margin: 8% auto;
            padding: 20px;
            border-radius: 10px;
        }
        .close {
            float: right;
            font-size: 24px;
            cursor: pointer;
        }
        input, textarea {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
    </style>
    <script>
    function openAdoptionForm(id, name) {
        document.getElementById("petId").value = id;
        document.getElementById("petName").value = name;
        document.getElementById("adoptionModal").style.display = "block";
    }
        function closeAdoptionForm() {
            document.getElementById("adoptionModal").style.display = "none";
        }
    </script>
</head>
<body>
<div class="container">
    <h1>Adopt a Pet</h1>
    <%
        // Assuming pet list is coming from servlet
        List<Pets> petList = (List<Pets>) request.getAttribute("petList");
        if (petList != null) {
            for (Pets p : petList) {
    %>
        <div class="pet-card">
            <img src="<%= p.getImageUrl() %>" alt="Pet Image">
            <h3><%= p.getName() %></h3>
            <p>Breed: <%= p.getBreed() %></p>
            <p>Age: <%= p.getAge() %> years</p>

            <button class="btn" onclick="openAdoptionForm('<%= p.getId() %>')">Adopt Me</button>
        </div>
    <% 
            }
        } else {
    %>
        <p>No pets found.</p>
    <% } %>
<!-- Adoption Form Modal -->
<form action="AdoptServlet" method="post">
    <input type="hidden" id="petId" name="petId">
    <input type="hidden" id="petName" name="petName">

    <label>Your Name:</label>
    <input type="text" name="fullName" required>

    <label>Email:</label>
    <input type="email" name="email" required>

    <label>Contact Number:</label>
    <input type="text" name="phone" required>

    <label>Address:</label>
    <textarea name="address" rows="3" required></textarea>

    <label>Why do you want to adopt?</label>
    <textarea name="message" rows="3" required></textarea>

    <button type="submit" class="btn"
        style="margin-top: 15px; width: 100%;">Submit Application</button>
</form>

    </div>
</div>

</div>
</body>
</html>
