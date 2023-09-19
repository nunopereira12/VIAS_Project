package pt.upskill.vias.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;

import java.util.List;

@Repository
public interface LegRepository extends JpaRepository<Leg, Long> {

    Leg getLegById(long id);
    List<Leg> findAllByUser(User user);
    @Query("SELECT l FROM Leg l WHERE l.trip_completed = :simulated AND l.user= :user")
    List<Leg> getAllByTrip_completedAndUser(boolean simulated, User user);

}
