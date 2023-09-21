package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.Token;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.Login;
import pt.upskill.vias.models.ReplacePassword;
import pt.upskill.vias.models.SignUp;
import pt.upskill.vias.repositories.TokenRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.auth.AuthService;
import pt.upskill.vias.services.auth.EmailService;

import java.security.Principal;
import java.text.ParseException;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    TokenRepository tokenRepository;
    @Autowired
    EmailService emailService;


    //Login page
    @GetMapping(value = "/login")
    public ModelAndView loginPage(Principal principal) {
        if (principal != null) {
            return new ModelAndView("redirect:/home");
        }
        return new ModelAndView("auth/login");
    }

    //Signup page
    @GetMapping(value = "/signup")
    public ModelAndView signupPage(Principal principal) {
        if (principal != null) {
            //Checkar caminho da /home
            return new ModelAndView("redirect:/home");
        }
        return new ModelAndView("auth/signup");
    }

    //Receive signup form
    @PostMapping(value = "/signup_action")
    public ModelAndView signupAction(SignUp signup_form) throws ParseException {
        if (authService.isSignupPossible(signup_form)) {
            authService.registerUser(signup_form);
            return new ModelAndView("auth/register_success");
        } else {
            return authService.signupErrorMav(signup_form);
        }
    }


    //Click link in activation email
    @GetMapping(value = "/activation_success/{tokenID}")
    public ModelAndView activationSuccess(@PathVariable("tokenID") String tokenID) {

        Token token = tokenRepository.getTokenByTokenId(tokenID);
        if (authService.isActivationPossible(token)) {
            authService.activateUser(token.getUser());
            return new ModelAndView("auth/activation_success");
        } else {
            emailService.sendAccountVerificationEmail(token.getUser().getEmail());
            //CRIAR PÁGINA DE /activation_fail
            return new ModelAndView("auth/activation_fail");
        }
    }

    //Recover Password page
    @GetMapping(value = "/recover_password")
    public ModelAndView recoverPasswordPage(Principal principal) {
        if (principal != null) {
            //Checkar caminho para /home
            return new ModelAndView("redirect:/home");
        }
        return new ModelAndView("auth/recover_password");
    }

    //Receive recover request and send email
    @PostMapping(value = "/recovery_request")
    public ModelAndView recoveryRequestAction(String email) {
        if (authService.isEmailTaken(email) && authService.isUserActive(email)) {
            emailService.sendPasswordRecoveryEmail(userRepository.getUserByEmail(email));
            return new ModelAndView("auth/recovery_email_sent");
        } else {
            ModelAndView mav = new ModelAndView("auth/recover_password");
            //Inserir erro no .jsp
            mav.addObject("email_error", "Email inválido. Tente novamente.");
            return mav;
        }
    }

    //Change Password page
    @GetMapping(value = "/change_password/{tokenID}")
    public ModelAndView recoverPasswordPage(@PathVariable("tokenID") String tokenId) {
        if (authService.isTokenFunctional(tokenId)) {
            return new ModelAndView("auth/change_password");
        }
        ModelAndView mav = new ModelAndView("redirect:/recover_password");
        mav.addObject("token_error", "Link inválido. Tente novamente.");
        return mav;
    }

    //Receive new password form and change password
    @PostMapping(value = "/set_password")
    public ModelAndView replacePassword(ReplacePassword replacePassword, @RequestParam("tokenID") String tokenId) {
        if (authService.areReplacePasswordsEqual(replacePassword)) {
            Token token = tokenRepository.getTokenByTokenId(tokenId);
            authService.replacePassword(token.getUser(), replacePassword.getPassword());
            authService.useToken(token);
            return new ModelAndView("redirect:/login");
        } else {
            ModelAndView mav = new ModelAndView("redirect:/change_password/" + tokenId);
            mav.addObject("password_error");
            mav.addObject("tokenID", tokenId);
            return mav;
        }
    }


    //Receive login info
    @PostMapping(value = "/perform_login")
    public ModelAndView login(Login login) {

        User loggedUser = authService.validateLogin(login.getUsername(), login.getPassword());
        if (loggedUser != null) {
            return new ModelAndView("/home");
        }
        return new ModelAndView("/auth/login");
    }


}