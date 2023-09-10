package pt.upskill.vias.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.entities.Token;

@Repository
public interface TokenRepository extends JpaRepository<Token, Long> {
    Token findByTokenID(String tokenID);
}
