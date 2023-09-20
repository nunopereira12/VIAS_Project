package pt.upskill.vias.services.cards;

import pt.upskill.vias.entities.cards.ViasCard;

public interface ViasCardService {

    void chargeCard(ViasCard viasCard, double value);

    void useCard(ViasCard viasCard);

}
