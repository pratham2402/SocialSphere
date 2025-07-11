package models;

public class Post {
    String postTitle;
    String postContent;
    int userId;

    public Post() {}

    public Post(String postTitle, String postContent, int userId) {
        this.postTitle = postTitle;
        this.postContent = postContent;
        this.userId = userId;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public String getPostContent() {
        return postContent;
    }

    public void setPostContent(String postContent) {
        this.postContent = postContent;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
}
