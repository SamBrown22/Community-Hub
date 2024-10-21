package com.group22.hub;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;


@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity http) throws Exception{
        http
            //Sets certain authorities for each page
            .authorizeRequests()

                //Permits all users with any roles access to these URL's
                .antMatchers("/","/about","/signup","/addUser","/validateUser", "/forgotPassword", "/changePassword", "/simulator", "/simulate", "/images/**").permitAll()
                .antMatchers("/home","/profile", "/communityHub","/FundingOpportunities","/events","/search").hasRole("USER")
                .anyRequest().authenticated()
                .and()

            //If it requires permissions take to the formLogin
            .formLogin()

                //URL for Login form
                .loginPage("/login")

                //Gives everyone access
                .permitAll()

                .and()
            .logout()
                .permitAll()
                .and()
            .httpBasic();
    }
    @Autowired
    private UserDetailsService userDetailsService;

    //Responsible for configuring authentication with a custom method to get user credentials (userdetailsservice) and password encoder
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
    }

    //Creates a Password encoder using BCrypt encoding
    @Bean
    public PasswordEncoder passwordEncoder(){return new BCryptPasswordEncoder();}
}
