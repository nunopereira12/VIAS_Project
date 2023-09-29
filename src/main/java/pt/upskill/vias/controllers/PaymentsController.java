package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.payments.PaymentService;


@Controller
public class PaymentsController {

    @Autowired
    NaveganteRepository naveganteRepository;

    @Autowired
    ViasCardRepository viasCardRepository;

    @Autowired
    PaymentService paymentService;

    @PostMapping("/payment_success")
    public ModelAndView paymentSuccessPage(Long vias_card_id , String navegante_id, String value){
        paymentService.processPayment(vias_card_id, navegante_id, value);
        return new ModelAndView("payments/payment_success");
    }

    @GetMapping("/payment_success")
    public ModelAndView paymentSuccessPage(){
        return new ModelAndView("payments/payment_success");
    }

   @PostMapping("/payments_vias_card")
    public ModelAndView selectPaymentPageVIASCard(Long vias_card_id , String navegante_id){
       ModelAndView mav = new ModelAndView("payments/payments_vias_card");
        return paymentService.selectForPaymentPage(navegante_id,vias_card_id, mav);
    }

    @PostMapping("/payments_navegante")
    public ModelAndView selectPaymentPageNavegante(Long vias_card_id , String navegante_id){
        ModelAndView mav = new ModelAndView("payments/payments_navegante");
        return paymentService.selectForPaymentPage(navegante_id,vias_card_id, mav);
    }


}
