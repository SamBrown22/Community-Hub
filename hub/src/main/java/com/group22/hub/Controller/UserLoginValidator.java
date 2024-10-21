package com.group22.hub.Controller;

import com.group22.hub.Model.User;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

public class UserLoginValidator implements Validator {
    private UserRepository user_repo;
    private PasswordEncoder passwordEncoder;

    //Constructor to assign password encoder and user_repo to the validators attributes
    @Autowired
    UserLoginValidator(UserRepository user_repo, PasswordEncoder passwordEncoder){
        this.user_repo = user_repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        //Checks that password and username are in database
        try {
            User userDetails = user_repo.findUserByUserName(user.getUserName());
            if (userDetails.getUserName().equals(user.getUserName())) {
                if (!passwordEncoder.matches(user.getPassword(), userDetails.getPassword())) {
                    errors.rejectValue("password", "", "Password is incorrect !");
                }
            }
        }
        catch (NullPointerException e) {
            errors.rejectValue("userName", "", "Username doesnt exist !");
        }
    }
}