package com.project.StageRentalCarSpringMVC.service;

import com.project.StageRentalCarSpringMVC.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    @Transactional
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {



        if(username == null || username==""){
            throw new UsernameNotFoundException("Inserisci qualcosa");
        }

        User user = userService.getByUsername(username);
        //System.out.println(user.getRole());

        if (user==null){
            throw new UsernameNotFoundException("NO UTENTE FOUND");
        }

        org.springframework.security.core.userdetails.User.UserBuilder builder;

        builder =  org.springframework.security.core.userdetails.User.withUsername(user.getUsername());
        builder.password(user.getPassword());
        builder.roles(user.getRole());


        return builder.build();
    }
}
