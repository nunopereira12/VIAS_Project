package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.entities.user.User;

import java.util.List;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    User getUserByUsername(String username);
    User getUserByEmail(String email);
    User getUserById(long id);
    @Query("SELECT u FROM User u WHERE u.current_league.id = :id AND u.activated = true and u.role = 'USER'")
    List<User> findByCurrentLeagueId(long id);
    @Query("SELECT u FROM User u WHERE u.activated = true and u.role = 'USER'")
    List<User> findActiveUsers();
    List<User> findAll();




}
