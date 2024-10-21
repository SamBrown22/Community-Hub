package com.group22.hub.Controller;

import com.group22.hub.Model.User;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;


//Controller to Handle Account Access including Logging in and out
@Controller
public class AccessController {

    // autowired user repository from the database
    @Autowired
    private UserRepository user_repo;

    //autowired Custom userDetailService
    @Autowired
    private UserDetailsService userDetailsService;

    //autowired custom password encoder
    @Autowired
    private PasswordEncoder passwordEncoder;

    // Validates user details during login
    @PostMapping("/validateUser")
    public String validateUserDetails(@Valid @ModelAttribute User user, BindingResult result, Model model) {
        //Checks Validator for valid inputs
        if (result.hasErrors()){
            return "login";
        }
        //Gets userDetails username, password and gives a "USER" authority stores in userDetails
        UserDetails userDetails = userDetailsService.loadUserByUsername(user.getUserName());

        //Checks if Raw password is equal to the encoded password stored in the database
        if (!passwordEncoder.matches(user.getPassword(), userDetails.getPassword())){
            model.addAttribute("message", "Incorrect username or Password");
            return "login";
        }
        //Creates new authentication storing UserDetails and grants authority "USER"
        Authentication auth = new UsernamePasswordAuthenticationToken(userDetails,null,userDetails.getAuthorities());

        //Sets Authentication
        SecurityContextHolder.getContext().setAuthentication(auth);

        //Checks if User is Authenticated
        if (auth.isAuthenticated()){
            return "redirect:/home";
        }
        return "login";
    }

    @GetMapping ("/logout")
    public String logout(HttpServletRequest request, HttpServletResponse response){
        //Gets authentication
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        //Removes authentication if not null
        if (auth != null){
            new SecurityContextLogoutHandler().logout(request, response, auth);
        }
        //Redirects to the login form
        return "redirect:/login";
    }

    @RequestMapping("/forgotPassword")
    public String forgotPassword(Model model){
        model.addAttribute("user", new User());
        return "forgot-password";
    }

    @PostMapping("/changePassword")
    public  String changePassword(@ModelAttribute User user){
        try{
            User existingUser = user_repo.findUserByUserName(user.getUserName());
            System.out.println("User username: " + user.getUserName());
            System.out.println("Existing username: " + existingUser.getUserName());
            System.out.println("User email: " + user.getEmail());
            System.out.println("Existing email: " + existingUser.getEmail());

            if (user.getUserName().equals(existingUser.getUserName()) && user.getEmail().equals(existingUser.getEmail())) {
                System.out.println("Details match");
                existingUser.setPassword(passwordEncoder.encode(user.getPassword()));
                user_repo.save(existingUser);
                return "redirect:/login";
            } else {
                System.out.println("Details dont match");
                return "redirect:/forgotPassword";
            }
        }catch(NullPointerException e){
            return "redirect:/forgotPassword";
        }
    }

    @InitBinder
    protected void initbinder(WebDataBinder binder){binder.addValidators(new UserLoginValidator(user_repo, passwordEncoder)); }

}
