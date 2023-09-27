package pt.upskill.vias.services.payments;

import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;

public interface PaymentService {

     boolean isNavegante(String navegante_id);
     ModelAndView selectForPaymentPage(String navegante_id, Long vias_card_id, ModelAndView mav);
     void processPayment(Long vias_card_id , String navegante_id, String value);

     public String createCustomer(User user);

}
