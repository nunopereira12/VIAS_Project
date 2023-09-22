package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.utils.CalendarService;
import pt.upskill.vias.services.cards.NaveganteService;

import java.security.Principal;
import java.text.ParseException;
import java.util.Date;

@Controller
public class WalletController {


    @Autowired
    UserRepository userRepository;
    @Autowired
    NaveganteService naveganteService;
    @Autowired
    NaveganteRepository naveganteRepository;
    @Autowired
    CalendarService calendarService;
    @Autowired
    ViasCardRepository viasCardRepository;


    @GetMapping(value = "/wallet")
    public ModelAndView walletPage(Principal principal) {
        ModelAndView mav = new ModelAndView("user/wallet");

        User user = userRepository.getUserByUsername(principal.getName());

        mav.addObject("navegante", naveganteRepository.getNaveganteByUser(user));
        mav.addObject("current_date", calendarService.getCalendar());
        mav.addObject("today", new Date());
        mav.addObject("vias_card", viasCardRepository.getViasCardByUser(user));
        mav.addObject("next_month", calendarService.getNextMonth());

        return mav;
    }

    @PostMapping(value ="/add_navegante")
    public ModelAndView addNavegante(Principal principal, String navegante_number, String expiration_date) throws ParseException {
        User user = userRepository.getUserByUsername(principal.getName());
        Date date = calendarService.parseDate(expiration_date);

        naveganteService.setNaveganteToUser(user, navegante_number, date);
        return new ModelAndView("redirect:/wallet");



    }

}
