package pt.upskill.vias.models.viasleague.entities;

import pt.upskill.vias.entities.User;

import javax.persistence.*;

@Entity
public class Trip {

    @Id
    @GeneratedValue
    private long id;

    private int duration;
    private int distance;
    private int time;
    private double numberOfSteps;
    private double fare;
    private int points;

    @ManyToOne
    User user;
}
