package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
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

}
