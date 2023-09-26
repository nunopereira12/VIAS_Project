package pt.upskill.vias.services.auth;


import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.Token;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.exceptions.*;
import pt.upskill.vias.models.auth.ReplacePassword;
import pt.upskill.vias.models.auth.SignUp;

import java.text.ParseException;


public interface AuthService {
    User validateLogin(String username, String password);
    boolean isUsernameTaken(String username);
    boolean isEmailTaken(String email);
    boolean isSignupPossible(SignUp signUp_form) throws DifferentPasswordsException, UnavailableEmailException, UnavailableUsernameException, UsernameAndPasswordException, EmailAndPasswordException, UsernameAndEmailException, UsernameEmailPasswordException;
    boolean isUserActive(String email);
    boolean isTokenFunctional(String tokenId);
    boolean areReplacePasswordsEqual(ReplacePassword replacePassword);
    boolean passwordsMatch(String password, String confirm_password);
    void replacePassword(User user, String password);
    void registerUser(SignUp signUp_form) throws ParseException, UnavailableUsernameException, UnavailableEmailException, DifferentPasswordsException, UsernameAndPasswordException, EmailAndPasswordException, UsernameAndEmailException, UsernameEmailPasswordException;
    void activateUser(Token token) throws AccountActivationException;
    void useToken(Token token);
    String generateTokenID();
    Token generateToken(User user);
}
