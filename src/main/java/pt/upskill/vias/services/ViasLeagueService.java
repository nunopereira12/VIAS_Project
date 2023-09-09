package pt.upskill.vias.services;

import pt.upskill.vias.entities.User;

import java.util.List;

public interface ViasLeagueService {
    List<User> getUsersByLoggedInUserLeague(String loggedInUsername);

}
