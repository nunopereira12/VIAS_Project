package pt.upskill.vias.services.viasleague;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.repositories.UserRepository;

@Service
public class ViasLeagueService1Impl implements ViasLeagueService1 {

    @Autowired
    private UserRepository userRepository;

    //@Override
    /*public List<User> getUsersByLoggedInUserLeague(String loggedInUsername) {

        User loggedInUser = userRepository.getUserByUsername(loggedInUsername);
        String userLeague = loggedInUser.getLeague().getName();

        return userRepository.findAllByLeague(userLeague);
    }

     */
}
