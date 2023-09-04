package pt.upskill.vias.services;

import pt.upskill.vias.entities.User;

public interface AuthService {
    User validateLogin(String username, String password);
}
