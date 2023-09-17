package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PaymentsController {

    @GetMapping("/payments")
    public String payments() {
        return "payments";
    }

}
