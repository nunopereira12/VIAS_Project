package pt.upskill.vias.entities.cards;

import pt.upskill.vias.entities.user.User;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import java.util.Date;

@Entity
public class Navegante {

    @Id
    @GeneratedValue
    long id;
    String card_number;
    String name;
    Date expiration_date;
    boolean valid;
    boolean valid_next_month;
    int times_used;
    @OneToOne
    User user;

    public Navegante(User user, String card_number, Date expiration_date) {
        this.card_number = card_number;
        this.name = user.getFirst_name() + " " + user.getLast_name();
        this.expiration_date = expiration_date;
        this.valid = false;
        this.valid_next_month = false;
        this.user = user;
    }

    public Navegante() {}

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getCard_number() {
        return card_number;
    }

    public void setCard_number(String card_number) {
        this.card_number = card_number;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getExpiration_date() {
        return expiration_date;
    }

    public void setExpiration_date(Date expiration_date) {
        this.expiration_date = expiration_date;
    }

    public boolean isValid() {
        return valid;
    }

    public void setValid(boolean valid) {
        this.valid = valid;
    }

    public boolean isValid_next_month() {
        return valid_next_month;
    }

    public void setValid_next_month(boolean valid_next_month) {
        this.valid_next_month = valid_next_month;
    }

    public int getTimes_used() {
        return times_used;
    }

    public void setTimes_used(int times_used) {
        this.times_used = times_used;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String toString() {
        return "Navegante";
    }
}
