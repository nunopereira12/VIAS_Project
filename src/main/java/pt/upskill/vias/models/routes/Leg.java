package pt.upskill.vias.models.routes;

import java.util.ArrayList;
import java.util.List;

public class Leg {

    private String departure_time;
    private String arrival_time;
    private String distance;
    private String duration;
    private String fare;
    private List<Step> steps = new ArrayList<>();


    public Leg(){}

    public Leg(String departure_time, String arrival_time, String distance, String duration, String fare) {
        this.departure_time = departure_time;
        this.arrival_time = arrival_time;
        this.distance = distance;
        this.duration = duration;
        this.fare = fare;
    }

    public void addStep(Step step) {
        steps.add(step);

    }

    public String getDeparture_time() {
        return departure_time;
    }

    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
    }

    public String getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getFare() {
        return fare;
    }

    public void setFare(String fare) {
        this.fare = fare;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }
}
