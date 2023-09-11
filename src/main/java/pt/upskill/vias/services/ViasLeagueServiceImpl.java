package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;

import java.util.List;

@Service
public class ViasLeagueServiceImpl implements ViasLeagueService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public List<User> getUsersByLoggedInUserLeague(String loggedInUsername) {

        User loggedInUser = userRepository.getUserByUsername(loggedInUsername);
        String userLeague = loggedInUser.getLeague();

        return userRepository.findAllByLeague(userLeague);
    }
}
