package pt.upskill.vias.entities.user;

import pt.upskill.vias.entities.user.User;

import javax.persistence.*;
import java.util.Date;


@Entity
public class Token {
    @Id
    @GeneratedValue
    private Long id;
    @OneToOne
    private User user;
    private String tokenId;
    private Date timestamp;
    private boolean used;

    public Token() {}

    public boolean isExpired() {
        Date now = new Date();
        long diff = now.getTime() - timestamp.getTime();
        long diffMinutes = diff / (60 * 1000) % 60;
        if(diffMinutes > 30) {
            return true;
        }
        return false;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTokenId() {
        return tokenId;
    }

    public void setTokenId(String tokenId) {
        this.tokenId = tokenId;
    }

    public Date getTimestamp() {
        return timestamp;
    }

    public void setTimestamp(Date timestamp) {
        this.timestamp = timestamp;
    }

    public boolean isUsed() {
        return used;
    }

    public void setUsed(boolean used) {
        this.used = used;
    }
}
