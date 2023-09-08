package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DiagramController {

    @GetMapping(value = "/diagrams")
    public ModelAndView diagramPage() {
        ModelAndView mav = new ModelAndView("diagrams");
        return mav;
    }
}
