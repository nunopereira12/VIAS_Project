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
            // Verify the event signature to ensure it's from Stripe
            Event event = Webhook.constructEvent(payload, signature, WEBHOOK_SECRET);


            if ("checkout.session.completed".equals(event.getType())) {
                ObjectMapper mapper = new ObjectMapper();
                JsonNode jsonNode = mapper.readTree(payload);
                String email = jsonNode
                        .get("data")
                        .get("object")
                        .get("customer_details")
                        .get("email")
                        .asText();

                long amount_Total = jsonNode
                        .get("data")
                        .get("object")
                        .get("amount_total")
                        .asLong();

                String idValue = jsonNode
                        .get("data")
                        .get("object")
                        .get("id")
                        .asText();

                User user = userRepository.getUserByEmail(email);
                Navegante navegante = naveganteRepository.getNaveganteByUser(user);
                ViasCard viasCard = viasCardRepository.getViasCardByUser(user);
                long amount = amount_Total/100;

                Stripe.apiKey = "sk_test_51NuelYBvwGTopoOtLCiGZQgBZKWaX0MoyzEil96jNYabGSRs5q6bnExplsejHRLVnTbZzuaR2dsnEiGkAM1vAbEB004I5SHK6v";
                Session session = Session.retrieve(idValue);
                Map<String, Object> params = new HashMap<>();
                params.put("limit", 5); // Set your desired limit
                LineItemCollection lineItems = session.listLineItems(params);

                if (lineItems.getData().get(0).getPrice().getId().equals("price_1NugiRBvwGTopoOtVtWow0hT")){
                    viasCardService.chargeCard(viasCard, amount);
                }
                else if (lineItems.getData().get(0).getPrice().getId().equals("price_1NugZ9BvwGTopoOtfqOPqrPu")){
                    naveganteService.chargeCard(navegante);
                }

            }



        // Respond with a 200 OK to acknowledge receipt of the event
            return ResponseEntity.ok("Received Stripe event.");
        } catch (SignatureVerificationException e) {
            // The event signature verification failed
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid Stripe event signature.");
        } catch (Exception e) {
            // Handle other exceptions as needed
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error handling Stripe event.");
        }
    }

}





