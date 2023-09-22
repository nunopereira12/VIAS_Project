package pt.upskill.vias.services.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.Role;
import pt.upskill.vias.entities.user.Token;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.entities.user.UserStats;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.models.auth.ReplacePassword;
import pt.upskill.vias.models.auth.SignUp;
import pt.upskill.vias.repositories.*;
import pt.upskill.vias.services.utils.CalendarService;

import java.security.SecureRandom;
import java.text.ParseException;
import java.util.Date;


@Service
public class AuthServiceImpl implements AuthService {

    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int TOKEN_LENGTH = 24;
    @Autowired
    UserRepository userRepository;
    @Autowired
    UserStatsRepository userStatsRepository;
    @Autowired
    LeagueRepository leagueRepository;
    @Autowired
    ViasCardRepository viasCardRepository;
    @Autowired
    EmailService emailService;
    @Autowired
    TokenRepository tokenRepository;
    @Autowired
    CalendarService calendarService;

    PasswordEncoder passwordEncoder = new BCryptPasswordEncoder(12);

    @Override
    public User validateLogin(String login_credential, String password) {

        User user = userRepository.getUserByUsername(login_credential);

        User user_email = userRepository.getUserByEmail(login_credential);


        if (user != null && user.isActivated() && passwordEncoder.matches(password, user.getPassword())) {
            return user;
        }
        if (user_email != null && user_email.isActivated() && passwordEncoder.matches(password, user_email.getPassword())) {
            return user_email;
        }

        return null;
    }

    @Override
    public boolean isUsernameTaken(String username) {
        return userRepository.getUserByUsername(username) != null;
    }

    @Override
    public boolean isEmailTaken(String email) {
        return userRepository.getUserByEmail(email) != null;
    }

    @Override
    public boolean isSignupPossible(SignUp signUp_form) {
        return !isUsernameTaken(signUp_form.getUsername()) && !isEmailTaken(signUp_form.getEmail()) && passwordsMatch(signUp_form.getPassword(), signUp_form.getConfirm_password());
    }

    @Override
    public boolean isActivationPossible(Token token) {
        return token != null && !token.isUsed() && !token.isExpired();
    }

    @Override
    public boolean isUserActive(String email) {
        User user = userRepository.getUserByEmail(email);
        return user != null && user.isActivated();
    }

    @Override
    public boolean isTokenFunctional(String tokenId) {
        Token token = tokenRepository.getTokenByTokenId(tokenId);
        return token != null && !token.isUsed() && !token.isExpired();
    }

    @Override
    public boolean areReplacePasswordsEqual(ReplacePassword replacePassword) {
        return replacePassword.getPassword().equals(replacePassword.getConfirm_password());
    }

    @Override
    public ModelAndView signupErrorMav(SignUp signUp_form) {
        ModelAndView mav = new ModelAndView("auth/signup");
        if (isUsernameTaken(signUp_form.getUsername())) {
            mav.addObject("username_unavailable", "Username não está disponível.");
        }
        if (isEmailTaken(signUp_form.getEmail())) {
            mav.addObject("email_unavailable", "Email não está disponível.");
        }
        if (!passwordsMatch(signUp_form.getPassword(), signUp_form.getConfirm_password())) {
            mav.addObject("passwords_different", "Passwords não coincidem.");
        }
        return mav;
    }

    public boolean passwordsMatch(String password, String confirm_password) {
        return password.equals(confirm_password);
    }

    @Override
    public void replacePassword(User user, String password) {
        user.setPassword(passwordEncoder.encode(password));
        userRepository.save(user);
    }

    @Override
    public void registerUser(SignUp signUp_form) throws ParseException {

        User user = new User();

        user.setFirst_name(signUp_form.getFirst_name());
        user.setLast_name(signUp_form.getLast_name());
        user.setBirthday(calendarService.parseDate(signUp_form.getBirthday()));
        user.setUsername(signUp_form.getUsername());
        user.setEmail(signUp_form.getEmail());
        user.setPassword(passwordEncoder.encode(signUp_form.getPassword()));
        user.setRole(Role.USER);
        user.setCurrent_league(leagueRepository.getLeagueById(1));
        user.setProfile_picture("default_profile_pic.png");

        UserStats userStats = new UserStats();
        userStatsRepository.save(userStats);

        ViasCard viasCard = new ViasCard();
        viasCardRepository.save(viasCard);

        user.setUser_stats(userStats);
        viasCard.setUser(user);
        userRepository.save(user);

        emailService.sendAccountVerificationEmail(user.getEmail());
    }

    @Override
    public void activateUser(User user) {
        user.setActivated(true);
        userRepository.save(user);
        useToken(tokenRepository.getTokenByUser(user));
    }

    @Override
    public void useToken(Token token) {
        token.setUsed(true);
        tokenRepository.save(token);
    }

    @Override
    public Token generateToken(User user) {
        Token token = new Token();
        token.setUser(user);
        String tokenId = generateTokenID();
        while(tokenRepository.getTokenByTokenId(tokenId) != null) {
            tokenId = generateTokenID();
        }
        token.setTokenId(tokenId);
        token.setTimestamp(new Date());
        tokenRepository.save(token);
        return token;
    }

    @Override
    public String generateTokenID() {
        StringBuilder token = new StringBuilder(TOKEN_LENGTH);
        SecureRandom sr = new SecureRandom();

        for (int i = 0; i < TOKEN_LENGTH; i++) {
            int randomIndex = sr.nextInt(CHARACTERS.length());
            char randomChar = CHARACTERS.charAt(randomIndex);
            token.append(randomChar);
        }

        return token.toString();
    }

}
