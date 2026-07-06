package com.v.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.v.model.User;
import com.v.service.UserService;
import com.v.config.SecurityConfig;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityConfig securityConfig;

    @GetMapping("/register")
    public ModelAndView registerForm() {
        ModelAndView mv = new ModelAndView("register");
        mv.addObject("user", new User());
        return mv;
    }

    @PostMapping("/registeruser")
    public String registerUser(
            @ModelAttribute User user,
            org.springframework.ui.Model model) {
        try {
            // ✅ Check if username already exists
            User existingUser = userService
                                .getUserByUsername(user.getUsername());

            if (existingUser != null) {
                // ✅ Username taken — redirect with error
                return "redirect:/register?error=exists";
            }

            // ✅ Encode password
            String encodedPassword = securityConfig
                                     .passwordEncoder()
                                     .encode(user.getPassword());
            user.setPassword(encodedPassword);
            user.setRole("ROLE_USER");
            userService.saveUser(user);

            return "redirect:/login?registered=true";

        } catch (Exception e) {
            return "redirect:/register?error=true";
        }
    }
}