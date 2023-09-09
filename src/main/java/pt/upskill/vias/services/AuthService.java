package pt.upskill.vias.services;


import pt.upskill.vias.entities.User;

import java.util.Date;

public interface AuthService {
    User validateLogin(String username, String password);
    boolean isUsernameTaken(String username);
    boolean isEmailTaken(String username);
    void registerUser(String username, String password, String email, String firstName, String lastName);

}
