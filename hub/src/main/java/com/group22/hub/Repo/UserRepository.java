package com.group22.hub.Repo;

import com.group22.hub.Model.User;
import org.springframework.data.repository.CrudRepository;

//Creates a repository to interact with the database
public interface UserRepository extends CrudRepository<User, Integer> {
    //Allows for repo to find by username
    User findUserByUserName(String userName);

}
