package pt.upskill.vias.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class League {

    @Id
    private long id;
    private String name;
    private Date last_update;


    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public Date getLast_update() {
        return last_update;
    }

    public void setLast_update(Date last_update) {
        this.last_update = last_update;
    }
}
