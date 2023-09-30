package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.exceptions.InvalidCardException;
import pt.upskill.vias.exceptions.InvalidNaveganteException;
import pt.upskill.vias.exceptions.InvalidViasCardException;
import pt.upskill.vias.services.cards.validate.ValidateService;

@Controller
public class ValidateController {

    @Autowired
    ValidateService validateService;

    @GetMapping(value = "/validate")
    public ModelAndView validatePage() {
        return new ModelAndView("pica/validate");
    }

    @PostMapping(value = "/card_scan")
    public ModelAndView validadeScan(@RequestParam("qrcode") String qrcode) {
        ModelAndView mav = new ModelAndView("pica/validate");

        try {
            validateService.validate(qrcode);
            mav.addObject("validation", true);
        } catch (InvalidCardException ice) {
            mav.addObject("error_message", ice.getMessage());
            mav.addObject("validation", false);
        }

        return mav;
    }
}
