package pt.upskill.vias.controllers;

import com.google.zxing.WriterException;
import org.apache.hadoop.shaded.org.checkerframework.checker.units.qual.A;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.cards.validate.QRCodeService;
import pt.upskill.vias.services.cards.validate.ValidateService;

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

    @Autowired
    NaveganteRepository naveganteRepository;

    @Autowired
    ValidateService validateService;

    @PostMapping(value = "/show_ticket")
    public ModelAndView showticket(@RequestParam("card") String cardqr) {
        ModelAndView mav = new ModelAndView("user/show_ticket");

        mav.addObject("cardqr", cardqr);
        String card_number = validateService.getCardNumberFromQR(cardqr);
        if(validateService.isNavegante(cardqr)) {
            mav.addObject("card", naveganteRepository.getNaveganteByCard_number(card_number));
        } else {
            mav.addObject("card", viasCardRepository.getViasCardByCard_number(Long.parseLong(card_number)));
        }
        return mav;
    }
    @GetMapping(value = "/generateQRCode/{cardqr}", produces = "image/png")
    @ResponseBody
    public byte[] generateQRCode(@PathVariable String cardqr) throws IOException, WriterException {
        BufferedImage qrCodeImage = qrCodeService.generateQRCode(cardqr);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        ImageIO.write(qrCodeImage, "png", baos);
        return baos.toByteArray();
    }
}
