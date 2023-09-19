package pt.upskill.vias.models.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.League;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.models.viasleague.entities.UserStats;
import pt.upskill.vias.repositories.LeagueRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.UserStatsRepository;

import java.util.*;

@Service
public class ViasLeagueServiceImpl implements ViasLeagueService {

    @Autowired
    UserStatsRepository userStatsRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    LeagueRepository leagueRepository;

    @Override
    public void updateUserStats(User user, Leg leg) {
        UserStats userStats = user.getUserStats();
        List<Step> steps = leg.getSteps();

        int total_distance_walking = userStats.getTotal_distance_walking() + getLegDistanceWalking(steps);
        int total_distance_transit = userStats.getTotal_distance_transit() + getLegDistanceTransit(steps);
        int total_time_walking = userStats.getTotal_time_walking() + getLegTimeWalking(steps) / 60;
        int total_time_transit = userStats.getTotal_time_transit() + getLegTimeTransit(steps) / 60;
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

        for (Step step : steps) {
            if (step.getTravel_mode().equals("WALKING")) {
                distance += step.getDistanceValue();
            }
        }
        return distance;
    }

    @Override
    public int getLegDistanceTransit(List<Step> steps) {
        int distance = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("TRANSIT")) {
                distance += step.getDistanceValue();
            }
        }
        return distance;
    }

    @Override
    public int getLegTimeWalking(List<Step> steps) {
        int time = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("WALKING")) {
                time += step.getDurationValue();
            }
        }
        return time;
    }

    @Override
    public int getLegTimeTransit(List<Step> steps) {
        int time = 0;

        for (Step step : steps) {
            if (step.getTravel_mode().equals("TRANSIT")) {
                time += step.getDurationValue();
            }
        }
        return time;
    }

    @Override
    public List<User> getStatsByFilter(String filter, League league) {

        List<User> userList = userRepository.findAll();

        switch (filter) {
            case "Distância Percorrida a Andar":
                userList.sort(Comparator.comparingInt(u -> -u.getUserStats().getTotal_distance_walking()));
                break;
            case "Distância Percorida Transportes":
                userList.sort(Comparator.comparingInt(u -> -u.getUserStats().getTotal_distance_transit()));
                break;
            case "Tempo Despendido a Andar":
                userList.sort(Comparator.comparingInt(u -> -u.getUserStats().getTotal_time_walking()));
                break;
            case "Tempo Despendido em Transportes":
                userList.sort(Comparator.comparingInt(u -> -u.getUserStats().getTotal_time_transit()));
                break;
            case "Viagens Completas":
                userList.sort(Comparator.comparingInt(u -> -u.getUserStats().getTrips_done()));
                break;
            case "Total Gasto":
                userList.sort(Comparator.comparingDouble(u -> -u.getUserStats().getMoney_spent()));
                break;
            case "Leaderboard":
                userList.sort(Comparator.comparingInt(u -> -u.getUserStats().getTotal_points()));
                break;
            case "My League":
                userList = userRepository.findByCurrentLeague(league);
                break;
            default:
                return Collections.emptyList();
        }

        return userList;
    }

    @Override
    public void resetLeague() {
        long now = new Date().getTime();
        long last_update = leagueRepository.getLastUpdateById(1).getTime();
        long seven_days = 604800000;
        List<User> users = userRepository.findAll();

        if (now - last_update >= seven_days) {
            resetStats(users);
            changeLeagues();
        } else {

        }
    }

    @Override
    public void resetStats(List<User> users) {
        for (User user : users) {
            user.getUserStats().setWeekly_points(0);
            userRepository.save(user);
        }
    }

    public void changeDiamond(List<User> diamond, double dp_ratio, int number_promoted) {
        if (diamond.size() > 0) {
            diamond.sort(Comparator.comparingInt(u -> u.getUserStats().getWeekly_points()));
            int number_demoted = (int) Math.round(dp_ratio * number_promoted);

            for (int i = 0; i < number_demoted; i++) {
                User user = diamond.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(4));
                userRepository.save(user);
            }

        }
    }

    public void changePlatinum(List<User> platinum, double pg_ratio, int number_promoted) {
        if (platinum.size() > 0) {
            platinum.sort(Comparator.comparingInt(u -> u.getUserStats().getWeekly_points()));

            int number_demoted = (int) Math.round(pg_ratio * number_promoted);

            for (int i = 0; i < number_demoted; i++) {
                User user = platinum.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(3));
                userRepository.save(user);
            }

            int promotion = Math.max(number_promoted, platinum.size());
            platinum.sort(Comparator.comparingInt(u -> -u.getUserStats().getWeekly_points()));

            for (int i = 0; i < promotion; i++) {
                User user = platinum.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(5));
                userRepository.save(user);
            }

        }
    }

    public void changeGold(List<User> gold, double gs_ratio, int number_promoted) {
        if (gold.size() > 0) {
            gold.sort(Comparator.comparingInt(u -> u.getUserStats().getWeekly_points()));

            int number_demoted = (int) Math.round(gs_ratio * number_promoted);

            for (int i = 0; i < number_demoted; i++) {
                User user = gold.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(2));
                userRepository.save(user);
            }

            int promotion = Math.max(number_promoted, gold.size());
            gold.sort(Comparator.comparingInt(u -> -u.getUserStats().getWeekly_points()));

            for (int i = 0; i < promotion; i++) {
                User user = gold.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(4));
                userRepository.save(user);
            }
        }
    }


    public void changeSilver(List<User> silver, double sb_ratio, int number_promoted) {
        if (silver.size() > 0) {

            silver.sort(Comparator.comparingInt(u -> u.getUserStats().getWeekly_points()));

            int number_demoted = (int) Math.round(sb_ratio * number_promoted);

            for (int i = 0; i < number_demoted; i++) {
                User user = silver.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(1));
                userRepository.save(user);
            }

            int promotion = Math.max(number_promoted, silver.size());
            silver.sort(Comparator.comparingInt(u -> -u.getUserStats().getWeekly_points()));

            for (int i = 0; i < promotion; i++) {
                User user = silver.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(3));
                userRepository.save(user);
            }
        }
    }

    public void changeBronze(List<User> bronze, int number_promoted) {
        if (bronze.size() > 0) {

            int promotion = Math.max(number_promoted, bronze.size());
            bronze.sort(Comparator.comparingInt(u -> -u.getUserStats().getWeekly_points()));

            for (int i = 0; i < promotion; i++) {
                User user = bronze.get(i);
                user.setPrevious_league(user.getCurrent_league());
                user.setCurrent_league(leagueRepository.getLeagueById(2));
                userRepository.save(user);
        }
        }
    }


    @Override
    public void changeLeagues() {
        int number_promoted = 5;

        List<User> diamond = userRepository.findByCurrentLeagueId(5);
        List<User> platinum = userRepository.findByCurrentLeagueId(4);
        List<User> gold = userRepository.findByCurrentLeagueId(3);
        List<User> silver = userRepository.findByCurrentLeagueId(2);
        List<User> bronze = userRepository.findByCurrentLeagueId(1);

        int diamond_size = diamond.size() == 0 ? 1 : diamond.size();
        int platinum_size = platinum.size() == 0 ? 1 : diamond.size();
        int gold_size = gold.size() == 0 ? 1 : diamond.size();
        int silver_size = silver.size() == 0 ? 1 : diamond.size();
        int bronze_size = bronze.size() == 0 ? 1 : diamond.size();

        double dp_ratio = (double) diamond_size / platinum_size;
        double pg_ratio = (double) platinum_size / gold_size;
        double gs_ratio = (double) gold_size / silver_size;
        double sb_ratio = (double) silver_size / bronze_size;

        changeDiamond(diamond, dp_ratio, number_promoted);
        changePlatinum(platinum, pg_ratio, number_promoted);
        changeGold(gold, gs_ratio, number_promoted);
        changeSilver(silver, sb_ratio, number_promoted);
        changeBronze(bronze, number_promoted);
    }

}
