package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {
    @GetMapping(value = "/contactos")
    public ModelAndView contactPage() {
        return new ModelAndView("contactos");
    }







}
