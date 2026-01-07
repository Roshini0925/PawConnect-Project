<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.servlet.adoption.model.Pets" %>

<!DOCTYPE html>
<html>
<head>
    <title>All Pets - Admin</title>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #F8F7FF;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #8B5FBF;
            text-align: center;
            margin-bottom: 30px;
        }
        .card-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
        }
        .card {
            background: #FFFFFF;
            border-radius: 15px;
            padding: 20px;
            text-align: center;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
            border-top: 5px solid #8B5FBF;
            transition: transform 0.3s, box-shadow 0.3s;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 24px rgba(0,0,0,0.15);
        }
        .card img {
            width: 100%;
            height: 150px;
            object-fit: cover;
            border-radius: 10px;
            margin-bottom: 10px;
        }
        .card h3 {
            margin: 10px 0 5px;
            color: #4A4458;
        }
        .card p {
            color: #5D576B;
            font-size: 14px;
            margin: 3px 0;
        }
        .btn-group {
            margin-top: 12px;
            display: flex;
            justify-content: center;
            gap: 10px;
        }
        .btn {
            padding: 8px 14px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            color: white;
        }
        .edit-btn { background-color: #4CAF50; }
        .delete-btn { background-color: #FF4B5C; }
        .no-pets {
            text-align: center;
            color: #FF6B6B;
            font-size: 18px;
            margin-top: 50px;
        }
    </style>
</head>

<body>

<h1>All Pets - Admin</h1>
<%
    List<Pets> pets = (List<Pets>) request.getAttribute("pets");
%>
<div class="card-container">

<%
    if (pets != null && !pets.isEmpty()) {
        for (Pets p : pets) {
%>

    <div class="card">
    <form action="viewPets" method="get">
        <img src="<%= p.getImageUrl() %>" alt="<%= p.getPetName() %>">

        <h3><%= p.getPetName() %></h3>
        <p>Type: <%= p.getSpecies() %></p>
        <p>Age: <%= p.getAge() %> years</p>
        <p>Gender: <%= p.getGender() %></p>
        <p>Location: <%= p.getLocation() %></p>
   </form>
        <div class="btn-group">

            <!-- Edit -->
            <form action="editPet.jsp" method="get">
                <input type="hidden" name="petId" value="<%= p.getPet_Id() %>">
                <button type="submit" class="btn edit-btn">
                    <i class="fa-solid fa-pen"></i> Edit
                </button>
            </form>

            <!-- Delete -->
            <form action="deletePet" method="post"
                  onsubmit="return confirm('Are you sure you want to delete this pet?');">
                <input type="hidden" name="petId" value="<%= p.getPet_Id() %>">
                <button type="submit" class="btn delete-btn">
                    <i class="fa-solid fa-trash"></i> Delete
                </button>
            </form>

        </div>
    </div>

<%
  }
    } else {
%>
    <div class="no-pets">
        <i class="fa-solid fa-paw"></i> No pets found
    </div>

<%
    }
%>
</div>

</body>
</html>
