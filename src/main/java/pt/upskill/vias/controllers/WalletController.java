package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WalletController {

    @GetMapping(value = "/wallet")
    public ModelAndView walletPage() {
        ModelAndView mav = new ModelAndView("wallet");
        return mav;
    }
}
