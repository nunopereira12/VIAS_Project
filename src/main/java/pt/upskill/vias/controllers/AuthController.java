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
import pt.upskill.vias.services.AuthService;
import pt.upskill.vias.services.EmailService;
import pt.upskill.vias.services.RecoverPasswordService;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;

    @Autowired
    private EmailService emailService;

    @Autowired
    RecoverPasswordService recoverPasswordService;



    @GetMapping(value = "/login")
    public ModelAndView loginPage() {
        return new ModelAndView("login");
    }
    @GetMapping(value = "/signup")
    public ModelAndView signupPage() {
        return new ModelAndView("signup");
    }

    @GetMapping(value = "/passwordrecovery")
    public ModelAndView passwordRecoveryPage() {
        return new ModelAndView("passwordrecovery");
    }

    @PostMapping(value = "/recover_password")
    public ModelAndView passwordRecoveryAction(User user) {
        if (authService.isEmailTaken(user.getEmail())) {
            Token token = recoverPasswordService.generateToken(authService.getUserByEmail(user.getEmail()));

            String emailContent = "<html><body>" +
                    "<p>Para repor a sua palavra-chave, por favor, siga o seguinte link:</p>" +
                    "<a href='http://localhost:8080/passwordrecovery3/" + token.getTokenID() + "'>Recuperação de Password</a>" +
                    "</body></html>";


            emailService.sendRecoveryEmail(user.getEmail(), "Recuperação de Password", emailContent);
        }

        return new ModelAndView("passwordrecovery2");
    }

    @GetMapping(value="/passwordrecovery3/{tokenID}")
    public ModelAndView recoverPasswordPage(@PathVariable("tokenID") String tokenID) {
        Token token = recoverPasswordService.getToken(tokenID);
        if(token != null && !token.isUsed() && !token.isExpired()) {
            return new ModelAndView("passwordrecovery3");
        }
        return new ModelAndView("redirect:/passwordrecovery");

    }

    @PostMapping(value="/replace_pw/")
    public ModelAndView replacePassword(ReplacePassword replacePassword, @RequestParam("tokenID") String tokenID ) {
        Token token = recoverPasswordService.getToken(tokenID);
        if(token != null) {
            if (!authService.arePasswordsEqual(replacePassword.getPassword(), replacePassword.getConfirmPassword())) {
                ModelAndView modelAndView = new ModelAndView("redirect:/passwordrecovery3/{tokenID}");
                modelAndView.addObject("error");
                modelAndView.addObject("tokenID", tokenID);
                return modelAndView;
            }
            authService.replacePassword(token.getUser(), replacePassword.getPassword());
            recoverPasswordService.setTokenUsed(token);
            return new ModelAndView("redirect:/login");
        }
        return new ModelAndView("redirect:/passwordrecovery");
    }

    @PostMapping(value="/perform_login")
    public ModelAndView login(Login user) {
        User loggedUser = authService.validateLogin(user.getUsername(), user.getPassword());
        if(loggedUser != null) {
            return new ModelAndView("redirect:/wallet");
        }
        return new ModelAndView("login");
    }

    @PostMapping(value = "/signup_action")
    public ModelAndView signUp(SignUp newUser) {
        if (authService.isUsernameTaken(newUser.getUsername())){
            ModelAndView modelAndView = new ModelAndView("signup");
            modelAndView.addObject("error", "Username não está disponível.");
            return modelAndView;
        } else if (authService.isEmailTaken(newUser.getEmail())) {
            ModelAndView modelAndView = new ModelAndView("signup");
            modelAndView.addObject("error2", "Email não está disponível.");
            return modelAndView;

        }
        else if (!authService.arePasswordsEqual(newUser.getPassword(), newUser.getConfirmPassword())) {
            ModelAndView modelAndView = new ModelAndView("signup");
            modelAndView.addObject("error3", "Passwords não coincidem.");
            return modelAndView;
        }

        authService.registerUser(newUser.getUsername(), newUser.getPassword(), newUser.getEmail(), newUser.getFirstName(), newUser.getLastName());

        return new ModelAndView("redirect:/login");
    }

}