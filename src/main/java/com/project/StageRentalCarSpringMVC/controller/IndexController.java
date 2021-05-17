package com.project.StageRentalCarSpringMVC.controller;

import com.project.StageRentalCarSpringMVC.model.User;
import com.project.StageRentalCarSpringMVC.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;

@Controller
@RequestMapping("/")
public class IndexController {

    @Autowired
    private UserService userService;

    @RequestMapping
    public String getWelcome(Principal principal){

        User user = userService.getByUsername(principal.getName());

        if (user.getRole().equalsIgnoreCase("ADMIN")){
            return "redirect:/user/";
        }else{
            return "redirect:/reservation";
        }
    }

    //Here insert a common home page or everything should go after the login, like


}
