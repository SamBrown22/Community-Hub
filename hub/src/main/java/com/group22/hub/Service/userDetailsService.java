package com.group22.hub.Service;

import com.group22.hub.Model.User;
import com.group22.hub.Repo.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class userDetailsService implements UserDetailsService {
    //autowires repo which has access to the database
    @Autowired
    private UserRepository repo;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        //Gets the user from the database
        User user = repo.findUserByUserName(username);

        //Creates a list of authorities and assigns the user with the user authority
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        authorities.add(new SimpleGrantedAuthority("ROLE_USER"));

        //Returns username, password and "USER" authority
        return new org.springframework.security.core.userdetails.User(user.getUserName(), user.getPassword(), true,
                true, true, true, authorities);

    }
}
