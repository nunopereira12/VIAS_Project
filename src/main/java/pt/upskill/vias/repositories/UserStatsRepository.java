package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.user.UserStats;

import java.util.List;

@Repository
public interface UserStatsRepository  extends JpaRepository<UserStats, Long> {

    List<UserStats> findAll();



}
