package pt.upskill.vias.models;

import java.util.Date;

public class SignUp {
    private String firstName;
    private String lastName;
    private String username;
    private Date DOB;
    private String password;

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getUsername() {
        return username;
    }

    public Date getDOB() {
        return DOB;
    }

    public String getPassword() {
        return password;
    }
}
