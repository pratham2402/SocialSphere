<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="models.User" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Home - SocialSphere</title>
    <style>
        body {
            background: #f4f6fb;
            font-family: 'Segoe UI', Arial, sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 700px;
            margin: 60px auto;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.10);
            padding: 36px 36px 28px 36px;
        }
        h1, h2, h3 {
            color: #2d3a4b;
        }
        h1 {
            text-align: center;
            margin-bottom: 18px;
        }
        h2 {
            margin-bottom: 18px;
        }
        .welcome {
            background: #e8f0fe;
            color: #2563eb;
            border-radius: 8px;
            padding: 12px 18px;
            margin-bottom: 18px;
            text-align: center;
            font-size: 17px;
        }
        form {
            margin-bottom: 0;
        }
        input[type="text"], input[type="password"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 15px;
            background: #f9fafb;
            transition: border 0.2s;
        }
        input[type="text"]:focus, input[type="password"]:focus, textarea:focus {
            border: 1.5px solid #4f8cff;
            outline: none;
        }
        button, input[type="submit"] {
            background: #4f8cff;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 10px 24px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background 0.2s;
            margin-top: 4px;
        }
        button:hover, input[type="submit"]:hover {
            background: #2563eb;
        }
        .post {
            border:1px solid #e5e7eb;
            margin:10px 0;
            padding:18px 16px 12px 16px;
            border-radius: 8px;
            background: #fafbfc;
            box-shadow: 0 2px 8px rgba(0,0,0,0.03);
        }
        .post h3 {
            margin:0 0 8px 0;
        }
        .post p {
            margin:0 0 8px 0;
        }
        .post .meta {
            font-size:13px;
            color:#555;
            margin-bottom:5px;
        }
        .post .comments {
            margin-top:15px;
            padding-left:0;
        }
        ul {
            list-style-type:none;
            padding-left:0;
        }
        li {
            margin-bottom:6px;
            border-bottom:1px solid #eee;
            padding-bottom:4px;
        }
        .no-comments {
            color:#888;
        }
        .comment-message {
            color: #2563eb;
            margin-bottom: 10px;
        }
        @media (max-width: 800px) {
            .container {
                max-width: 98vw;
                padding: 12px 4vw;
            }
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
    <h1>Welcome to SocialSphere</h1>
    <div class="welcome">
        Hello, <b><%= user.getUsername() %></b>!<br>
        You have successfully logged in.
    </div>
    <div style="margin: 20px 0; text-align: center;">
        <form action="createpost.jsp" method="get" style="display:inline;">
            <button type="submit">Create Post</button>
        </form>
        <form action="ControllerServlet" method="post" style="display:inline; margin-left: 10px;">
            <input type="hidden" name="action" value="logout" />
            <button type="submit">Logout</button>
        </form>
    </div>
    <h2>All Posts</h2>
    <div>
        <%
            List<models.PostWithUsername> posts = (List<models.PostWithUsername>) request.getAttribute("posts");
            int postCount = (posts == null) ? 0 : posts.size();
            Map<Integer, Integer> commentCountMap = (Map<Integer, Integer>) request.getAttribute("commentCountMap");
        %>
        <div style="margin-bottom:10px; font-weight:bold;">Total Posts: <%= postCount %></div>
        <% if (postCount == 0) { %>
            <p>No posts yet.</p>
        <% } else {
                for (models.PostWithUsername post : posts) {
        %>
            <div class="post">
                <a id="post-<%= post.getPostId() %>"></a>
                <h3><%= post.getPostTitle() %></h3>
                <p><%= post.getPostContent() %></p>
                <div class="meta">Posted by <b><%= post.getUsername() %></b> on <%= post.getTimestamp() %></div>
                <div class="meta" style="margin-bottom:5px;">
                    Total Comments: <%= commentCountMap.get(post.getPostId()) %>
                </div>
                <div class="comments">
                    <b>Comments:</b>

                    <form action="ControllerServlet" method="post" style="margin-top:8px; margin-bottom:12px;">
                        <input type="hidden" name="action" value="createComment" />
                        <input type="hidden" name="postId" value="<%= post.getPostId() %>" />
                        <input type="text" name="commentContent" placeholder="Write a comment..." required style="width:70%;" />
                        <button type="submit">Comment</button>
                    </form>
                    <% String commentMessage = (String) session.getAttribute("commentMessage");
                       Integer commentMessagePostId = (Integer) session.getAttribute("commentMessagePostId");
                       if (commentMessage != null && commentMessagePostId != null && post.getPostId() == commentMessagePostId) {
                            session.removeAttribute("commentMessage");
                            session.removeAttribute("commentMessagePostId");
                    %>
                        <div class="comment-message">
                            <%= commentMessage %>
                        </div>
                    <% } %>
                    <ul>
                        <%
                            Map<Integer, List<models.CommentWithUsername>> commentsMap = (Map<Integer, List<models.CommentWithUsername>>) request.getAttribute("commentsMap");
                            List<models.CommentWithUsername> comments = (commentsMap != null) ? commentsMap.get(post.getPostId()) : null;
                            if (comments != null && !comments.isEmpty()) {
                                for (models.CommentWithUsername comment : comments) {
                        %>
                        <li>
                            <b><%= comment.getUsername() %>:</b> <%= comment.getCommentContent() %>
                        </li>
                        <%      }
                            } else { %>
                        <li class="no-comments">No comments yet.</li>
                        <% } %>
                    </ul>
                </div>
                <!-- Comments Section End -->
            </div>
        <%
                }
            }
        %>
    </div>
</div>
</body>
</html>
