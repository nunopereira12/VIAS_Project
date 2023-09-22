package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class DiagramScheduleController {

    @GetMapping(value = "/diagrams")
    public ModelAndView diagramPage() {
        return new ModelAndView("info/diagrams");
    }

    @GetMapping(value = "/schedules")
    public ModelAndView schedulePage() {
        return new ModelAndView("info/schedules");
    }
}
