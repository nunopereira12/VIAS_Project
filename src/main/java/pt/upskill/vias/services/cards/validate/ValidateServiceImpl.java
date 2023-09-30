package pt.upskill.vias.services.cards.validate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.exceptions.InvalidNaveganteException;
import pt.upskill.vias.exceptions.InvalidViasCardException;
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
    public void validateViasCard(long card_number) throws InvalidViasCardException {

        ViasCard viasCard = viasCardRepository.getViasCardByCard_number(card_number);
        double balance = viasCard.getBalance();
        if (balance < 1.5) {
            throw new InvalidViasCardException("Saldo insuficiente.");
        }
        viasCardService.useCard(viasCard);
    }

    @Override
    public void validateNavegante(String card_number) throws InvalidNaveganteException {

        Navegante navegante = naveganteRepository.getNaveganteByCard_number(card_number);
        if (!navegante.isValid()) {
            throw new InvalidNaveganteException("Navegante inválido.");
        }
        naveganteService.useCard(navegante);

    }

    @Override
    public void validate(String qrcode) throws InvalidNaveganteException, InvalidViasCardException {

        if (isNavegante(qrcode)) {
            String navegante_number = getCardNumberFromQR(qrcode);
            validateNavegante(navegante_number);
        } else {
            long vias_number = Long.parseLong(getCardNumberFromQR(qrcode));
            validateViasCard(vias_number);
        }

    }

}
