package pt.upskill.vias.repositories;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import pt.upskill.vias.models.routes.Leg;

@Repository
public interface LegRepository extends JpaRepository<Leg, Long> {

    Leg getLegById(long id);
}
