<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Register - SocialSphere</title>
    <style>
        .container { max-width: 400px; margin: 40px auto; }
    </style>
</head>
<body>
<div class="container">
    <h2>Register for SocialSphere</h2>
    <% if (request.getAttribute("error") != null) { %>
        <div><%= request.getAttribute("error") %></div>
    <% } %>
    <form action="ControllerServlet" method="post">
        <input type="hidden" name="action" value="register" />
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required />
        <br>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required />
        <br>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required />
        <input type="submit" value="Register" />
    </form>
</div>
</body>
</html>
