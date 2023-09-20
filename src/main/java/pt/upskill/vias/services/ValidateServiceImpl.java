package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.ViasCardRepository;

@Service
public class ValidateServiceImpl implements ValidateService {

    @Autowired
    NaveganteRepository naveganteRepository;
    @Autowired
    ViasCardRepository viasCardRepository;

    @Override
    public boolean isNavegante(String qrcode) {
        return qrcode.contains("NaveganteCard:");
    }

    @Override
    public long parseCardNumber(String qrcode) {
        if(isNavegante(qrcode)) {
            return Long.parseLong(qrcode.substring(14));
        } else {
            return Long.parseLong(qrcode.substring(9));
        }

    }

    @Override
    public boolean validateViasCard(long card_number) {
        System.out.println(card_number);
        ViasCard viasCard = viasCardRepository.getViasCardByCard_number(card_number);
        double balance = viasCard.getBalance();
        if(balance >= 1.5) {
            balance -= 1.5;
            viasCard.setBalance(balance);
            viasCard.setTimes_used(viasCard.getTimes_used()+1);
            viasCardRepository.save(viasCard);
            return true;
        }
        return false;
    }

    @Override
    public boolean validateNavegante(long card_number) {
        Navegante navegante = naveganteRepository.getNaveganteByCard_number(card_number);
        if(navegante.isValid()) {
            navegante.setTimes_used(navegante.getTimes_used()+1);
            naveganteRepository.save(navegante);
            return true;
        }
        return false;
    }

    @Override
    public boolean isValid(String qrcode) {
        long card_number = parseCardNumber(qrcode);
        return isNavegante(qrcode) ? validateNavegante(card_number) : validateViasCard(card_number);
    }
}
