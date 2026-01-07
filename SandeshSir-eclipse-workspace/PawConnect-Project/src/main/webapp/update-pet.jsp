<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.servlet.adoption.dao.*" %>
<%@ page import="com.servlet.adoption.model.Pets" %>

<%
    String id = request.getParameter("petId");
    if (id == null) {
        response.sendRedirect("viewPets");
        return;
    }

    int petId = Integer.parseInt(id);
    PetDAO dao = new PetDAOImpl();
    Pets pet = dao.getPetById(petId);

    if (pet == null) {
        response.sendRedirect("viewPets");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>
<title>Update Pet</title>

<style>
body {
    font-family: Poppins, sans-serif;
    background: #F8F7FF;
}

.form-box {
    width: 450px;
    margin: 60px auto;
    background: #ffffff;
    padding: 30px;
    border-radius: 14px;
    box-shadow: 0 12px 28px rgba(0,0,0,0.15);
}

h2 {
    text-align: center;
    color: #8B5FBF;
    margin-bottom: 25px;
}

label {
    font-weight: 500;
}

input, select {
    width: 100%;
    padding: 10px;
    margin: 8px 0 18px;
    border-radius: 6px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 12px;
    background: #8B5FBF;
    color: #fff;
    border: none;
    border-radius: 6px;
    font-size: 15px;
    cursor: pointer;
}

button:hover {
    background: #7347b8;
}

img {
    width: 100%;
    height: 180px;
    object-fit: cover;
    border-radius: 10px;
    margin-bottom: 15px;
}
</style>
</head>

<body>

<div class="form-box">
    <h2>Edit Pet Details</h2>

    <form action="updatePet" method="post">

        <input type="hidden" name="petId" value="<%= pet.getPet_Id() %>">

        <label>Pet Name</label>
        <input type="text" name="petName" value="<%= pet.getPetName() %>" required>

        <label>Species</label>
        <input type="text" name="species" value="<%= pet.getSpecies() %>" required>

        <label>Breed</label>
        <input type="text" name="breed" value="<%= pet.getBreed() %>" required>
        
        <label>Age</label>
        <input type="number" name="age" value="<%= pet.getAge() %>" required>

        <label>Gender</label>
        <select name="gender">
            <option value="Male" <%= pet.getGender().equals("Male") ? "selected" : "" %>>Male</option>
            <option value="Female" <%= pet.getGender().equals("Female") ? "selected" : "" %>>Female</option>
        </select>

        <label>Location</label>
        <input type="text" name="location" value="<%= pet.getLocation() %>" required>

        <label>Image URL</label>
        <input type="text" name="imageUrl" value="<%= pet.getImageUrl() %>" required>

        <img src="<%= pet.getImageUrl() %>" alt="Pet Image">

        <button type="submit">Update Pet</button>

    </form>
</div>

</body>
</html>