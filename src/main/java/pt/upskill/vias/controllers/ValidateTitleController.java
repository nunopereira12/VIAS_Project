package pt.upskill.vias.controllers;

import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.QRCodeService;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.Principal;

@Controller
public class ValidateTitleController {

    @Autowired
    private QRCodeService qrCodeService;
    @Autowired
    private UserRepository userRepository;
    @Autowired
    ViasCardRepository viasCardRepository;

    @GetMapping(value = "/validatetitle")
    public ModelAndView validatetitle(Principal principal) {
        ModelAndView mav = new ModelAndView("validatetitle");
        User user = userRepository.getUserByUsername(principal.getName());
        mav.addObject("user", user);
        return mav;
    }


    @GetMapping(value = "/generateQRCode/{cardData}", produces = "image/png")
    @ResponseBody
    public byte[] generateQRCode(@PathVariable String cardData) throws IOException, WriterException {
        //falta verificar se é do navegante ou do viascard
        BufferedImage qrCodeImage = qrCodeService.generateQRCode(cardData);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(qrCodeImage, "png", baos);
        return baos.toByteArray();
    }


/*
    @GetMapping(value = "/generateQRCode/{cardId}", produces = "image/png")
    @ResponseBody
    public byte[] generateQRCode(@PathVariable Long cardId) throws IOException, WriterException {
        // Retrieve the UserCard based on the cardId (you'll need to implement this logic)
        ViasCard vais_card = userCardService.getUserCardById(cardId);

        if (userCard != null) {

            BufferedImage qrCodeImage = qrCodeService.generateQRCode(userCard);
            ByteArrayOutputStream baos = new ByteArrayOutputStream();
            ImageIO.write(qrCodeImage, "png", baos);
            return baos.toByteArray();
        } else {

            return new byte[0]; // Empty response
        }
    }*/

}
