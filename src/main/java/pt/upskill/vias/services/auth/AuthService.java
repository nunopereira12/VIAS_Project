package pt.upskill.vias.services.auth;


import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.Token;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.Login;
import pt.upskill.vias.models.ReplacePassword;
import pt.upskill.vias.models.SignUp;

import java.text.ParseException;


public interface AuthService {
    User validateLogin(String username, String password);
    boolean isLoginValid(Login login);
    boolean isUsernameTaken(String username);
    boolean isEmailTaken(String email);
    boolean isSignupPossible(SignUp signup_form);
    boolean isActivationPossible(Token token);
    boolean isUserActive(String email);
    boolean isTokenFunctional(String tokenId);
    ModelAndView signupErrorMav(SignUp signup_form);
    boolean areReplacePasswordsEqual(ReplacePassword replacePassword);
    boolean passwordsMatch(String password, String confirm_password);
    void replacePassword(User user, String password);

    void registerUser(SignUp signup_form) throws ParseException;

    void activateUser(User user);

    void useToken(Token token);
    String generateTokenID();
    Token generateToken(User user);
}
