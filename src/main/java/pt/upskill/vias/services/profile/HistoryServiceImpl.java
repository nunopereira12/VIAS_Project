package pt.upskill.vias.services.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.LegRepository;

import java.util.ArrayList;
import java.util.List;


@Service
public class HistoryServiceImpl implements HistoryService {

    @Autowired
    LegRepository legRepository;

    @Override
    public List<Leg> getUserHistory(User user) {
        List<Leg> legs = legRepository.getAllByTrip_completedAndUserOrderById(user);
        List<Leg> history = new ArrayList<>();

        for (int i = 0; i < Math.min(legs.size(), 5); i++) {
            history.add(legs.get(i));
        }

        return history;
    }
}
