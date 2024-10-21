package com.group22.hub.Controller;

import com.group22.hub.Model.User;
import com.group22.hub.Repo.UserRepository;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class UserCreationValidator implements Validator{

    private UserRepository user_repo;
    UserCreationValidator(UserRepository user_repo){
        this.user_repo=user_repo;
    }

    @Override
    public boolean supports(Class<?> clazz) {
        return User.class.equals(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        //Checks no field is empty
        ValidationUtils.rejectIfEmpty(errors,"firstName","","Must enter a first name !");
        ValidationUtils.rejectIfEmpty(errors,"lastName","","Must enter a last name !");
        ValidationUtils.rejectIfEmpty(errors,"email","","Must enter a email !");
        ValidationUtils.rejectIfEmpty(errors,"userName","","Must enter a username !");
        ValidationUtils.rejectIfEmpty(errors,"password","","Must enter a password !");

        User user = (User) target;

        //Checks if username is unique
        if (!user.getUserName().isEmpty()){
            for(User x : user_repo.findAll()){
                if (x.getUserName() .equals(user.getUserName())){
                    errors.rejectValue("userName","","Username is already being used. Please try another !");
                }
            }
         }

        //Checks if email is unique
        if (!user.getEmail().isEmpty()){
            for (User x : user_repo.findAll()){
                if (x.getEmail().equals(user.getEmail())){
                    errors.rejectValue("email","","Email already in use !");
                }
            }
        }

    }
}
