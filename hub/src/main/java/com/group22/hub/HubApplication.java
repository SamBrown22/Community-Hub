package com.group22.hub;

import com.group22.hub.Repo.CommentRepository;
import com.group22.hub.Repo.PostRepository;
import com.group22.hub.Repo.UserRepository;
import com.group22.hub.Service.ReverseCompute;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.security.crypto.password.PasswordEncoder;

import java.util.List;

@SpringBootApplication()
public class HubApplication implements ApplicationRunner {

    //Assigns the repository to the application
    @Autowired
    private UserRepository user_repo;

    // Assigns the post repository to the application
    @Autowired
    private PostRepository post_repo;

    @Autowired
    private CommentRepository comment_repo;

    public static void main(String[] args) {
        SpringApplication.run(HubApplication.class, args);
    }

    @Autowired
    private PasswordEncoder passwordEncoder;

    @Override
    public void run(ApplicationArguments args) throws Exception {

        //Test Database Run
//        User user = new User();
//        user.setUserName("TestUser");
//        user.setFirstName("Test");
//        user.setLastName("User");
//        user.setPassword(passwordEncoder.encode("Test"));
//        user.setEmail("testingusers@icloud.com");
//        user.setBio("My name is Test User");
//        user.setProfile_picture("001-user-11.png");
//        user_repo.save(user);
    }

}
