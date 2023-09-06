package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {


    @GetMapping(value = "/admin")
    public ModelAndView adminPage() {
        ModelAndView mav = new ModelAndView("admin");
        return mav;
    }

}
