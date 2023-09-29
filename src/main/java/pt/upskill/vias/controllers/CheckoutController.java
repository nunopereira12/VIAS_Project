package pt.upskill.vias.controllers;
import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.checkout.Session;
import com.stripe.param.checkout.SessionCreateParams;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.NaveganteRepository;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.repositories.ViasCardRepository;
import pt.upskill.vias.services.payments.PaymentService;
import pt.upskill.vias.services.utils.StripeConfig;



@Controller
public class CheckoutController {

    @Autowired
    PaymentService paymentService;

    @Autowired
    NaveganteRepository naveganteRepository;

    @Autowired
    UserRepository userRepository;

    @Autowired
    ViasCardRepository viasCardRepository;

    private final StripeConfig stripeConfig;

    @Autowired
    public CheckoutController(StripeConfig stripeConfig) {
        this.stripeConfig = stripeConfig;
        Stripe.apiKey = stripeConfig.getStripeApiKey();
    }

    @PostMapping("/checkout_navegante")
    public String createCheckoutSessionNavegante(RedirectAttributes redirectAttributes, String navegante_id) throws StripeException {

        Stripe.apiKey = "sk_test_51NuelYBvwGTopoOtLCiGZQgBZKWaX0MoyzEil96jNYabGSRs5q6bnExplsejHRLVnTbZzuaR2dsnEiGkAM1vAbEB004I5SHK6v";

        Navegante navegante = naveganteRepository.getNaveganteByCard_number(navegante_id);
        User user = userRepository.getUserById(navegante.getUser().getId());

        String customer = paymentService.createCustomer(user);
        String YOUR_DOMAIN = "http://localhost:8080";
        SessionCreateParams params = SessionCreateParams.builder()
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .setSuccessUrl(YOUR_DOMAIN + "/payment_success")
                .setCancelUrl(YOUR_DOMAIN + "/wallet")
                .addLineItem(SessionCreateParams.LineItem.builder()
                        .setQuantity(1L)
                        .setPrice("price_1NugZ9BvwGTopoOtfqOPqrPu")
                        .build())
                .addExpand("line_items")
                .setCurrency("eur")
                .setCustomer(customer)
                .build();

        Session session = Session.create(params);



        redirectAttributes.addAttribute("sessionId", session.getId());
        return "redirect:" + session.getUrl();
    }

    @PostMapping("/checkout_vias_card")
    public String createCheckoutSessionVIASCard(RedirectAttributes redirectAttributes, Long vias_card_id) throws StripeException {

        Stripe.apiKey = "sk_test_51NuelYBvwGTopoOtLCiGZQgBZKWaX0MoyzEil96jNYabGSRs5q6bnExplsejHRLVnTbZzuaR2dsnEiGkAM1vAbEB004I5SHK6v";

        ViasCard vc = viasCardRepository.getViasCardByCard_number(vias_card_id);
        User user = userRepository.getUserById(vc.getUser().getId());
        String customer = paymentService.createCustomer(user);

        String YOUR_DOMAIN = "http://localhost:8080";


        SessionCreateParams params = SessionCreateParams.builder()
                .setMode(SessionCreateParams.Mode.PAYMENT)
                .setSuccessUrl(YOUR_DOMAIN + "/payment_success")
                .setCancelUrl(YOUR_DOMAIN + "/wallet")
                .addLineItem(SessionCreateParams.LineItem.builder()
                        .setQuantity(1L)
                        .setPrice("price_1NugiRBvwGTopoOtVtWow0hT")
                        .build())
                .addExpand("line_items")
                .setCurrency("eur")
                .setCustomer(customer)
                .build();

        Session session = Session.create(params);

        redirectAttributes.addAttribute("sessionId", session.getId());



        return "redirect:" + session.getUrl();
    }


}
