package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.UserStats;
import pt.upskill.vias.entities.cards.Navegante;

import java.util.List;

@Repository
public interface NaveganteRepository extends JpaRepository<Navegante, Long> {

    Navegante getNaveganteByUser(User user);
    @Override
    List<Navegante> findAll();
}
