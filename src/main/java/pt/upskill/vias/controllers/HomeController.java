package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.routes.RoutesService;
import pt.upskill.vias.services.HomeService;
import pt.upskill.vias.services.routes.RoutesRequestService;

import java.io.IOException;
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

    @GetMapping(value="/traveldetails")
    public ModelAndView travelDetailsPage(){
        ModelAndView mav = new ModelAndView("traveldetails");
        return mav;
    }

    @PostMapping(value="/perform_travel")
    public ModelAndView performTravel(String origem, String destino, Principal principal) throws IOException {
        ModelAndView mav = new ModelAndView("suggestions");
        List<Leg> legs = routesRequestService.getLegList(origem, destino);
        Collections.sort(legs, Comparator.comparing(Leg::getDuration));

        if (legs.isEmpty()) {
            /*return new ModelAndView("wallet");*/
            mav.addObject("error2", "Erro na procura. \nPor favor, tente novamente.");

            return mav;
        }

        if(principal != null){
            String loggedInUsername = principal.getName();
            mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));
            mav.addObject("tripSteps", routesService.tripSteps(routesRequestService.getJSONResponse(routesRequestService.createPostURL(origem, destino))));
            mav.addObject("legs", legs);
            return mav;

            //return new ModelAndView("redirect:/suggestions");
        }

        mav.addObject("tripSteps", routesService.tripSteps(routesRequestService.getJSONResponse(routesRequestService.createPostURL(origem, destino))));
        mav.addObject("legs", legs);
        return mav;

        //return new ModelAndView("redirect:/suggestions");
    }


}
