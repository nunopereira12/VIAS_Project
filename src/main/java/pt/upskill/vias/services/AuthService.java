package pt.upskill.vias.services;


import pt.upskill.vias.entities.User;

import java.text.ParseException;


public interface AuthService {
    User validateLogin(String username, String password);
    boolean isUsernameTaken(String username);
    boolean isEmailTaken(String username);

    boolean arePasswordsEqual(String password, String password2);


    void registerUser(String username, String password, String email, String firstName, String lastName, String birthday) throws ParseException;

    User getUserByEmail(String email);

    void replacePassword(User user, String password);

    void activateUser(User user);
}
