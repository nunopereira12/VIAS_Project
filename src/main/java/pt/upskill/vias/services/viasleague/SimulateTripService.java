package pt.upskill.vias.services.viasleague;

import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;

import java.util.List;

public interface SimulateTripService {

    public void saveLegToUser(User user, Leg leg);
    public void saveLegsToUser(User user, List<Leg> legs);
    public void simulateTrip(long userId, long legId);

    public void removeUncompletedLegs(User user);
    }
