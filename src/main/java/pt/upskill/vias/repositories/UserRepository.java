package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.entities.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User getUserByUsername(String username);
    User getUserByEmail(String email);
    User getUserById(long id);
    List<User> findAll();
    @Query("SELECT u FROM User u WHERE u.current_league = :league")
    List<User> findByCurrentLeague(League league);




}
