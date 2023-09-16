package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;
import java.text.ParseException;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

@Controller
public class ProfileController {

    @Autowired
    UserRepository userRepository;

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
            @RequestParam(name = "usernamee", required = false) String newUsername,
            @RequestParam(name = "emaill", required = false) String newEmail
    ) throws ParseException {

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

        if (newUsername != null) {
            user.setUsername(newUsername);
        }

        if (newEmail != null) {
            user.setEmail(newEmail);
        }

        userRepository.save(user);

        if (newUsername != null || newEmail != null) {
            return new ModelAndView("redirect:/logout").addObject("redirect", "/login");
        } else  return new ModelAndView("redirect:/profile");

    }

    @GetMapping(value="/edit_profile_avatar")
        public ModelAndView editProfileAvatarPage(Principal principal) {
        String loggedInUsername = principal.getName();
        ModelAndView mav = new ModelAndView("edit_profile_avatar");
        mav.addObject("userr", userRepository.getUserByUsername(loggedInUsername));
        return mav;
    }


}
