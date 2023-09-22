package pt.upskill.vias.services;

import pt.upskill.vias.entities.user.User;

public interface HomeService {

    User getUserbyUsername(String loggedInUsername);
}
