package pt.upskill.vias.entities.user;

import pt.upskill.vias.entities.League;

import javax.persistence.*;
import java.util.Date;

@Entity
public class User {

    @Id
    @GeneratedValue
    private long id;
    private String first_name;
    private String last_name;
    private Date birthday;
    private String username;
    private String password;
    private String email;
    @ManyToOne
    private League current_league;
    @ManyToOne
    private League previous_league;
    @OneToOne
    private UserStats user_stats;
    private String role;
    private boolean activated;
    private String profile_picture;

    public User() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public League getCurrent_league() {
        return current_league;
    }

    public void setCurrent_league(League current_league) {
        this.current_league = current_league;
    }

    public League getPrevious_league() {
        return previous_league;
    }

    public void setPrevious_league(League previous_league) {
        this.previous_league = previous_league;
    }

    public UserStats getUser_stats() {
        return user_stats;
    }

    public void setUser_stats(UserStats user_stats) {
        this.user_stats = user_stats;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public boolean isActivated() {
        return activated;
    }

    public void setActivated(boolean activated) {
        this.activated = activated;
    }

    public String getProfile_picture() {
        return profile_picture;
    }

    public void setProfile_picture(String profile_picture) {
        this.profile_picture = profile_picture;
    }
}


