<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Enter OTP</title>
</head>
<body>

<h2>OTP Sent! Enter OTP Below:</h2>

<form action="ValidateOTP" method="post">
    OTP: <input type="text" name="otpValue" required />
    <button type="submit">Verify OTP</button>
</form>

</body>
</html>