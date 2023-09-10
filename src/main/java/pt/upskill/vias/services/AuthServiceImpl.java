package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.User;
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

        User userEmail = userRepository.getUserByEmail(username);


        if(user != null && passwordEncoder.matches(password, user.getPassword())) {
            return user;
        }  else if (userEmail != null && passwordEncoder.matches(password, userEmail.getPassword())) {
            return userEmail;
        }

        return null;
    }

    @Override
    public boolean isUsernameTaken(String username) {
        return userRepository.getUserByUsername(username) != null;
    }

    @Override
    public boolean isEmailTaken(String username) {
        return userRepository.getUserByEmail(username) != null;
    }

    @Override
    public boolean arePasswordsEqual(String password, String password2) {

        return password.equals(password2);
    }


    @Override
    public void registerUser(String username, String password, String email, String firstName, String lastName) {
        User user = new User();
        user.setFirstName(firstName);
        user.setLastName(lastName);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }

    @Override
    public User getUserByEmail(String email) {
        return userRepository.getUserByEmail(email);
    }

    @Override
    public void replacePassword(User user, String password) {
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }

}
