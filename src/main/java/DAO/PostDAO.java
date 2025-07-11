package DAO;

import models.Post;
import models.PostWithUsername;

import java.util.List;

public interface PostDAO {
    boolean createPost(Post post);
    List<PostWithUsername> viewAllPosts();
}
