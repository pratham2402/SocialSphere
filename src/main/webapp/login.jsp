<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - SocialSphere</title>
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
        h2 {
            text-align: center;
            color: #2d3a4b;
            margin-bottom: 24px;
        }
        label {
            display: block;
            margin-bottom: 6px;
            color: #444;
            font-size: 15px;
        }
        input[type="text"], input[type="password"], input[type="email"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 15px;
            background: #f9fafb;
            transition: border 0.2s;
        }
        input[type="text"]:focus, input[type="password"]:focus, input[type="email"]:focus {
            border: 1.5px solid #4f8cff;
            outline: none;
        }
        input[type="submit"], button {
            background: #4f8cff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 10px 0;
            width: 100%;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
        }
        input[type="submit"]:hover, button:hover {
            background: #2563eb;
        }
        .error {
            color: #e53e3e;
            background: #fff0f0;
            border: 1px solid #e53e3e;
            border-radius: 6px;
            padding: 8px 12px;
            margin-bottom: 16px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Login to SocialSphere</h2>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>
    <form action="ControllerServlet" method="post">
        <input type="hidden" name="action" value="login" />
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required />
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />
        <input type="submit" value="Login" />
    </form>
</div>
</body>
</html>
