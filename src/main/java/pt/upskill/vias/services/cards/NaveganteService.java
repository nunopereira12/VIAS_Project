package pt.upskill.vias.services.cards;

import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.entities.cards.Navegante;

import java.util.Date;

public interface NaveganteService {

    boolean cardExists(String card_number);
    boolean userHasCard(User user);
    void setNaveganteToUser(User user, String card_number, Date expiration_date);
    void updateNavegante(User user, String card_number, Date expiration_date);

    void createNavegante(User user, String card_number, Date expiration_date);
    void chargeCard(Navegante navegante);
    void useCard(Navegante navegante);
    void resetMonth();
}
