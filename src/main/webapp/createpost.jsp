<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Create Post - SocialSphere</title>
    <style>
        body {
            background: #f4f6fb;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 500px;
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
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 18px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 15px;
            background: #f9fafb;
            transition: border 0.2s;
        }
        input[type="text"]:focus, textarea:focus {
            border: 1.5px solid #4f8cff;
            outline: none;
        }
        textarea {
            min-height: 100px;
            resize: vertical;
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
        a {
            color: #4f8cff;
            text-decoration: none;
            font-size: 15px;
            display: inline-block;
            margin-bottom: 18px;
        }
        a:hover {
            text-decoration: underline;
        }
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
