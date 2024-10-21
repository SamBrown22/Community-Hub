package com.group22.hub.Repo;

import com.group22.hub.Model.Post;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

// creates a crud repository for the posts
public interface PostRepository extends CrudRepository<Post, Integer> {
    // find post by post id - every post will have a unique id
    Post findPostById(int postId);

    // find post by title
    Post findPostByTitle(String postTitle);

}
