<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
String redirectUrl = request.getParameter("redirect");
if(redirectUrl == null) {
    redirectUrl = "index.jsp";
}

String error = request.getParameter("error");
String registration = request.getParameter("registration");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - PawConnect</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <%@ include file="header.jsp" %>
    
    <section class="auth-section">
        <div class="container">
            <div class="auth-form">
                <h2>Login to PawConnect</h2>
                
                <% if("1".equals(error)) { %>
                    <div class="error-message" style="background: #ffebee; color: #c62828; padding: 10px; border-radius: 5px; margin-bottom: 20px; border: 1px solid #ffcdd2;">
                        Invalid email or password. Please try again.
                    </div>
                <% } %>
                
                <% if("success".equals(registration)) { %>
                    <div class="success-message" style="background: #e8f5e8; color: #2e7d32; padding: 10px; border-radius: 5px; margin-bottom: 20px; border: 1px solid #c8e6c9;">
                        Registration successful! Please login with your credentials.
                    </div>
                <% } %>
                
                <form action="login" method="post">
                    <input type="hidden" name="redirect" value="<%= redirectUrl %>">
                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-full">Login</button>
                </form>
                <p class="auth-link">Don't have an account? <a href="register.jsp">Register here</a></p>
            </div>
        </div>
    </section>

    <%@ include file="footer.jsp" %>
</body>
</html>
