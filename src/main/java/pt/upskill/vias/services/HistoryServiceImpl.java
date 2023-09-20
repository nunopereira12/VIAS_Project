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
    public List<Leg> getUserHistory(boolean simulated, User user){
        List<Leg> legs = legRepository.getAllByTrip_completedAndUserOrderById(simulated, user);
        List<Leg> iteration = new ArrayList<>(legs);
        int count = 0;
        for(Leg leg: iteration){
            count++;
            if (count > 5){
                legs.remove(leg);
            }
        }

        return legs;
    }
}
