package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
    public boolean isNavegante(String qrcode) {
        return qrcode.contains("NaveCard");
    }

    @Override
    public long parseCardNumber(String qrcode) {
        return Long.parseLong(qrcode.substring(8));
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
    public boolean validateNavegante(long card_number) {
        Navegante navegante = naveganteRepository.getNaveganteByCard_number(card_number);
        if (navegante.isValid()) {
            naveganteService.useCard(navegante);
            return true;
        }
        return false;
    }

    @Override
    public boolean isValid(String qrcode) {
        long card_number = parseCardNumber(qrcode);
        try {
            return isNavegante(qrcode) ? validateNavegante(card_number) : validateViasCard(card_number);
        } catch (Exception e) {
            return false;
        }
    }
}
