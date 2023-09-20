package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.services.viasleague.ViasLeagueService;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Controller
public class ViasLeagueController {

    @Autowired
    ViasLeagueService viasLeagueService;

    @Autowired
    private UserRepository userRepository;


    @GetMapping(value = "/vias_league")
    public ModelAndView vias_leaguePage(Principal principal) {

        String loggedInUsername = principal.getName();
        User user = userRepository.getUserByUsername(loggedInUsername);
        List<User> users = viasLeagueService.getUsersLeague(user);
        Collections.sort(users, Comparator.comparing(User::getPoints).reversed());

        List<User> allUsers = userRepository.findAll();
        Collections.sort(allUsers, Comparator.comparing(User::getPoints).reversed());


        ModelAndView mav = new ModelAndView("vias_league");

        mav.addObject("players", users);
        mav.addObject("userr", userRepository.getUserByUsername(loggedInUsername));
        mav.addObject("allPlayers", allUsers);
        mav.addObject("targetUsername",loggedInUsername);
        return mav;

    }

    @PostMapping("/vias_league")
    public ModelAndView applyFilter(@RequestParam("filter") String selectedFilter, Principal principal) {
        User user = userRepository.getUserByUsername(principal.getName());

        ModelAndView mav = new ModelAndView("vias_league");
        List<User> userList = viasLeagueService.getStatsByFilter(selectedFilter, user.getCurrent_league());
        mav.addObject("players", userList);
        mav.addObject("selectedFilter", selectedFilter);

        return mav;
    }


}
