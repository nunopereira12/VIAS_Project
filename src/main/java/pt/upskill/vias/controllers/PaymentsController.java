package pt.upskill.vias.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PaymentsController {

    @GetMapping("/payments")
    public ModelAndView payments() {
        return new ModelAndView("payments/payments");
    }

    @GetMapping("/payment_success")
    public ModelAndView paymentSuccessPage(){
        return new ModelAndView("payments/payment_success");
    }
    @GetMapping("/select_for_payment")
    public ModelAndView selectForPaymentPage(){
        return new ModelAndView("payments/select_for_payment");
    }

   /* @PostMapping("/payments")
    public ModelAndView finalizePayments(@RequestParam("valuePurchase")int value,@RequestParam("cardID")int cardID){
        ModelAndView mav= new ModelAndView("/payments");
        return mav;
    }
*/

}
