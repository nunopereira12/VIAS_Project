package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;

import java.util.List;

@Service
public class HomeServiceImpl implements HomeService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User getUserbyUsername(String loggedInUsername) {
        return userRepository.getUserByUsername(loggedInUsername);
    }

}
