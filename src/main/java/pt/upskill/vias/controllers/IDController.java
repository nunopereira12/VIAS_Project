package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class IDController {

    @GetMapping(value = "/id_pica")
    public ModelAndView picaPage() {
        ModelAndView mav = new ModelAndView("pica/id_pica");
        return mav;
    }
}
