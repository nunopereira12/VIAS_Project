package pt.upskill.vias.models.routes;

import pt.upskill.vias.entities.user.User;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
public class Leg {


    @Id
    @GeneratedValue
    private long id;
    private String departure_time;
    private String arrival_time;
    private String distance;
    private String duration;
    private String start_address;
    private String end_address;
    private String fare;
    @Column(length = 256000)
    private String overview_polyline;
    private int points;
    private boolean trip_completed = false;
    @ManyToOne
    private User user;
    @Column(length = 256000)
    private String json_steps;
    @Transient
    private List<Step> steps = new ArrayList<>();

    public Leg() {
    }

    public Leg(String departure_time, String arrival_time, String distance, String duration, String start_address, String end_address, String overview_polyline, String fare) {
        this.departure_time = departure_time;
        this.arrival_time = arrival_time;
        this.distance = distance;
        this.duration = duration;
        this.start_address = start_address;
        this.end_address = end_address;
        this.overview_polyline = overview_polyline;
        this.fare = fare;
    }

    public void addStep(Step step) {
        steps.add(step);

    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
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

    public String getStart_address() {
        return start_address;
    }

    public void setStart_address(String start_address) {
        this.start_address = start_address;
    }

    public String getEnd_address() {
        return end_address;
    }

    public void setEnd_address(String end_address) {
        this.end_address = end_address;
    }

    public String getFare() {
        return fare;
    }

    public void setFare(String fare) {
        this.fare = fare;
    }

    public String getOverview_polyline() {
        return overview_polyline;
    }

    public void setOverview_polyline(String overview_polyline) {
        this.overview_polyline = overview_polyline;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public boolean isTrip_completed() {
        return trip_completed;
    }

    public void setTrip_completed(boolean trip_completed) {
        this.trip_completed = trip_completed;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getJson_steps() {
        return json_steps;
    }

    public void setJson_steps(String json_steps) {
        this.json_steps = json_steps;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }
}


