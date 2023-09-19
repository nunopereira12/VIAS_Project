package pt.upskill.vias.models.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.models.viasleague.entities.UserStats;
import pt.upskill.vias.repositories.UserStatsRepository;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

@Service
public class ViasLeagueServiceImpl implements ViasLeagueService {

    @Autowired
    UserStatsRepository userStatsRepository;

    @Override
    public void updateUserStats(User user, Leg leg) {
        UserStats userStats = userStatsRepository.getUserStatsByUser(user);
        List<Step> steps = leg.getSteps();

        int total_distance_walking = userStats.getTotal_distance_walking() + getLegDistanceWalking(steps);
        int total_distance_transit = userStats.getTotal_distance_transit() + getLegDistanceTransit(steps);
        int total_time_walking = userStats.getTotal_time_walking() + getLegTimeWalking(steps);
        int total_time_transit = userStats.getTotal_time_transit() + getLegTimeTransit(steps);
        int legPoints = leg.getPoints();
        int trips_done = userStats.getTrips_done() + 1;
        double money_spent = userStats.getMoney_spent() + Double.parseDouble(leg.getFare());
        int total_points = userStats.getTotal_points() + legPoints;
        int weekly_points = userStats.getWeekly_points() + legPoints;

        userStats.setTotal_distance_walking(total_distance_walking);
        userStats.setTotal_distance_transit(total_distance_transit);
        userStats.setTotal_time_walking(total_time_walking);
        userStats.setTotal_time_transit(total_time_transit);
        userStats.setTrips_done(trips_done);
        userStats.setMoney_spent(money_spent);
        userStats.setTotal_points(total_points);
        userStats.setWeekly_points(weekly_points);

        userStatsRepository.save(userStats);
    }


    @Override
    public int getLegDistanceWalking(List<Step> steps) {
        int distance = 0;

        for(Step step : steps) {
            if(step.getTravel_mode().equals("WALKING")) {
                distance += step.getDistanceValue();
            }
        }
        return distance;
    }

    @Override
    public int getLegDistanceTransit(List<Step> steps) {
        int distance = 0;

        for(Step step : steps) {
            if(step.getTravel_mode().equals("TRANSIT")) {
                distance += step.getDistanceValue();
            }
        }
        return distance;
    }

    @Override
    public int getLegTimeWalking(List<Step> steps) {
        int time = 0;

        for(Step step : steps) {
            if(step.getTravel_mode().equals("WALKING")) {
                time += step.getDurationValue();
            }
        }
        return time;
    }

    @Override
    public int getLegTimeTransit(List<Step> steps) {
        int time = 0;

        for(Step step : steps) {
            if(step.getTravel_mode().equals("TRANSIT")) {
                time += step.getDurationValue();
            }
        }
        return time;
    }

    @Override
    public List<UserStats> getStatsByFilter(String filter) {
        List<UserStats> userStatsList;

        userStatsList = userStatsRepository.findAll();

        switch (filter) {
            case "Viagens Completas":
                userStatsList.sort(Comparator.comparing(UserStats::getTrips_done).reversed());
                break;
            case "Total Gasto":
                userStatsList.sort(Comparator.comparing(UserStats::getMoney_spent).reversed());
                break;
            case "Distância Percorrida a Andar":
                userStatsList.sort(Comparator.comparing(UserStats::getTotal_distance_walking).reversed());
                break;
            case "Distância Percorida Transportes":
                userStatsList.sort(Comparator.comparing(UserStats::getTotal_distance_transit).reversed());
                break;
            case "Leaderboard":
                userStatsList.sort(Comparator.comparing(UserStats::getTotal_points).reversed());
                break;
            case "Tempo Despendido em Transportes":
                userStatsList.sort(Comparator.comparing(UserStats::getTotal_time_transit).reversed());
                break;
            case "Tempo Despendido a Andar":
                userStatsList.sort(Comparator.comparing(UserStats::getTotal_time_walking).reversed());
                break;
            case "My League":
                userStatsList.sort(Comparator.comparing(UserStats::getWeekly_points).reversed());
                break;
            default:
                return Collections.emptyList();
        }

        return userStatsList;
    }

    @Override
    public List<UserStats> getStatsByLeague(Long userId) {
        return null;
    }

}
