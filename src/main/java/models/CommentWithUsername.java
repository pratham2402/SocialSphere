package models;

public class CommentWithUsername {
    private final String commentContent;
    private final int postId;
    private final int userId;
    private final String username;

    public CommentWithUsername(String commentContent, int postId, int userId, String username) {
        this.commentContent = commentContent;
        this.postId = postId;
        this.userId = userId;
        this.username = username;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public int getPostId() {
        return postId;
    }

    public int getUserId() {
        return userId;
    }

    public String getUsername() {
        return username;
    }
}

