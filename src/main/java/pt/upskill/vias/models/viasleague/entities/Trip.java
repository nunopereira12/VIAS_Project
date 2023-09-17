package pt.upskill.vias.models.viasleague.entities;

import pt.upskill.vias.entities.User;

import javax.persistence.*;

@Entity
public class Trip {

    @Id
    @GeneratedValue
    private long id;

    private String duration;
    private int distance;
    private int time;
    private double numberOfSteps;
    private double fare;
    private int points;

    @ManyToOne
    User user;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getDistance() {
        return distance;
    }

    public void setDistance(int distance) {
        this.distance = distance;
    }

    public int getTime() {
        return time;
    }

    public void setTime(int time) {
        this.time = time;
    }

    public double getNumberOfSteps() {
        return numberOfSteps;
    }

    public void setNumberOfSteps(double numberOfSteps) {
        this.numberOfSteps = numberOfSteps;
    }

    public double getFare() {
        return fare;
    }

    public void setFare(double fare) {
        this.fare = fare;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
