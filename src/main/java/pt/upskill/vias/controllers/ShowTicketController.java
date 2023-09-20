package pt.upskill.vias.controllers;

import com.google.zxing.WriterException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.QRCodeService;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

@Controller
public class ShowTicketController {

    @Autowired
    private QRCodeService qrCodeService;

    @Autowired
    ViasCardRepository viasCardRepository;

    @PostMapping(value = "/showticket")
    public ModelAndView showticket(@RequestParam("card") String cardqr) {
        ModelAndView mav = new ModelAndView("showticket");
        mav.addObject("cardqr", cardqr);
        return mav;
    }


    @GetMapping(value = "/generateQRCode/{cardData}", produces = "image/png")
    @ResponseBody
    public byte[] generateQRCode(@PathVariable String cardData) throws IOException, WriterException {
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
