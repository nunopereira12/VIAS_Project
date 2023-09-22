package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.profile.HistoryService;
import pt.upskill.vias.services.routes.info.JSONConversionService;

import java.security.Principal;
import java.util.List;

@Controller
public class PageController {

    @Autowired
    HistoryService historyService;

    @Autowired
    JSONConversionService jsonConversionService;

    @Autowired
    LegRepository legRepository;



    @GetMapping(value = "/settings")
    public ModelAndView settingsPage() {
        return new ModelAndView("info/settings");
    }
    @GetMapping(value="/help")
    public ModelAndView helpPage() {
        ModelAndView mav = new ModelAndView("info/help");
        return mav;
    }









}
