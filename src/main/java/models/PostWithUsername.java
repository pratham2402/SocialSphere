package models;

public class PostWithUsername {
    private int postId;
    private String postTitle;
    private String postContent;
    private int userId;
    private String username;
    private java.sql.Timestamp timestamp;

    public PostWithUsername() {}

    public PostWithUsername(int postId, String postTitle, String postContent, int userId, String username, java.sql.Timestamp timestamp) {
        this.postId = postId;
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.userId = userId;
        this.username = username;
        this.timestamp = timestamp;
    }

    public int getPostId() { return postId; }
    public void setPostId(int postId) { this.postId = postId; }
    public String getPostTitle() { return postTitle; }
    public void setPostTitle(String postTitle) { this.postTitle = postTitle; }
    public String getPostContent() { return postContent; }
    public void setPostContent(String postContent) { this.postContent = postContent; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public java.sql.Timestamp getTimestamp() { return timestamp; }
    public void setTimestamp(java.sql.Timestamp timestamp) { this.timestamp = timestamp; }
}
