package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.services.EmailService;
@Controller
public class EmailController {

    @Autowired
    private EmailService emailService;
    @GetMapping(value = "/contactos")
    public ModelAndView contactPage() {
        return new ModelAndView("contactos");
    }

    /*@PostMapping(value = "/recover_password")
    public ModelAndView sendEmailAction(User user) {

        String emailContent = "<html><body>" +
                "<p>Pedido de contacto por: "+user.getEmail()+"</p>"+"<p>Conteúdo:</p> "+"</body></html>";

        emailService.sendRecoveryEmail("filipaacb@outlook.com", "Pedido de Contacto - "+user.getEmail(), emailContent);

        return new ModelAndView("passwordrecovery2");
    }*/



}

