package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    UserRepository userRepository;

    @GetMapping(value="/profile")
    public ModelAndView profilePage(Principal principal) {
        String loggedInUsername = principal.getName();

        ModelAndView mav = new ModelAndView("profile");
        mav.addObject("userr", userRepository.getUserByUsername(loggedInUsername));
        return mav;
    }
}
