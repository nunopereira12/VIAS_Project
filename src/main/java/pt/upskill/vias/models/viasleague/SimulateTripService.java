package pt.upskill.vias.models.viasleague;

import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;

import java.util.List;

public interface SimulateTripService {

    public void saveLegToUser(User user, Leg leg);
    public void saveLegsToUser(User user, List<Leg> legs);
    public void simulateTrip(long userId, long legId);

    public void removeUncompletedLegs(User user);
    }
