package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.cards.Navegante;

import java.util.List;

@Repository
public interface NaveganteRepository extends JpaRepository<Navegante, Long> {

    Navegante getNaveganteByUser(User user);
    @Query("SELECT n FROM Navegante n WHERE n.card_number = :card_number")
    Navegante getNaveganteByCard_number(long card_number);
    @Override
    List<Navegante> findAll();
}
