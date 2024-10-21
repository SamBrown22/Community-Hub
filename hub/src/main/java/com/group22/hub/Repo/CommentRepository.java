package com.group22.hub.Repo;

import com.group22.hub.Model.Comment;
import org.springframework.data.repository.CrudRepository;

public interface CommentRepository extends CrudRepository<Comment, Integer> {
}
