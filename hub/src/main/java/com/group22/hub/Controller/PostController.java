package com.group22.hub.Controller;

import com.group22.hub.Model.Comment;
import com.group22.hub.Model.Post;
import com.group22.hub.Repo.CommentRepository;
import com.group22.hub.Repo.PostRepository;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import java.security.Principal;


@Controller
public class PostController {

    // public post controller.
    @Autowired
    private PostRepository post_repo;

    //user database
    @Autowired
    private UserRepository user_repo;

    @Autowired
    private CommentRepository comment_repo;

    //Returns the communityHub page
    @RequestMapping("/communityHub")
    public String CommunityHubView(Model model){
        model.addAttribute("post_repo", post_repo);
        model.addAttribute("postcontent", new Post());
        model.addAttribute("comment", new Comment());
        return "CommunityHub";
    }

    //Submits the Post form
    @PostMapping("/submitPost")
    private String postSubmission(@ModelAttribute("postcontent") Post postContent, Principal principal){
        //Gets user that wrote the post by accessing token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Sets the user of the post
        postContent.setUser(user_repo.findUserByUserName(userDetails.getUsername()));

        //Saves the post
        post_repo.save(postContent);

        //returns to the community hub page
        return "redirect:/communityHub";
    }

    //Submits the Post in the profile
    @PostMapping("/submitPostProfile")
    private String profilePostSubmission(@ModelAttribute("postcontent") Post postContent, Principal principal){
        //Gets user that wrote the post by accessing token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Sets the user of the post
        postContent.setUser(user_repo.findUserByUserName(userDetails.getUsername()));

        //Saves the post
        post_repo.save(postContent);

        //Returns to the profile
        return "redirect:/profile";
    }

    //Submits the Comment form in the community hub
    @PostMapping("/submitComment")
    private String commentSubmission(@ModelAttribute("comment")Comment comment,@RequestParam("postID") Integer postID, Principal principal){
        //Gets the user who wrote the comment by accessing token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Finds the post the comment was submitted under
        Post post = post_repo.findPostById(postID);

        //Sets the user of the comment
        comment.setUser(user_repo.findUserByUserName(userDetails.getUsername()));

        //Sets the post of the comment
        comment.setPost(post);

        //Saves the comment
        comment_repo.save(comment);

        //returns to community hub
        return "redirect:/communityHub";
    }

    //Submits the comment form in the profile
    @PostMapping("/submitCommentProfile")
    private String profileCommentSubmission(@ModelAttribute("comment")Comment comment,@RequestParam("postID") Integer postID, Principal principal){
        //Gets the user who wrote the comment by accessing token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Finds the post the comment was submitted under
        Post post = post_repo.findPostById(postID);

        //Sets the user of the comment
        comment.setUser(user_repo.findUserByUserName(userDetails.getUsername()));

        //Sets the post of the comment
        comment.setPost(post);

        //Saves the comment
        comment_repo.save(comment);

        //Returns to user profile
        return "redirect:/profile";
    }

    // gets the auth user details
    private UserDetails getUserAuthenticationToken(Authentication principal) {
        return (UserDetails) principal.getPrincipal();
    }



}
