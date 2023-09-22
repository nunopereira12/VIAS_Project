package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.LastUpdate;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.LastUpdateRepository;
import pt.upskill.vias.services.viasleague.ViasLeagueService;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Controller
public class ViasLeagueController {

    @Autowired
    ViasLeagueService viasLeagueService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private LastUpdateRepository lastUpdateRepository;



    /*@GetMapping(value = "/vias_league")
    public ModelAndView vias_leaguePage(Principal principal) {
        ModelAndView mav = new ModelAndView("vias_league");

        String loggedInUsername = principal.getName();
        User ourUser = userRepository.getUserByUsername(loggedInUsername);
        List<User> users = viasLeagueService.getUsersLeague(ourUser);

        Collections.sort(users, Comparator.comparingInt(user -> user.getUserStats().getWeekly_points()));
        Collections.reverse(users);
        mav.addObject("players", users);


        List<User> allUsers = userRepository.findAll();
        Collections.sort(allUsers, Comparator.comparingInt(user -> user.getUserStats().getTotal_points()));
        Collections.reverse(allUsers);
        mav.addObject("allPlayers", allUsers);


        mav.addObject("userr", userRepository.getUserByUsername(loggedInUsername));
        mav.addObject("targetUsername",loggedInUsername);
        return mav;

    }*/


    /*@PostMapping("/vias_league")
    public ModelAndView applyFilter(@RequestParam("filter") String selectedFilter, Principal principal) {
        User user = userRepository.getUserByUsername(principal.getName());

        ModelAndView mav = new ModelAndView("vias_league");
        List<User> userList = viasLeagueService.getStatsByFilter(selectedFilter, user.getCurrent_league());
        mav.addObject("players", userList);
        mav.addObject("selectedFilter", selectedFilter);

        mav.addObject("targetUsername", user.getUsername());

        return mav;
    }*/

    @GetMapping("/vias_league")
    public ModelAndView applyFilter(@RequestParam(value = "filter", defaultValue = "My League") String selectedFilter, Principal principal) {
        User user = userRepository.getUserByUsername(principal.getName());

        ModelAndView mav = new ModelAndView("vias_league");
        List<User> userList = viasLeagueService.getStatsByFilter(selectedFilter, user.getCurrent_league());
        mav.addObject("players", userList);
        mav.addObject("selectedFilter", selectedFilter);
        mav.addObject("user", user);

        Date last_update = lastUpdateRepository.getLastUpdateById(1).getDate();
        String formattedDate = viasLeagueService.lastUpdatePlus7(last_update);

        mav.addObject("formattedDate", formattedDate);
        mav.addObject("targetUsername", user.getUsername());

        return mav;
    }

}
