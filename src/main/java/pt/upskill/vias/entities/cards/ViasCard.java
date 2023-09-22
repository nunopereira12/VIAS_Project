package pt.upskill.vias.entities.cards;

import pt.upskill.vias.entities.user.User;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class ViasCard {

    @Id
    @GeneratedValue
    long card_number;
    double balance;
    int times_used;
    @OneToOne
    User user;

    public long getCard_number() {
        return card_number;
    }

    public void setCard_number(long card_number) {
        this.card_number = card_number;
    }

    public double getBalance() {
        return balance;
    }

    public void setBalance(double balance) {
        this.balance = balance;
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
}
