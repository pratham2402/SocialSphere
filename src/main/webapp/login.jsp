<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login - SocialSphere</title>
    <style>
        .container { max-width: 400px; margin: 40px auto; }
    </style>
</head>
<body>
<div class="container">
    <h2>Login to SocialSphere</h2>
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
