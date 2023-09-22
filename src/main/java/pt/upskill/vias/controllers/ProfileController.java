package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.profile.HistoryService;
import pt.upskill.vias.services.routes.info.JSONConversionService;
import pt.upskill.vias.services.utils.CalendarService;
import pt.upskill.vias.services.profile.ProfileService;
import pt.upskill.vias.services.auth.AuthService;

import java.security.Principal;
import java.text.ParseException;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    UserRepository userRepository;
    @Autowired
    AuthService authService;
    @Autowired
    ProfileService profileService;
    @Autowired
    CalendarService calendarService;
    @Autowired
    HistoryService historyService;
    @Autowired
    JSONConversionService jsonConversionService;

    @GetMapping(value="/profile")
    public ModelAndView profilePage(Principal principal) {
        String username = principal.getName();
        ModelAndView mav = new ModelAndView("user/profile");
        User user = userRepository.getUserByUsername(username);
        mav.addObject("user", user);
        mav.addObject("birthday", calendarService.dateToString(user.getBirthday()));
        return mav;
    }

    @GetMapping(value="/edit_profile")
    public ModelAndView editProfilePage(Principal principal) {
        String username = principal.getName();
        ModelAndView mav = new ModelAndView("user/edit_profile");
        mav.addObject("user", userRepository.getUserByUsername(username));
        return mav;
    }

    @PostMapping(value="update_user")
    public ModelAndView updateProfile(
            Principal principal,
            @RequestParam(name = "first_name", required = false) String first_name,
            @RequestParam(name = "last_name", required = false) String last_name,
            @RequestParam(name = "date", required = false) String date,
            @RequestParam(name = "password", required = false) String password,
            @RequestParam(name = "confirm_password", required = false) String confirm_password) throws ParseException {

        return profileService.updateUserInfo(principal, first_name, last_name, date, password, confirm_password);

    }

    @GetMapping(value ="/history")
    public ModelAndView historyPage(Principal principal){
        ModelAndView mav = new ModelAndView("user/history");

        User user = userRepository.getUserByUsername(principal.getName());
        List<Leg> legs = historyService.getUserHistory(user);

        jsonConversionService.addStepsLegList(legs);

        mav.addObject("legs", legs);
        mav.addObject("user", user);

        return mav;
    }

}
