package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.HomeService;

import java.security.Principal;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class HomeController {

    @Autowired
    HomeService homeService;

    @Autowired
    private UserRepository userRepository;

    @GetMapping (value="/home")
    public ModelAndView homePage(Principal principal) {
        ModelAndView mav = new ModelAndView("home");
        String loggedInUsername = principal.getName();
        mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));
        return mav;
    }

    @GetMapping(value = "/welcome")
    public ModelAndView welcomePage() {
        ModelAndView mav = new ModelAndView("welcome");
        return mav;
    }


}
