package pt.upskill.vias.services.cards;

import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.cards.Navegante;

import java.util.Date;

public interface NaveganteService {

    boolean cardExists(long card_number);
    boolean userHasCard(User user);
    void setNaveganteToUser(User user, long card_number, Date expiration_date);
    void updateNavegante(User user, long card_number, Date expiration_date);

    void createNavegante(User user, long card_number, Date expiration_date);

    void chargeCard(Navegante navegante);

    void useCard(Navegante navegante);

    void resetMonth();
}
