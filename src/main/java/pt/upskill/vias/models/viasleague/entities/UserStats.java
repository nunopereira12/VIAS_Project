package pt.upskill.vias.models.viasleague.entities;

import pt.upskill.vias.models.viasleague.League;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;


public class UserStats {


    int total_distance;
    int total_distance_walking;
    int total_distance_transit;
    int time_traveled;
    int trips_done;
    double money_spent;
    int total_points;
    int weekly_points;
    private League current_league;
    private League last_league;


}
