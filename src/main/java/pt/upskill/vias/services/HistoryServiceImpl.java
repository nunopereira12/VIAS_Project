package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.LegRepository;

import java.util.ArrayList;
import java.util.List;


@Service
public class HistoryServiceImpl implements HistoryService{

    @Autowired
    LegRepository legRepository;

    @Override
    @Query("SELECT l FROM Leg l WHERE l.trip_completed = :simulated AND l.user= :user ORDER BY l.id DESC")
    public List<Leg> getAllByTrip_completedAndUserOrderById(boolean simulated, User user){
        List<Leg> legs = legRepository.getAllByTrip_completedAndUserOrderById(simulated, user);
        List<Leg> iteration = new ArrayList<>(legs);
        int count = 0;
        for(Leg leg: iteration){
            count++;
            if (count >5){
                legs.remove(leg);
            }
        }

        return legs;
    }
}
