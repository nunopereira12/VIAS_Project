package pt.upskill.vias.services.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.repositories.UserRepository;

import java.util.ArrayList;
import java.util.List;

@Service
public class SimulateTripServiceImpl implements SimulateTripService {

    @Autowired
    LegRepository legRepository;

    @Autowired
    UserRepository userRepository;
    
    @Autowired
    CalculatePointsService calculatePointsService;

    @Autowired
    ViasLeagueService viasLeagueService;


    @Override
    public void saveLegToUser(User user, Leg leg) {
        leg.setUser(user);
        calculatePointsService.setTripPoints(leg);
        legRepository.save(leg);


    }

    public void saveLegsToUser(User user, List<Leg> legs) {
        for(Leg leg : legs) {
            saveLegToUser(user, leg);
        }
    }

    @Override
    public void removeUncompletedLegs(User user) {
        List<Leg> userLegs = legRepository.findAllByUser(user);
        List<Leg> legsToRemove = new ArrayList<>();

        for(Leg leg : userLegs) {
            if (!leg.isTrip_completed()){
                legsToRemove.add(leg);
            }
        }
        legRepository.deleteAll(legsToRemove);
    }

    @Override
    public void simulateTrip(long userId, long legId) {
        User user = userRepository.getUserById(userId);
        Leg leg = legRepository.getLegById(legId);

        leg.setTrip_completed(true);

        removeUncompletedLegs(user);

        viasLeagueService.updateUserStats(user, leg);
    }


}
