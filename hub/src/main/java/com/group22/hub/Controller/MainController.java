package com.group22.hub.Controller;

import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import com.group22.hub.Model.User;


//Controller to Request Mappings to Main Webpages
@Controller
public class MainController {

    @Autowired
    private UserRepository User_database;

    //Returns Home page on open
    @RequestMapping(value = "/")
    public String index(Model model){
        model.addAttribute("user_repo", User_database);
        return "home";}

    //Returns Logged-in home page
    @RequestMapping("/home")
    public String loginsuccessful(Model model){
        model.addAttribute("user_repo", User_database);
        return "home-logged-in";
    }

    //Returns the Login page to allow users to access their accounts
    @RequestMapping("/login")
    public String login(Model model) {
        model.addAttribute("user", new User());
        return "login";
    }

    //Returns the signup page to allow users to create accounts
    @RequestMapping("/signup")
    public String newUser(Model model){
        model.addAttribute("user", new User());
        return "sign-up";
    }


    //Returns the about page
    @RequestMapping("/about")
    public String aboutpage(){
        return "about";
    }

    @RequestMapping("/user-about")
    public String aboutPageLoggedIn(){
        return "about-logged-in";
    }
}
