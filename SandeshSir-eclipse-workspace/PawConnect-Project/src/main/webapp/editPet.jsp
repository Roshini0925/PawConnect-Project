<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.servlet.adoption.dao.*" %>
<%@ page import="com.servlet.adoption.model.Pets" %>

<%
    int petId = Integer.parseInt(request.getParameter("petId"));
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
<title>Edit Pet</title>
<style>
body {
    font-family: Poppins, sans-serif;
    background: #F8F7FF;
}
.form-container {
    width: 420px;
    margin: 50px auto;
    background: white;
    padding: 25px;
    border-radius: 12px;
    box-shadow: 0 10px 25px rgba(0,0,0,0.1);
}
h2 {
    text-align: center;
    color: #8B5FBF;
}
input, select {
    width: 100%;
    padding: 10px;
    margin: 10px 0;
}
button {
    width: 100%;
    padding: 12px;
    background: #8B5FBF;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}
</style>
</head>

<body>

<div class="form-container">
<h2>Edit Pet</h2>

<form action="updatePet" method="post">

    <input type="hidden" name="petId" value="<%= pet.getPet_Id() %>">

    <input type="text" name="petName" value="<%= pet.getPetName() %>" required>

    <input type="text" name="species" value="<%= pet.getSpecies() %>" required>

    <input type="number" name="age" value="<%= pet.getAge() %>" required>

    <select name="gender">
        <option <%= pet.getGender().equals("Male")?"selected":"" %>>Male</option>
        <option <%= pet.getGender().equals("Female")?"selected":"" %>>Female</option>
    </select>

    <input type="text" name="location" value="<%= pet.getLocation() %>" required>

    <input type="text" name="imageUrl" value="<%= pet.getImageUrl() %>" required>

    <button type="submit">Update Pet</button>

</form>
</div>

</body>
</html>