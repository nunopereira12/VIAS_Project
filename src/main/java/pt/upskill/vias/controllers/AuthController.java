package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.SignUp;
import pt.upskill.vias.services.AuthService;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;

    @GetMapping(value = "/login")
    public ModelAndView loginPage() {
        return new ModelAndView("login");
    }
    @GetMapping(value = "/signup")
    public ModelAndView signupPage() {
        return new ModelAndView("signup");
    }

    @PostMapping(value = "/signup_action")
    public ModelAndView signUp(SignUp newUser) {
        if (authService.isUsernameTaken(newUser.getUsername())) {
            ModelAndView modelAndView = new ModelAndView("signup");
            modelAndView.addObject("error", "Username already exists");
            return modelAndView;
        }
        authService.registerUser(newUser.getUsername(), newUser.getPassword());

        return new ModelAndView("redirect:/login");
    }

}