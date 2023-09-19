package pt.upskill.vias.models.viasleague;

import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.models.viasleague.entities.UserStats;

import java.util.List;

public interface ViasLeagueService {


    public void updateUserStats(User user, Leg leg);

    public int getLegDistanceWalking(List<Step> steps);
    public int getLegDistanceTransit(List<Step> steps);
    public int getLegTimeWalking(List<Step> steps);
    public int getLegTimeTransit(List<Step> steps);



    //public List<User> getUserByFilter(String filter);

    public List<UserStats> getStatsByFilter(String filter);

    public List<UserStats> getStatsByLeague(Long userId);



}
