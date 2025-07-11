<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to SocialSphere</title>
    <style>
        .container { max-width: 400px; margin: 60px auto; }
        .btn-group { display: flex; flex-direction: column; gap: 10px; margin-top: 30px; }
    </style>
</head>
<body>
<div class="container">
    <h1>Welcome to SocialSphere</h1>
    <div class="btn-group">
        <form action="login.jsp" method="get">
            <button type="submit" class="login-btn">Login</button>
        </form>
        <form action="register.jsp" method="get">
            <button type="submit" class="register-btn">Register</button>
        </form>
    </div>
</div>
</body>
</html>
