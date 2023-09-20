package pt.upskill.vias.services.cards;

import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.cards.Navegante;

import java.util.Date;

public interface NaveganteService {


    void setNaveganteToUser(User user, long card_number, Date expiration_date);
    void updateNavegante(Navegante navegante, long card_number, Date expiration_date);

    void createNavegante(User user, long card_number, Date expiration_date);

    void chargeCard(Navegante navegante);

    void useCard(Navegante navegante);

    void resetMonth();
}
