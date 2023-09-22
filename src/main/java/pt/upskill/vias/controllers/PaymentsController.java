package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentsController {

    @GetMapping("/payments")
    public String payments() {
        return "payments";
    }

    @GetMapping("/payment_success")
    public ModelAndView paymentSuccessPage(){
        return new ModelAndView("payment_success");
    }
    @GetMapping("/select_for_payment")
    public ModelAndView selectForPaymentPage(){
        return new ModelAndView("select_for_payment");
    }


}
