package com.group22.hub.Controller;

import com.group22.hub.Model.User;
import com.group22.hub.Repo.UserRepository;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

//Validator to only check uniqueness and not empty fields
public class UserUpdateValidator implements Validator {

    private UserRepository user_repo;
    UserUpdateValidator(UserRepository user_repo){
        this.user_repo = user_repo;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        User user = (User) target;

        //Checks if username is unique
        if (!user.getUserName().isEmpty()){
            for(User x : user_repo.findAll()){
                if (x.getUserName() .equals(user.getUserName())){
                    errors.rejectValue("userName","","Username is already being used. Please try another !");
                }
            }
        }
    }
}
