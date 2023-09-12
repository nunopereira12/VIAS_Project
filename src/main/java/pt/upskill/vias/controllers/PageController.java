package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

    @GetMapping(value = "/settings")
    public ModelAndView settingsPage() {
        return new ModelAndView("settings");
    }
    @GetMapping(value="/ajuda")
    public ModelAndView helpPage() {
        ModelAndView mav = new ModelAndView("help");
        return mav;
    }






}
