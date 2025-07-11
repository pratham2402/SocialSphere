package servlets;

import DAO.UserDAO;
import DAO.UserDAOImpl;
import DAO.PostDAO;
import DAO.PostDAOImpl;
import DAO.CommentDAO;
import DAO.CommentDAOImpl;
import models.User;
import models.Post;
import models.PostWithUsername;
import models.CommentWithUsername;
import models.Comment;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.HashMap;

@WebServlet("/ControllerServlet")
public class ControllerServlet extends HttpServlet {
    private UserDAO userDAO = new UserDAOImpl();
    private PostDAO postDAO = new PostDAOImpl();
    private CommentDAO commentDAO = new CommentDAOImpl();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) action = "viewPosts";
        switch (action) {
            case "login": {
                String username = request.getParameter("username");
                String password = request.getParameter("password");
                User user = new User(username, password);
                if (userDAO.login(user)) {
                    session.setAttribute("user", user);
                    response.sendRedirect("ControllerServlet");
                } else {
                    request.setAttribute("error", "User is not registered. Please register first.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
                break;
            }
            case "register": {
                String username = request.getParameter("username");
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                User user = new User(username, email, password);
                int regResult = userDAO.register(user);
                if (regResult == 0) {
                    session.setAttribute("user", user);
                    response.sendRedirect("ControllerServlet");
                } else if (regResult == 1) {
                    request.setAttribute("error", "Username already exists. Please choose another.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else if (regResult == 2) {
                    request.setAttribute("error", "Email already exists. Please use another email.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Registration failed due to a server error. Please try again.");
                    request.getRequestDispatcher("register.jsp").forward(request, response);
                }
                break;
            }
            case "createPost": {
                User user = (User) session.getAttribute("user");
                if (user == null) {
                    response.sendRedirect("login.jsp");
                    break;
                }
                String postTitle = request.getParameter("postTitle");
                String postContent = request.getParameter("postContent");
                int userId = userDAO.getUserIdByUsername(user.getUsername());
                Post post = new Post(postTitle, postContent, userId);
                postDAO.createPost(post);
                setPostsAndComments(request);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
            case "createComment": {
                User user = (User) session.getAttribute("user");
                if (user == null) {
                    response.sendRedirect("login.jsp");
                    break;
                }
                int postId = Integer.parseInt(request.getParameter("postId"));
                String commentContent = request.getParameter("commentContent");
                int userId = userDAO.getUserIdByUsername(user.getUsername());
                Comment comment = new Comment();
                comment.setCommentContent(commentContent);
                comment.setPostId(postId);
                comment.setUserId(userId);
                int rows = commentDAO.createComment(comment);
                if (rows > 0) {
                    session.setAttribute("commentMessage", "Comment added successfully!");
                    session.setAttribute("commentMessagePostId", postId);
                } else {
                    session.setAttribute("commentMessage", "Failed to add comment. Please try again.");
                    session.setAttribute("commentMessagePostId", postId);
                }
                response.sendRedirect("ControllerServlet#post-" + postId);
                break;
            }
            case "logout": {
                session.invalidate();
                response.sendRedirect("welcome.jsp");
                break;
            }
            case "viewPosts":
            default: {
                setPostsAndComments(request);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        HttpSession session = request.getSession();
        if (action == null) action = "viewPosts";
        switch (action) {
            case "login": {
                request.getRequestDispatcher("login.jsp").forward(request, response);
                break;
            }
            case "register": {
                request.getRequestDispatcher("register.jsp").forward(request, response);
                break;
            }
            case "viewPosts":
            default: {
                User user = (User) session.getAttribute("user");
                if (user == null) {
                    request.getRequestDispatcher("welcome.jsp").forward(request, response);
                    return;
                }
                setPostsAndComments(request);
                request.getRequestDispatcher("home.jsp").forward(request, response);
                break;
            }
        }
    }

    private void setPostsAndComments(HttpServletRequest request) {
        List<PostWithUsername> posts = postDAO.viewAllPosts();
        Map<Integer, List<CommentWithUsername>> commentsMap = new HashMap<>();
        Map<Integer, Integer> commentCountMap = new HashMap<>();
        for (PostWithUsername post : posts) {
            List<CommentWithUsername> comments = commentDAO.viewAllCommentsByPostId(post.getPostId());
            commentsMap.put(post.getPostId(), comments);
            commentCountMap.put(post.getPostId(), commentDAO.getCommentCountByPostId(post.getPostId()));
        }
        request.setAttribute("posts", posts);
        request.setAttribute("commentsMap", commentsMap);
        request.setAttribute("commentCountMap", commentCountMap);
    }

    private User getSessionUser(HttpSession session) {
        return (User) session.getAttribute("user");
    }
}
