<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<% 
String error = request.getParameter("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section class="auth-section">
        <div class="container">
            <div class="auth-form">
                <h2>Join PawConnect</h2>
                
                <% if("1".equals(error)) { %>
                    <div class="error-message" style="background: #ffebee; color: #c62828; padding: 10px; border-radius: 5px; margin-bottom: 20px; border: 1px solid #ffcdd2;">
                        Please fill all required fields correctly.
                    </div>
                <% } %>
                
                <form action="register" method="post">
                    <div class="form-group">
                        <label for="fullName">Full Name *</label>
                        <input type="text" id="fullName" name="fullName" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email *</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="phone">Phone *</label>
                        <input type="tel" id="phone" name="phone" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password *</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <div class="form-group">
                        <label for="confirmPassword">Confirm Password *</label>
                        <input type="password" id="confirmPassword" name="confirmPassword" required>
                    </div>
        
                    <button type="submit" class="btn btn-primary btn-full">Create Account</button>
                </form>
            	 
                <p class="auth-link">Already have an account? <a href="login.jsp">Login here</a></p>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
    
    <script>
        // Client-side password confirmation
        document.querySelector('form').addEventListener('submit', function(e) {
            const password = document.getElementById('password').value;
            const confirmPassword = document.getElementById('confirmPassword').value;
            
            if (password !== confirmPassword) {
                e.preventDefault();
                alert('Passwords do not match!');
                return false;
            }
            
            if (password.length < 6) {
                e.preventDefault();
                alert('Password must be at least 6 characters long!');
                return false;
            }
        });
       
    </script>
</body>
</html>