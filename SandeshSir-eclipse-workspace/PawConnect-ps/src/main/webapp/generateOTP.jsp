<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>OTP Login</title>
</head>
<body>

<h2>Login Using OTP</h2>

<form action="GenerateOTP" method="post">
    Enter Email / Phone: 
    <input type="text" name="userId" required />
    <button type="submit">Send OTP</button>
</form>

</body>
</html>