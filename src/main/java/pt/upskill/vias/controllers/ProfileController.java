package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.auth.AuthService;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;

@Controller
public class ProfileController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    AuthService authService;

    @GetMapping(value="/profile")
    public ModelAndView profilePage(Principal principal) {
        String loggedInUsername = principal.getName();

        ModelAndView mav = new ModelAndView("profile");
        mav.addObject("userr", userRepository.getUserByUsername(loggedInUsername));
        return mav;
    }

    @GetMapping(value="/edit_profile")
    public ModelAndView editProfilePage(Principal principal) {
        String loggedInUsername = principal.getName();
        ModelAndView mav = new ModelAndView("edit_profile");
        mav.addObject("userr", userRepository.getUserByUsername(loggedInUsername));
        return mav;
    }

    @PostMapping(value="update_user")
    public ModelAndView updateProfile(
            Principal principal,
            @RequestParam(name = "firstName", required = false) String newFirstName,
            @RequestParam(name = "lastName", required = false) String newLastName,
            @RequestParam(name = "datee", required = false) String newDate,
            @RequestParam(name = "password1", required = false) String password1,
            @RequestParam(name = "password2", required = false) String password2) throws ParseException {

        String loggedInUsername = principal.getName();
        User user = userRepository.getUserByUsername(loggedInUsername);

        if (newFirstName != null) {
            user.setFirstName(newFirstName);
        }

        if (newLastName != null) {
            user.setLastName(newLastName);
        }

        if (newDate != null) {
            Date date = user.parseDate2(newDate);
            user.setBirthday(date);
        }

        if (password1 != null && password1.equals(password2)) {
            authService.replacePassword(user,password1);
            //falta mensagem a avisar que terá de fazer login e novo
            return new ModelAndView("redirect:/logout").addObject("redirect", "/login");
        } //caso as passwords n sejam identicas, acrescentar um erro no edit

        userRepository.save(user);

        return new ModelAndView("redirect:/profile");

    }

}
