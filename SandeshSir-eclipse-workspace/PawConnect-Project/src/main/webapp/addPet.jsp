<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Pet - PawConnect</title>

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 50%;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
            margin-top: 5px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #3498db;
            color: white;
            border: none;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
        }

        button:hover {
            background: #2980b9;
        }

        .back-link {
            text-align: center;
            margin-top: 15px;
        }

        .back-link a {
            text-decoration: none;
            color: #555;
        }
    </style>
</head>

<body>

    <div class="container">
        <h2>Add New Pet</h2>

<form action="AddPets" method="post" enctype="multipart/form-data">

            <div class="form-group">
                <label>Pet Name</label>
                <input type="text" name="name" required>
            </div>

            <div class="form-group">
                <label>Type</label>
                <select name="type" required>
                    <option value="Dog">Dog</option>
                    <option value="Cat">Cat</option>
                    <option value="Bird">Bird</option>
                    <option value="Other">Other</option>
                </select>
            </div>

            <div class="form-group">
                <label>Breed</label>
                <input type="text" name="breed" required>
            </div>

            <div class="form-group">
                <label>Age (in years)</label>
                <input type="number" name="age" min="0" required>
            </div>
            <div class="form-group">
             <label>Gender</label>
             <select name="gender" required>
             <option value="Male">Male</option>
             <option value="Female">Female</option>
             <option value="Unknown">Unknown</option>
             </select>
             </div>
            
             <div class="form-group">
              <label>Upload Image</label>
             <input type="file" name="imageUrl" accept="image/*" required>
               </div>
            <div class="form-group">
                <label>📍Location</label>
           <textarea name="location" rows="4" required></textarea>
                <p class="pet-location"> </p>
                
             </div>
            <button type="submit">Add Pet</button>

            <p class="back-link">
                <a href="adminDashboard.jsp">← Back to Dashboard</a>
            </p>

        </form>
    </div>
</body>
</html>