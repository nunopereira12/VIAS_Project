package pt.upskill.vias.services.profile;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;
import java.text.ParseException;

public interface ProfileService {

    ModelAndView updateUserInfo(Principal principal, String first_name, String last_name, String date, String password, String confirm_password) throws ParseException;
}
