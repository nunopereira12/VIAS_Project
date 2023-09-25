package pt.upskill.vias.services.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
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
        if (password != null && !password.equals(confirm_password)) {
            return new ModelAndView("user/edit_profile").addObject("user",user).addObject("password_error","Erro: ");
        }
        if (password != null) {
            authService.replacePassword(user,password);
            return new ModelAndView("redirect:/profile_change_password");
        }

        userRepository.save(user);
        return new ModelAndView("redirect:/edit_profile");
    }
}
