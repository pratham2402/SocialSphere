<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post - SocialSphere</title>
    <style>
        .container { max-width: 500px; margin: 40px auto; }
    </style>
</head>
<body>
<%
    User user = (User) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<div class="container">
    <a href="ControllerServlet?action=viewPosts">&larr; Back to Home</a>
    <h2>Create a New Post</h2>
    <form action="ControllerServlet" method="post">
        <input type="hidden" name="action" value="createPost" />
        <label for="postTitle">Title:</label>
        <input type="text" id="postTitle" name="postTitle" required />
        <label for="postContent">Content:</label>
        <textarea id="postContent" name="postContent" required></textarea>
        <input type="submit" value="Post" />
    </form>
</div>
</body>
</html>
