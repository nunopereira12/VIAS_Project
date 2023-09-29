package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.services.viasleague.ViasLeagueService;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;
import java.util.List;

@Controller
public class ViasLeagueController {

    @Autowired
    ViasLeagueService viasLeagueService;

    @Autowired
    private UserRepository userRepository;



    @GetMapping("/vias_league")
    public ModelAndView applyFilter(@RequestParam(value = "filter", defaultValue = "My League") String selected_filter, Principal principal) {
        User user = userRepository.getUserByUsername(principal.getName());

        ModelAndView mav = new ModelAndView("user/vias_league");
        List<User> user_list = viasLeagueService.getStatsByFilter(selected_filter, user.getCurrent_league());
        mav.addObject("players", user_list);
        mav.addObject("selected_filter", selected_filter);
        mav.addObject("user", user);
        mav.addObject("formatted_date", viasLeagueService.nextUpdate());
        mav.addObject("target_username", user.getUsername());
        return mav;
    }


}
