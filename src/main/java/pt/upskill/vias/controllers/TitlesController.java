package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.TravelCard;
import pt.upskill.vias.repositories.UserRepository;

import java.security.Principal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Controller
public class TitlesController {

    @Autowired
    private UserRepository userRepository;

    @GetMapping(value="/titles")
    public ModelAndView titlesPage(Principal principal) {
        String loggedInUsername = principal.getName();
        ModelAndView mav = new ModelAndView("titles");
        mav.addObject("user", userRepository.getUserByUsername(loggedInUsername));

        Date currentDate = new Date();
        List<TravelCard> cards = new ArrayList<>();
        TravelCard t1 = new TravelCard(3023,"Zapping",currentDate);
        TravelCard t2 = new TravelCard(3423,"Coise",currentDate);
        TravelCard t3 = new TravelCard(3243,"2 Zonas",currentDate);
        cards.add(t1);
        cards.add(t2);
        cards.add(t3);

        if(principal == null) {
            return new ModelAndView("login");
        }

        mav.addObject("userTickets", cards);
        return mav;
    }
}
