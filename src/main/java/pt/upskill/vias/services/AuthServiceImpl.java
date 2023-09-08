package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.SignUp;
import pt.upskill.vias.repositories.UserRepository;

@Service
public class AuthServiceImpl implements AuthService {

    @Autowired
    UserRepository userRepository;
    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);

    /*public void signUp(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
    }*/

    @Override
    public User validateLogin(String username, String password) {
        User user = userRepository.getUserByUsername(username);
        if(user != null && passwordEncoder.matches(password, user.getPassword())) {
            return user;
        }
        return null;
    }

    @Override
    public boolean isUsernameTaken(String username) {
        return userRepository.getUserByUsername(username) != null;
    }

    @Override
    public void registerUser(String username, String password) {
        User user = new User();
        user.setUsername(username);
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }

}
