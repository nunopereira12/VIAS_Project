package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.services.ValidateService;

@Controller
public class ValidateController {

    @Autowired
    ValidateService validateService;

    @GetMapping(value = "/validate")
    public ModelAndView validatePage() {
        ModelAndView mav = new ModelAndView("validate");

        return mav;
    }

    @PostMapping(value = "/cardscan")
    public ModelAndView validadeScan(@RequestParam("qrcode") String qrcode) {
        ModelAndView mav = new ModelAndView("validate");
        if(validateService.isValid(qrcode)){
            mav.addObject("validation", true);
        }
        else{
            mav.addObject("validation",false);
        }

        return mav;
    }
}
