package pt.upskill.vias.services.cards.validate;

import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.exceptions.InvalidNaveganteException;
import pt.upskill.vias.exceptions.InvalidViasCardException;

public interface ValidateService {


    String getCardNumberFromQR(String qrcode);
    boolean isNavegante(String qrcode);
    void validate(String qrcode) throws InvalidNaveganteException, InvalidViasCardException;
    void validateViasCard(long card_number) throws InvalidViasCardException;
    void validateNavegante(String card_number) throws InvalidNaveganteException;
}
