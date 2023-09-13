package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;

@Controller
public class TitlesController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping(value="/titles")
    public ModelAndView titlesPage(Principal principal) {
        String loggedInUsername = principal.getName();
        ModelAndView mav = new ModelAndView("titles");
        mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));
        return mav;
    }
}
