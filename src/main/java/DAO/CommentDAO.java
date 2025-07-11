package DAO;

import models.Comment;
import models.CommentWithUsername;

import java.util.List;

public interface CommentDAO {
    int createComment(Comment comment);
    List<CommentWithUsername> viewAllCommentsByPostId(int postId);
    int getCommentCountByPostId(int postId);
}
