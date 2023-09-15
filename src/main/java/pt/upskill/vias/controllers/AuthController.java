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
import pt.upskill.vias.services.EmailServiceImpl;
import pt.upskill.vias.services.RecoverPasswordService;

import java.security.Principal;
import java.text.ParseException;

@Controller
public class AuthController {

    @Autowired
    AuthService authService;

    @Autowired
    private EmailServiceImpl emailServiceImpl;

    @Autowired
    RecoverPasswordService recoverPasswordService;




    @GetMapping(value = "/login")
    public ModelAndView loginPage(Principal principal) {
        if(principal != null) {
            return new ModelAndView("redirect:/home");
        }
        return new ModelAndView("login");
    }
    @GetMapping(value = "/signup")
    public ModelAndView signupPage(Principal principal) {
        if(principal != null){
            return new ModelAndView("redirect:/home");
        }
        return new ModelAndView("signup");
    }

    @GetMapping(value = "/passwordrecovery")
    public ModelAndView passwordRecoveryPage(Principal principal){
        if(principal != null){
            return new ModelAndView("redirect:/home");
        }
        return new ModelAndView("passwordrecovery");
    }


    //Define o POST para ser enviado o e-mail ao utilizador.
    //Se o e-mail não existir na base de dados, não é enviado nenhum e-mail.
    //O e-mail contém um link (hyperlink) para a página de recuperação de password.


    @PostMapping(value = "/recover_password")
    public ModelAndView passwordRecoveryAction(User user) {
        if (authService.isEmailTaken(user.getEmail())) {
            Token token = recoverPasswordService.generateToken(authService.getUserByEmail(user.getEmail()));

            String emailContent = "<html><body>" +
                    "<p>Para repor a sua palavra-chave, por favor, siga o seguinte link:</p>" +
                    "<a href='http://localhost:8080/passwordrecovery3/" + token.getTokenID() + "'>Recuperação de Password</a>" +
                    "</body></html>";


            emailServiceImpl.sendEmail(user.getEmail(), "Recuperação de Password", emailContent);
        }

        return new ModelAndView("passwordrecovery2");
    }


    //Define o GET para a página de recuperação de password.
    //Se o token não existir, ou já tiver sido utilizado, ou já tiver expirado, é redirecionado para a página de recuperação de password (envio de e-mail).


    @GetMapping(value="/passwordrecovery3/{tokenID}")
    public ModelAndView recoverPasswordPage(@PathVariable("tokenID") String tokenID) {
        Token token = recoverPasswordService.getToken(tokenID);
        if(token != null && !token.isUsed() && !token.isExpired()) {
            return new ModelAndView("passwordrecovery3");
        }
        return new ModelAndView("redirect:/passwordrecovery");

    }

    // Define o POST para a página de recuperação de password.
    // Se as passwords não coincidirem, é redirecionado para a página de recuperação de password (envio de e-mail).
    // Se o token não existir, ou já tiver sido utilizado, ou já tiver expirado, é redirecionado para a página de recuperação de password (envio de e-mail).
    // Se tudo estiver correto, a password é alterada e o token é marcado como utilizado.


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

    //Define o POST para o login.
    //Se o login for bem sucedido, é redirecionado para a página da carteira.
    //Se o login não for bem sucedido, é redirecionado para a página de login.


    @PostMapping(value="/perform_login")
    public ModelAndView login(Login user) {
        User loggedUser = authService.validateLogin(user.getUsername(), user.getPassword());
        if(loggedUser != null) {
            return new ModelAndView("home");
        }
        return new ModelAndView("login");
    }




    //Define o POST para o registo de utilizador.
    //Se o username já existir na base de dados, é informado desse problema.
    //Se o e-mail já existir na base de dados, é é informado desse problema.
    //Se as passwords não coincidirem,  é informado desse problema.
    //Se tudo estiver correto, o utilizador é registado e é redirecionado para a página de login.
    //O utilizador só pode fazer login depois de ativar a conta.
    //O utilizador recebe um e-mail com um link (hyperlink) para ativar a conta.
    //O link (hyperlink) tem um token que é gerado e guardado na base de dados.



    @PostMapping(value = "/signup_action")
    public ModelAndView signUp(SignUp newUser) throws ParseException {
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

        authService.registerUser(newUser.getUsername(), newUser.getPassword(),
                newUser.getEmail(), newUser.getFirstName(), newUser.getLastName(), newUser.getDOB());


        Token token = recoverPasswordService.generateToken(authService.getUserByEmail(newUser.getEmail()));

        String emailContent = "<html><body>" +
                "<p>Para ativar a sua conta, por favor, siga o seguinte link:</p>" +
                "<a href='http://localhost:8080/activation_success/" + token.getTokenID() + "'>Ativar conta</a>" +
                "</body></html>";


        emailServiceImpl.sendEmail(newUser.getEmail(), "Ativação da conta", emailContent);


        return new ModelAndView("register_success");
    }

    @GetMapping(value = "/activation_success/{tokenID}")
    public ModelAndView activationSuccess(@PathVariable("tokenID") String tokenID) {
        Token token = recoverPasswordService.getToken(tokenID);
        if(token != null && !token.isUsed() && !token.isExpired()) {
            authService.activateUser(token.getUser());
            recoverPasswordService.setTokenUsed(token);
            return new ModelAndView("activation_success");
        }
        return new ModelAndView("redirect:/login");
    }


}