package pt.upskill.vias.services.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.utils.CalendarService;
import pt.upskill.vias.services.auth.AuthService;

import java.security.Principal;
import java.text.ParseException;

@Service
public class ProfileServiceImpl implements ProfileService{

    @Autowired
    UserRepository userRepository;
    @Autowired
    AuthService authService;
    @Autowired
    CalendarService calendarService;

    @Override
    public ModelAndView updateUserInfo(Principal principal, String first_name, String last_name, String date, String password, String confirm_password) throws ParseException {
        User user = userRepository.getUserByUsername(principal.getName());

        if (first_name != null) {
            user.setFirst_name(first_name);
        }
        if (last_name != null) {
            user.setLast_name(last_name);
        }
        if (date != null) {
            user.setBirthday(calendarService.parseDate(date));
        }
        if (password != null && password.equals(confirm_password)) {
            authService.replacePassword(user,password);
            //falta mensagem a avisar que terá de fazer login e novo
            return new ModelAndView("redirect:/logout").addObject("redirect", "/login");
        } //caso as passwords n sejam identicas, acrescentar um erro no edit

        userRepository.save(user);
        return new ModelAndView("redirect:/profile");
    }
}
