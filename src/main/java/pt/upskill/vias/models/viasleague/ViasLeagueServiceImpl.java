package pt.upskill.vias.models.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.models.viasleague.entities.UserStats;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.UserStatsRepository;

import java.util.*;

@Service
public class ViasLeagueServiceImpl implements ViasLeagueService {

    @Autowired
    UserStatsRepository userStatsRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public void updateUserStats(User user, Leg leg) {
        UserStats userStats = user.getUserStats();
        List<Step> steps = leg.getSteps();

        int total_distance_walking = userStats.getTotal_distance_walking() + getLegDistanceWalking(steps);
        int total_distance_transit = userStats.getTotal_distance_transit() + getLegDistanceTransit(steps);
        int total_time_walking = userStats.getTotal_time_walking() + getLegTimeWalking(steps)/60;
        int total_time_transit = userStats.getTotal_time_transit() + getLegTimeTransit(steps)/60;
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
    public void resetLeague(Date lastupdate) {
        long now = new Date().getTime();
        long last_update = lastupdate.getTime();
        long seven_days = 604800000;

        if(now-last_update >= seven_days) {

        }

    }

    @Override
    public List<User> getStatsByFilter(String filter, League league) {

        List<User> userList = userRepository.findAll();

        switch (filter) {
            case "Viagens Completas":
                userList.sort(Comparator.comparingInt(u -> u.getUserStats().getTrips_done()));
                break;
            case "Total Gasto":
                userList.sort(Comparator.comparingDouble(u -> u.getUserStats().getMoney_spent()));
                break;
            case "Distância Percorrida a Andar":
                userList.sort(Comparator.comparingInt(u -> u.getUserStats().getTotal_distance_walking()));
                break;
            case "Distância Percorida Transportes":
                userList.sort(Comparator.comparingInt(u -> u.getUserStats().getTotal_distance_transit()));
                break;
            case "Leaderboard":
                userList.sort(Comparator.comparingInt(u -> u.getUserStats().getTotal_points()));
                break;
            case "Tempo Despendido em Transportes":
                userList.sort(Comparator.comparingInt(u -> u.getUserStats().getTotal_time_transit()));
                break;
            case "Tempo Despendido a Andar":
                userList.sort(Comparator.comparingInt(u -> u.getUserStats().getTotal_time_walking()));
                break;
            case "My League":
                userList = userRepository.findByCurrentLeague(league);
                break;
            default:
                return Collections.emptyList();
        }

        return userList;
    }

}
