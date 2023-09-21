package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.UserStats;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;

@Repository
public interface ViasCardRepository extends JpaRepository<ViasCard, Long> {

    ViasCard getViasCardByUser(User user);

    @Query("SELECT v FROM ViasCard v WHERE v.card_number = : card_number")
    ViasCard getViasCardByCard_number(long card_number);
}
