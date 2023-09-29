package pt.upskill.vias.controllers;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import com.stripe.Stripe;
import com.stripe.exception.SignatureVerificationException;

import com.stripe.model.LineItemCollection;
import com.stripe.model.checkout.Session;
import com.stripe.net.Webhook;
import com.stripe.model.Event;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.cards.NaveganteService;
import pt.upskill.vias.services.cards.ViasCardService;
import pt.upskill.vias.services.payments.PaymentService;

import java.util.HashMap;
import java.util.Map;


@Controller
@RequestMapping("/webhooks/stripe/events")
public class StripeWebhookController {

    private static final String WEBHOOK_SECRET = "whsec_H6Z0seBvvXca8T5UjrX7TxE5s2wYtKvg";


    @Autowired
    PaymentService paymentService;
    @Autowired
    UserRepository userRepository;
    @Autowired
    NaveganteRepository naveganteRepository;
    @Autowired
    ViasCardRepository viasCardRepository;
    @Autowired
    NaveganteService naveganteService;
    @Autowired
    ViasCardService viasCardService;


    @PostMapping
    public ResponseEntity<String> handleStripeEvent(@RequestBody String payload, @RequestHeader("Stripe-Signature") String signature) {
        try {

            paymentService.processPayment(payload, signature, WEBHOOK_SECRET);



            return ResponseEntity.ok("Received Stripe event.");
        } catch (SignatureVerificationException e) {

            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid Stripe event signature.");
        } catch (Exception e) {

            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error handling Stripe event.");
        }
    }

}





