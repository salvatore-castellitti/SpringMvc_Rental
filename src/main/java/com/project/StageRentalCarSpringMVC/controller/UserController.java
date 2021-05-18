package com.project.StageRentalCarSpringMVC.controller;

import com.project.StageRentalCarSpringMVC.model.User;
import com.project.StageRentalCarSpringMVC.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private UserService userService;

    @RequestMapping
    public String listUser(Model model){

        List<User> allUser = userService.getAll();

        model.addAttribute("listUser",allUser);
        return "user-list";
    }

    @GetMapping(value = {"/save","/update"})
    public String userForm(Model model,
                           @ModelAttribute("idUser") String idUser){

        User user = new User();
        if(!idUser.equals("")){
           user = userService.getById(idUser);
        }
        model.addAttribute("userAction",user);
        return "user-form";
    }

    @PostMapping(value = {"/save","/update","/profile"})
    public String saveUser(@ModelAttribute("userAction") User user,
                           Principal principal){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRole("CUSTOMER");
        if (user.getId()!=0){
            userService.update(user);
        }else{
            userService.save(user);
        }

            return "redirect:/";
    }

//    @GetMapping(value = "/update")
//    public String updateForm(@ModelAttribute("idUser") String idUser, Model model){
//        User user = userService.getById(idUser);
//        model.addAttribute("userAction",user);
//        return "user-form";
//    }

//    @PostMapping({"/update","/profile"})
//    public String updateUser(@ModelAttribute("userAction") User user){
//        user.setPassword(passwordEncoder.encode(user.getPassword()));
//        user.setRole("CUSTOMER");
//        userService.update(user);
//
//        return "redirect:/user";
//    }

    @GetMapping("/delete")
    public String deleteUSer (@ModelAttribute("idUser") String idUser){
        User user = userService.getById(idUser);
        userService.delete(user);
        return "redirect:/user";
    }

    @GetMapping(value = "/profile")
    public String getProfile(Principal principal, Model model){

        User user = userService.getByUsername(principal.getName());
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        model.addAttribute("userAction",user);
        return "user-form";
    }


}
