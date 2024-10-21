package com.group22.hub.Controller;

import com.group22.hub.Model.Comment;
import com.group22.hub.Model.Post;
import com.group22.hub.Model.User;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;

//Controller to handle Account including Creation and Updating
@Controller
public class AccountController {

    //autowires user repository from the database
    @Autowired
    private UserRepository user_repo;

    //autowires password encoder
    @Autowired
    private PasswordEncoder passwordEncoder;

    //creates a binder to relate to user creation validator
    @InitBinder("user")
    protected void initbinderUser(WebDataBinder binder){binder.addValidators(new UserCreationValidator(user_repo));}

    //creates a binder to relate to update validator
    @InitBinder("newuser")
    protected void initbinderUpdateUser(WebDataBinder binder){binder.addValidators(new UserUpdateValidator(user_repo));}

    // adds a user to the database
    @PostMapping("/addUser")
    public String addUser(@Valid @ModelAttribute User user, BindingResult result) {
        if (result.hasErrors()){
            return "sign-up";
        }
        // adds the hashed password to the instance of the user
        user.setPassword(passwordEncoder.encode(user.getPassword()));

        //Sets a default profile picture
        user.setProfile_picture("001-user-11.png");

        //Sets a default bio for each user
        user.setBio("My name is " + user.getFirstName() + " " + user.getLastName());

        // saves the repo to the database and redirects the user to the account created page
        user_repo.save(user);

        return "redirect:login";
    }

    //Returns the Users profile
    @RequestMapping("/profile")
    public String profile(Model model, Principal principal){
        //Gets the userDetails that is stored with the authentication token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);
        User user = user_repo.findUserByUserName(userDetails.getUsername());

        model.addAttribute("user", user);
        model.addAttribute("postcontent", new Post());
        model.addAttribute("comment", new Comment());

        return "profile";
    }
    //Shows the jsp form allowing for updating profile details
    @RequestMapping("/profile-edit")
    public String profileEdit(Principal principal, Model model){
        //Gets the userDetails that is stored with the authentication token
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Gets user of token and stores in user
        User user = user_repo.findUserByUserName(userDetails.getUsername());

        //Adds user info for placeholder as well as a new user to model
        model.addAttribute("user", user);
        model.addAttribute("newuser", new User());
        return "profile-edit";
    }

    //submits a form and changes the details
    @PostMapping("/changeDetails")
    private String changeUserDetails(@Valid @ModelAttribute("newuser") User newUser,BindingResult result, Principal principal, Model model) {
        // gets the authentication token with the user details
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Creates a user which is the user who has submitted the changes but without the changes made
        User unchanged_user = user_repo.findUserByUserName(userDetails.getUsername());

        //Checks Update Validator to see for errors
        if (result.hasErrors()){
            model.addAttribute("user", unchanged_user);
            return "profile-edit";
        }

        //Checks to see if any changes were made to any fields
        //If change is made will set the users details to the new details
        if (!newUser.getFirstName().equals("")){
        unchanged_user.setFirstName(newUser.getFirstName());
        }
        if (!newUser.getUserName().equals("")) {
            unchanged_user.setUserName(newUser.getUserName());
        }
        if(!newUser.getLastName().equals("")) {
            unchanged_user.setLastName(newUser.getLastName());
        }
        if(!newUser.getPassword().equals("")) {
            unchanged_user.setPassword(passwordEncoder.encode(newUser.getPassword()));
        }
        if(!newUser.getBio().equals("")){
            unchanged_user.setBio(newUser.getBio());
        }
        //Checks to see if either the username or password is changed, so it can save user and log out
        if(!newUser.getPassword().equals("") || !newUser.getUserName().equals("")){
            user_repo.save(unchanged_user);
            return "redirect:/logout";
        }
        //If username or passsword isn't changed saves user and returns to profile
        user_repo.save(unchanged_user);
        return "redirect:/profile";
    }

    //Returns the avatar selection url
    @RequestMapping("profile-edit-avatar")
    public String avatarselect(Model model, Principal principal){
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);
        User user = user_repo.findUserByUserName(userDetails.getUsername());
        model.addAttribute("user", user);
        return "AvatarSelect";
    }

    //Submits the profile avatar change
    @PostMapping("/changeAvatar")
    public String changeavatar(@ModelAttribute User user, Principal principal){
        //Gets the user who accessed the page
        UserDetails userDetails = getUserAuthenticationToken((Authentication) principal);

        //Finds user in the database from username
        User unchanged_user = user_repo.findUserByUserName(userDetails.getUsername());

        //Sets profile picture to the profile picture set by the user
        unchanged_user.setProfile_picture(user.getProfile_picture());

        //Saves it in the database
        user_repo.save(unchanged_user);
        return "redirect:/profile";
    }

    // gets the auth user details
    private UserDetails getUserAuthenticationToken(Authentication principal) {
        return (UserDetails) principal.getPrincipal();
    }
}
