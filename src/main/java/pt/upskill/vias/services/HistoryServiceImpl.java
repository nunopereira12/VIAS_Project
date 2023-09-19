package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.LegRepository;

import java.util.List;


@Service
public class HistoryServiceImpl implements HistoryService{

    @Autowired
    LegRepository legRepository;

    @Override
    @Query("SELECT l FROM Leg l WHERE l.trip_completed = :simulated AND l.user= :user")
    public List<Leg> getAllByTrip_completedAndUser(boolean simulated, User user) {
        return legRepository.getAllByTrip_completedAndUser(simulated, user);
    }
}
