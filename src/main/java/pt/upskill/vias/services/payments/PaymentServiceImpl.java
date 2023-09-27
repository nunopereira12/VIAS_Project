package pt.upskill.vias.services.payments;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.stripe.Stripe;
import com.stripe.exception.*;
import com.stripe.model.Customer;
import com.stripe.model.CustomerCollection;
import com.stripe.model.Event;
import com.stripe.model.LineItemCollection;
import com.stripe.model.checkout.Session;
import com.stripe.net.Webhook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.cards.NaveganteService;
import pt.upskill.vias.services.cards.ViasCardService;

import java.util.HashMap;
import java.util.Map;

@Service
public class PaymentServiceImpl implements PaymentService{
    @Autowired
    NaveganteRepository naveganteRepository;

    @Autowired
    ViasCardRepository viasCardRepository;

    @Autowired
    NaveganteService naveganteService;

    @Autowired
    ViasCardService viasCardService;
    @Autowired
    UserRepository userRepository;


    private static final String TEST_STRIPE_SECRET_KEY = "sk_test_51NuelYBvwGTopoOtLCiGZQgBZKWaX0MoyzEil96jNYabGSRs5q6bnExplsejHRLVnTbZzuaR2dsnEiGkAM1vAbEB004I5SHK6v";

    public PaymentServiceImpl() {
        Stripe.apiKey = TEST_STRIPE_SECRET_KEY;
    }


    @Override
    public boolean isNavegante(String navegante_id) {
        return navegante_id != null;
    }

    @Override
    public ModelAndView selectForPaymentPage(String navegante_id, Long vias_card_id,ModelAndView mav) {

        if(isNavegante(navegante_id)){
            mav.addObject("navegante",naveganteRepository.getNaveganteByCard_number(navegante_id));
        }
        else{
            mav.addObject("vias",viasCardRepository.getViasCardByCard_number(vias_card_id));
        }
        return mav;
    }

    @Override
    public void processPayment(Long vias_card_id, String navegante_id, String value) {
        if(isNavegante(navegante_id)){
            Navegante nav = naveganteRepository.getNaveganteByCard_number(navegante_id);
            naveganteService.chargeCard(nav);
        }
        else{
            ViasCard vc = viasCardRepository.getViasCardByCard_number(vias_card_id);
            double vc_value = Double.parseDouble(value);
            viasCardService.chargeCard(vc, vc_value);
        }
    }

    @Override
    public String createCustomer(User user) {
        // Check if a customer with the given email already exists
        Customer existingCustomer = findCustomerByEmail(user.getEmail());

        if (existingCustomer != null) {
            // Customer already exists, return the existing customer's ID
            return existingCustomer.getId();
        }

        Map<String, Object> customerParams = new HashMap<String, Object>();
        customerParams.put("description", user.getFirst_name() + " " + user.getLast_name());
        customerParams.put("email", user.getEmail());

        String customerId = null;

        try {
            // Create customer
            Customer stripeCustomer = Customer.create(customerParams);
            customerId = stripeCustomer.getId();
        } catch (RateLimitException e) {
            // Handle rate limit exception
        } catch (InvalidRequestException e) {
            // Handle invalid request exception
        } catch (AuthenticationException e) {
            // Handle authentication exception
        } catch (StripeException e) {
            // Handle generic Stripe exception
        } catch (Exception e) {
            // Handle other exceptions
        }

        return customerId;
    }

    @Override
    public void processPayment(String payload, String signature, String secret) throws StripeException, JsonProcessingException {
        // Verify the event signature to ensure it's from Stripe
        Event event = Webhook.constructEvent(payload, signature, secret);


        if ("checkout.session.completed".equals(event.getType())) {
            ObjectMapper mapper = new ObjectMapper();
            JsonNode jsonNode = mapper.readTree(payload);
            String email = jsonNode
                    .get("data")
                    .get("object")
                    .get("customer_details")
                    .get("email")
                    .asText();

            double amount_Total = jsonNode
                    .get("data")
                    .get("object")
                    .get("amount_total")
                    .asDouble();

            String idValue = jsonNode
                    .get("data")
                    .get("object")
                    .get("id")
                    .asText();

            User user = userRepository.getUserByEmail(email);
            Navegante navegante = naveganteRepository.getNaveganteByUser(user);
            ViasCard viasCard = viasCardRepository.getViasCardByUser(user);
            double amount = amount_Total/100;

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

    }

    private Customer findCustomerByEmail(String email) {
        try {
            // Retrieve a list of customers with the given email
            CustomerCollection customers = Customer.list(Map.of("email", email));
            if (!customers.getData().isEmpty()) {
                // Return the first customer found (assuming there is only one)
                return customers.getData().get(0);
            }
        } catch (StripeException e) {
            // Handle Stripe exception when listing customers
        }

        return null; // No matching customer found
    }
}
