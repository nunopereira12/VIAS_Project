package pt.upskill.vias.models.viasleague.entities;


import pt.upskill.vias.entities.User;

import javax.persistence.*;

@Entity
public class UserStats {

    @Id
    @GeneratedValue
    private Long id;
    private int total_distance_walking;
    private int total_distance_transit;
    private int total_time_walking;
    private int total_time_transit;
    private int trips_done;
    private double money_spent;
    private int total_points;
    private int weekly_points;


    public UserStats() {
    }

    public int getTotal_distance_walking() {
        return total_distance_walking;
    }

    public void setTotal_distance_walking(int total_distance_walking) {
        this.total_distance_walking = total_distance_walking;
    }

    public int getTotal_distance_transit() {
        return total_distance_transit;
    }

    public void setTotal_distance_transit(int total_distance_transit) {
        this.total_distance_transit = total_distance_transit;
    }

    public int getTotal_time_walking() {
        return total_time_walking;
    }

    public void setTotal_time_walking(int total_time_walking) {
        this.total_time_walking = total_time_walking;
    }

    public int getTotal_time_transit() {
        return total_time_transit;
    }

    public void setTotal_time_transit(int total_time_transit) {
        this.total_time_transit = total_time_transit;
    }

    public int getTrips_done() {
        return trips_done;
    }

    public void setTrips_done(int trips_done) {
        this.trips_done = trips_done;
    }

    public double getMoney_spent() {
        return money_spent;
    }

    public void setMoney_spent(double money_spent) {
        this.money_spent = money_spent;
    }

    public int getTotal_points() {
        return total_points;
    }

    public void setTotal_points(int total_points) {
        this.total_points = total_points;
    }

    public int getWeekly_points() {
        return weekly_points;
    }

    public void setWeekly_points(int weekly_points) {
        this.weekly_points = weekly_points;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

}
