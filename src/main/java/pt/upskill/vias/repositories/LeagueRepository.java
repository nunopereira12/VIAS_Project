package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.League;

import java.util.Date;

@Repository
public interface LeagueRepository extends JpaRepository<League, Long> {
    League getLeagueById(long id);

}
