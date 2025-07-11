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
        .container { max-width: 600px; margin: 40px auto; }
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
            java.util.List posts = (java.util.List) request.getAttribute("posts");
            int postCount = (posts == null) ? 0 : posts.size();
            Map commentCountMap = (Map) request.getAttribute("commentCountMap");
        %>
        <div style="margin-bottom:10px; font-weight:bold;">Total Posts: <%= postCount %></div>
        <% if (postCount == 0) { %>
            <p>No posts yet.</p>
        <% } else {
                for (Object obj : posts) {
                    models.PostWithUsername post = (models.PostWithUsername) obj;
        %>
            <div style="border:1px solid #ddd; margin:10px 0; padding:10px;">
                <a id="post-<%= post.getPostId() %>"></a>
                <h3 style="margin:0 0 8px 0;"><%= post.getPostTitle() %></h3>
                <p style="margin:0 0 8px 0;"><%= post.getPostContent() %></p>
                <div style="font-size:13px;">Posted by <b><%= post.getUsername() %></b> on <%= post.getTimestamp() %></div>
                <div style="font-size:13px; color:#555; margin-bottom:5px;">
                    Total Comments: <%= commentCountMap.get(post.getPostId()) %>
                </div>
                <div style="margin-top:15px; padding-left:0;">
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
                        <div style="color: <%= commentMessage.contains("successfully") ? "green" : "red" %>; margin-bottom: 10px;">
                            <%= commentMessage %>
                        </div>
                    <% } %>
                    <ul style="list-style-type:none; padding-left:0;">
                        <%
                            Map<Integer, List> commentsMap = (Map<Integer, java.util.List>) request.getAttribute("commentsMap");
                            java.util.List comments = (commentsMap != null) ? commentsMap.get(post.getPostId()) : null;
                            if (comments != null && !comments.isEmpty()) {
                                for (Object cObj : comments) {
                                    models.CommentWithUsername comment = (models.CommentWithUsername) cObj;
                        %>
                        <li style="margin-bottom:6px; border-bottom:1px solid #eee; padding-bottom:4px;">
                            <b><%= comment.getUsername() %>:</b> <%= comment.getCommentContent() %>
                        </li>
                        <%      }
                            } else { %>
                        <li style="color:#888;">No comments yet.</li>
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
