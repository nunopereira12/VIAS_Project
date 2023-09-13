package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.DestinationService;
import pt.upskill.vias.services.HomeService;

import java.io.IOException;
import java.security.Principal;

@Controller
public class HomeController {

    @Autowired
    HomeService homeService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    DestinationService destinationService;

    @GetMapping("/home")
    public ModelAndView homePage(Principal principal) {
        ModelAndView mav = new ModelAndView("home");

        if (principal != null) {
            String loggedInUsername = principal.getName();
            mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));
        }

        return mav;
    }


    /*@GetMapping(value = "/welcome")
    public ModelAndView welcomePage() {
        ModelAndView mav = new ModelAndView("welcome");
        return mav;
    }*/

    @GetMapping(value="/")
    public ModelAndView index(){
        ModelAndView mav = new ModelAndView("welcome");
        return mav;
    }

    @PostMapping(value="/perform_travel")
    public ModelAndView performTravel(String origem, String destino) throws IOException {
        ModelAndView mav = new ModelAndView("home");
        mav.addObject("tripSteps", destinationService.tripSteps(destinationService.getJSONResponse(destinationService.createPostURL(origem, destino))));
        return mav;
    }


}
