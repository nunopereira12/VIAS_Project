package pt.upskill.vias.services;

import pt.upskill.vias.entities.User;

import java.util.List;

public interface ViasLeagueService1 {
    List<User> getUsersByLoggedInUserLeague(String loggedInUsername);

}
