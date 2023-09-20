package pt.upskill.vias.services.viasleague;

import pt.upskill.vias.entities.League;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;

import java.util.List;

public interface ViasLeagueService {


    void updateUserStats(User user, Leg leg);

    int getLegDistanceWalking(List<Step> steps);
    int getLegDistanceTransit(List<Step> steps);
    int getLegTimeWalking(List<Step> steps);
    int getLegTimeTransit(List<Step> steps);
    List<User> getStatsByFilter(String filter, League league);
    void resetLeague();
    void resetStats(List<User> users);
    void changeLeagues();
    void changeBronze(List<User> bronze, int positions_to_move);
    void changeSilver(List<User> silver, int positions_to_move);
    void changeGold(List<User> gold, int positions_to_move);
    void changePlatinum(List<User> platinum, int positions_to_move);
    void changeDiamond(List<User> diamond, int positions_to_move);
}
