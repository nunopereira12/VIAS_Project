package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.models.routes.Leg;

@Repository
public interface LeagueRepository extends JpaRepository<League, Long> {

    League getLeagueById(long id);

    League getLeagueByName(String league_name);
}
