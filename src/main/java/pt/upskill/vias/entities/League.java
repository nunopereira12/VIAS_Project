package pt.upskill.vias.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import java.util.Date;

@Entity
public class League {

    @Id
    private long id;
    private String name;


    public long getId() {
        return id;
    }

    public String getName() {
        return name;
    }

}
