<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to SocialSphere</title>
    <style>
        body {
            background: #f4f6fb;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 400px;
            margin: 60px auto;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 16px rgba(0,0,0,0.08);
            padding: 32px 28px 24px 28px;
        }
        h1 {
            text-align: center;
            color: #2d3a4b;
            margin-bottom: 24px;
        }
        .btn-group {
            display: flex;
            flex-direction: column;
            gap: 16px;
            margin-top: 30px;
        }
        button {
            background: #4f8cff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 12px 0;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s;
            width: 100%;
            letter-spacing: 0.5px;
        }
        button:hover {
            background: #2563eb;
        }
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
