package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.LastUpdate;
import pt.upskill.vias.entities.League;

@Repository
public interface LastUpdateRepository extends JpaRepository<LastUpdate, Long> {

    LastUpdate getLastUpdateById(long id);


}
