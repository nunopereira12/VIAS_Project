package pt.upskill.vias.services;

import pt.upskill.vias.entities.User;

import java.util.List;

public interface HomeService {

    User getUserbyUsername(String loggedInUsername);
}
