package pt.upskill.vias.entities;

import javax.persistence.*;
import java.util.Date;


@Entity
public class Token {
    @Id
    @GeneratedValue
    private Long id;
    @OneToOne
    private User user;
    private String tokenID;
    private Date timestamp;

    private boolean used = false;

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }

    public Token() {}

    public Token(User user, String token, Date timestamp) {
        this.user = user;
        this.tokenID = token;
        this.timestamp = timestamp;
    }


    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTokenID() {
        return tokenID;
    }

    public void setTokenID(String token) {
        this.tokenID = token;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    @Override
    public String toString() {
        return "Token{" +
                "id=" + id +
                ", user=" + user +
                ", tokenID='" + tokenID + '\'' +
                ", timestamp=" + timestamp +
                ", used=" + used +
                '}';
    }

    public boolean isExpired() {
        Date now = new Date();
        long diff = now.getTime() - timestamp.getTime();
        long diffMinutes = diff / (60 * 1000) % 60;
        if(diffMinutes > 30) {
            return true;
        }
        return false;
    }
}
