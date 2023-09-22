package pt.upskill.vias.services.cards;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.LastUpdate;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.repositories.LastUpdateRepository;
import pt.upskill.vias.repositories.NaveganteRepository;

import java.util.Date;
import java.util.List;

@Service
public class NaveganteServiceImpl implements NaveganteService {

    @Autowired
    NaveganteRepository naveganteRepository;
    @Autowired
    LastUpdateRepository lastUpdateRepository;


    public boolean cardExists(String card_number) {
        return naveganteRepository.getNaveganteByCard_number(card_number) != null;
    }

    public boolean userHasCard(User user) {
        return naveganteRepository.getNaveganteByUser(user) != null;
    }

    public void setNaveganteToUser(User user, String card_number, Date expiration_date) {
        if (!cardExists(card_number)) {
            if (userHasCard(user)) {
                updateNavegante(user, card_number, expiration_date);
            } else {
                createNavegante(user, card_number, expiration_date);
            }
        }
    }

    public void updateNavegante(User user, String card_number, Date expiration_date) {
        Navegante navegante = naveganteRepository.getNaveganteByUser(user);
        navegante.setCard_number(card_number);
        navegante.setExpiration_date(expiration_date);
        naveganteRepository.save(navegante);
    }

    @Override
    public void createNavegante(User user, String card_number, Date expiration_date) {
        Navegante navegante = new Navegante(user, card_number, expiration_date);
        naveganteRepository.save(navegante);
    }

    @Override
    public void chargeCard(Navegante navegante) {
        Date today = new Date();

        if (today.before(navegante.getExpiration_date())) {

            if (!navegante.isValid()) {
                navegante.setValid(true);
            } else {
                if (!navegante.isValid_next_month()) {
                    navegante.setValid_next_month(true);
                }
            }
        }
    }

    @Override
    public void useCard(Navegante navegante) {
        navegante.setTimes_used(navegante.getTimes_used() + 1);
        naveganteRepository.save(navegante);
    }

    @Override
    public void resetMonth() {
        LastUpdate last_update = lastUpdateRepository.getLastUpdateById(2);
        Date last_update_date = last_update.getDate();
        Date today = new Date();

        if (today.getMonth() != last_update_date.getMonth()) {
            List<Navegante> cards = naveganteRepository.findAll();
            for (Navegante navegante : cards) {
                navegante.setValid(navegante.isValid_next_month());
                navegante.setValid_next_month(false);
                naveganteRepository.save(navegante);
            }
            last_update.setDate(today);
            lastUpdateRepository.save(last_update);
        }
    }
}
