package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.CalendarService;
import pt.upskill.vias.services.cards.NaveganteService;

import javax.servlet.http.HttpSession;
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
        ModelAndView mav = new ModelAndView("wallet");
        User loggeduser = userRepository.getUserByUsername(principal.getName());
        Navegante navegante = naveganteRepository.getNaveganteByUser(loggeduser);
        String currentDate = calendarService.getCalendar();
        ViasCard viascard = viasCardRepository.getViasCardByUser(loggeduser);
        Date today = new Date();
        mav.addObject("navegante", navegante);
        mav.addObject("currentDate", currentDate);
        mav.addObject("today", today);
        mav.addObject("viascard", viascard);
        mav.addObject("nextMonth", calendarService.getNextMonth());


        return mav;
    }

    @PostMapping(value ="/add_navegante")
    public ModelAndView addNavegante(Principal principal, long naveganteNumber, String expirationDate) throws ParseException {
        User loggeduser = userRepository.getUserByUsername(principal.getName());
        Date date = calendarService.parseDate(expirationDate);

        naveganteService.setNaveganteToUser(loggeduser, naveganteNumber, date);
        return new ModelAndView("redirect:/wallet");



    }

}
