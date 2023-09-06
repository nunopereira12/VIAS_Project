package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ViasLeagueController {

    @GetMapping(value = "/vias_league")
    public ModelAndView vias_leaguePage() {
        ModelAndView mav = new ModelAndView("vias_league");
        return mav;
    }
}
