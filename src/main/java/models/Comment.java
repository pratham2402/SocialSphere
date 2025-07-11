package models;

public class Comment {
    String commentContent;
    int postId;
    int userId;

    public Comment() {

    }

    public Comment(int commentId, String commentContent, int postId, int userId) {
        this.commentContent = commentContent;
        this.postId = postId;
        this.userId = userId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public int getPostId() {
        return postId;
    }

    public void setPostId(int postId) {
        this.postId = postId;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
