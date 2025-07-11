package DAO;

import models.Post;
import models.PostWithUsername;
import utils.DBUtil;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PostDAOImpl implements PostDAO {
    @Override
    public boolean createPost(Post post) {
        String sql = "INSERT INTO POSTS (POST_TITLE, POST_CONTENT, USER_ID) VALUES (?, ?, ?)";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, post.getPostTitle());
            ps.setString(2, post.getPostContent());
            ps.setInt(3, post.getUserId());
            ps.executeUpdate();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public List<PostWithUsername> viewAllPosts() {
        List<PostWithUsername> posts = new ArrayList<>();
        String sql = "SELECT p.POST_ID, p.POST_TITLE, p.POST_CONTENT, p.USER_ID, u.USERNAME, p.TIMESTAMP FROM POSTS p JOIN USERS u ON p.USER_ID = u.USER_ID ORDER BY p.TIMESTAMP DESC";
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                PostWithUsername post = new PostWithUsername();
                post.setPostId(rs.getInt("POST_ID"));
                post.setPostTitle(rs.getString("POST_TITLE"));
                post.setPostContent(rs.getString("POST_CONTENT"));
                post.setUserId(rs.getInt("USER_ID"));
                post.setUsername(rs.getString("USERNAME"));
                post.setTimestamp(rs.getTimestamp("TIMESTAMP"));
                posts.add(post);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return posts;
    }
}
