package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TemplateController {

    @GetMapping(value = "/template")
    public ModelAndView templatePage() {
        ModelAndView mav = new ModelAndView("template");
        return mav;
    }
}
