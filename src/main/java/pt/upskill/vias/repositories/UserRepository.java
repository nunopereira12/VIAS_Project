package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import pt.upskill.vias.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User getUserByUsername(String username);
}
