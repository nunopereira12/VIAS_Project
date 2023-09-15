package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.routes.RoutesService;
import pt.upskill.vias.services.routes.info.LegInfoService;
import pt.upskill.vias.services.HomeService;
import pt.upskill.vias.services.routes.info.RoutesRequestService;

import java.io.IOException;
import java.security.Principal;


@Controller
public class HomeController {

    @Autowired
    HomeService homeService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    RoutesService routesService;

    @Autowired
    RoutesRequestService routesRequestService;

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

    @GetMapping(value="/suggestions")
    public ModelAndView performTravelPage(){
        ModelAndView mav = new ModelAndView("suggestions");
        return mav;
    }

    @PostMapping(value="/perform_travel")
    public ModelAndView performTravel(String origem, String destino, Principal principal) throws IOException {

        if(principal != null){
            String loggedInUsername = principal.getName();
            ModelAndView mav = new ModelAndView("home");
            mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));
            mav.addObject("tripSteps", routesService.tripSteps(routesRequestService.getJSONResponse(routesRequestService.createPostURL(origem, destino))));
            return mav;

            //return new ModelAndView("redirect:/suggestions");
        }

        ModelAndView mav = new ModelAndView("home");
        mav.addObject("tripSteps", routesService.tripSteps(routesRequestService.getJSONResponse(routesRequestService.createPostURL(origem, destino))));
        return mav;

        //return new ModelAndView("redirect:/suggestions");
    }


}
