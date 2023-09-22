package pt.upskill.vias.services.cards.validate;

import org.springframework.web.servlet.ModelAndView;

public interface ValidateService {


    String getCardNumberFromQR(String qrcode);
    boolean isNavegante(String qrcode);
    boolean isValid(String qrcode);
    boolean validateViasCard(long card_number);
    boolean validateNavegante(String card_number);
    void addValidation(ModelAndView mav, String qrcode);
}
