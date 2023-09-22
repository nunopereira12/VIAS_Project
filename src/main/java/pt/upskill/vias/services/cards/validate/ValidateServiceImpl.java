package pt.upskill.vias.services.cards.validate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.cards.NaveganteService;
import pt.upskill.vias.services.cards.ViasCardService;

@Service
public class ValidateServiceImpl implements ValidateService {

    @Autowired
    NaveganteRepository naveganteRepository;
    @Autowired
    ViasCardRepository viasCardRepository;
    @Autowired
    NaveganteService naveganteService;
    @Autowired
    ViasCardService viasCardService;

    @Override
    public String getCardNumberFromQR(String qrcode) {
        return qrcode.substring(8);
    }

    @Override
    public boolean isNavegante(String qrcode) {
        return qrcode.contains("NaveCard");
    }

    @Override
    public boolean validateViasCard(long card_number) {

        ViasCard viasCard = viasCardRepository.getViasCardByCard_number(card_number);
        double balance = viasCard.getBalance();
        if (balance >= 1.5) {
            viasCardService.useCard(viasCard);
            return true;
        }
        return false;
    }

    @Override
    public boolean validateNavegante(String card_number) {
        Navegante navegante = naveganteRepository.getNaveganteByCard_number(card_number);
        if (navegante.isValid()) {
            naveganteService.useCard(navegante);
            return true;
        }
        return false;
    }

    @Override
    public boolean isValid(String qrcode) {
        try {
            if (isNavegante(qrcode)) {
                String navegante_number = getCardNumberFromQR(qrcode);
                return validateNavegante(navegante_number);
            } else {
                long vias_number = Long.parseLong(getCardNumberFromQR(qrcode));
                return validateViasCard(vias_number);
            }
        } catch (Exception e) {
            return false;
        }
    }

    @Override
    public void addValidation(ModelAndView mav, String qrcode) {
        if(isValid(qrcode)){
            mav.addObject("validation", true);
        }
        else{
            mav.addObject("validation",false);
        }
    }
}
