package pt.upskill.vias.controllers;

import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.HistoryService;
import pt.upskill.vias.services.QRCodeService;
import pt.upskill.vias.services.routes.info.JSONConversionService;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

@Controller
public class PageController {

    @Autowired
    HistoryService historyService;

    @Autowired
    JSONConversionService jsonConversionService;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    LegRepository legRepository;



    @GetMapping(value = "/settings")
    public ModelAndView settingsPage() {
        return new ModelAndView("settings");
    }
    @GetMapping(value="/ajuda")
    public ModelAndView helpPage() {
        ModelAndView mav = new ModelAndView("help");
        return mav;
    }

    @GetMapping(value ="/history")
    public ModelAndView historyPage(Principal principal){
        ModelAndView mav = new ModelAndView();

        User user = userRepository.getUserByUsername(principal.getName());
        List<Leg> legs = historyService.getUserHistory(true, user);

        jsonConversionService.addStepsLegList(legs);

        mav.addObject("legs", legs);
        mav.addObject("user", user);

        return mav;
    }








}
