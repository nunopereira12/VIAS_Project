package pt.upskill.vias.services.cards;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.repositories.ViasCardRepository;

@Service
public class ViasCardServiceImpl implements ViasCardService {

    @Autowired
    ViasCardRepository viasCardRepository;
    @Override
    public void chargeCard(ViasCard viasCard, double value) {
        double balance = viasCard.getBalance() + value;
        viasCard.setBalance(balance);
        viasCardRepository.save(viasCard);
    }

    @Override
    public void useCard(ViasCard viasCard) {
        viasCard.setBalance(viasCard.getBalance() - 1.5);
        viasCard.setTimes_used(viasCard.getTimes_used() + 1);
        viasCardRepository.save(viasCard);
    }


}
