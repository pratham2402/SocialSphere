package DAO;

import models.Comment;
import models.CommentWithUsername;
import utils.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAOImpl implements CommentDAO {
    @Override
    public int createComment(Comment comment) {
        int rows = 0;
        try {
            Connection conn = DBUtil.getConnection();
            String sql = "INSERT INTO COMMENTS (COMMENT_CONTENT, POST_ID, USER_ID) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, comment.getCommentContent());
            ps.setInt(2, comment.getPostId());
            ps.setInt(3, comment.getUserId());
            rows = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rows;
    }

    @Override
    public List<CommentWithUsername> viewAllCommentsByPostId(int postId) {
        List<CommentWithUsername> comments = new ArrayList<>();
        try {
            Connection conn = DBUtil.getConnection();
            String sql = "SELECT c.COMMENT_CONTENT, c.POST_ID, c.USER_ID, u.USERNAME FROM COMMENTS c JOIN USERS u ON c.USER_ID = u.USER_ID WHERE c.POST_ID = ? ORDER BY c.COMMENT_ID ASC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, postId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String commentContent = rs.getString("COMMENT_CONTENT");
                int userId = rs.getInt("USER_ID");
                String username = rs.getString("USERNAME");
                comments.add(new CommentWithUsername(commentContent, postId, userId, username));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }
}
