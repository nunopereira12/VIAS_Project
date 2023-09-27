package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.services.utils.CalendarService;
import pt.upskill.vias.services.viasleague.SimulateTripService;
import pt.upskill.vias.services.viasleague.ViasLeagueService;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.HomeService;
import pt.upskill.vias.services.routes.RoutesRequestService;
import pt.upskill.vias.services.routes.info.JSONConversionService;

import java.io.IOException;
import java.security.Principal;
import java.sql.Time;
import java.text.ParseException;
import java.util.Date;
import java.util.List;


@Controller
public class HomeController {

    @Autowired
    HomeService homeService;

    @Autowired
    UserRepository userRepository;

    @Autowired
    RoutesRequestService routesRequestService;

    @Autowired
    LegRepository legRepository;

    @Autowired
    JSONConversionService jsonConversionService;

    @Autowired
    SimulateTripService simulateTripService;

    @Autowired
    ViasLeagueService viasLeagueService;

    @Autowired
    CalendarService calendarService;

    @GetMapping("/home")
    public ModelAndView homePage(Principal principal) {
        ModelAndView mav = new ModelAndView("home/home");

        if (principal != null) {
            String username = principal.getName();
            mav.addObject("user", userRepository.getUserByUsername(username));
        }

        return mav;
    }

    @GetMapping(value = "/")
    public ModelAndView index() {
        return new ModelAndView("home/welcome");
    }


    @PostMapping(value = "/perform_travel")
    public ModelAndView performTravel(String origem, String destino, boolean depart, String date, Principal principal) {
        ModelAndView mav = new ModelAndView("home/suggestions");


        try {
            List<Leg> legs = routesRequestService.getLegList(origem, destino, depart, date);
            legRepository.saveAll(legs);

            mav.addObject("origem", origem);
            mav.addObject("destino", destino);
            mav.addObject("depart", depart);
            mav.addObject("date", date);

            mav.addObject("depart", depart);
            mav.addObject("date", date);

            if (!legs.isEmpty()) {
                mav.addObject("legs", legs);
            } else {
                mav.addObject("search_error", "Não foi possível calcular uma rota de transportes público entre " + origem + " e " + destino + ". \nPor favor, tente outros locais.");
            }

            if (principal != null) {
                User user = userRepository.getUserByUsername(principal.getName());
                simulateTripService.saveLegsToUser(user, legs);
            }

            return mav;

        } catch (IOException ioe) {
            mav.addObject("search_error", "Houve um erro na pesquisa.\nPor favor, tente novamente.");
        } catch (ParseException pe) {
            mav.addObject("search_error", "Não foi possível calcular a rota para a data selecionada.\nPor favor, tente novamente.");
        }

        return mav;
    }

    @PostMapping(value = "/travel_details")
    public ModelAndView travelDetailsPage(@RequestParam("id") long id, Principal principal, boolean depart, String date) {
        ModelAndView mav = new ModelAndView("home/travel_details");

        mav.addObject("depart", depart);
        mav.addObject("date", date);

        Leg leg = legRepository.getLegById(id);
        leg = jsonConversionService.addSteps(leg);
        mav.addObject("leg", leg);

        if (principal != null) {
            User user = userRepository.getUserByUsername(principal.getName());
            mav.addObject("user", user);
        }

        return mav;
    }

    @PostMapping(value = "/simulate_trip")
    public ModelAndView simulateTripRequest(@RequestParam("id") long legId, Principal principal) {
        ModelAndView mav = new ModelAndView("home/travel_details");

        User user = userRepository.getUserByUsername(principal.getName());
        long userId = user.getId();

        //ADICIONAR MENSAGEM DE OK

        Leg leg = legRepository.getLegById(legId);
        leg = jsonConversionService.addSteps(leg);
        mav.addObject("leg", leg);

        simulateTripService.simulateTrip(userId, legId);

        return mav;
    }


}
