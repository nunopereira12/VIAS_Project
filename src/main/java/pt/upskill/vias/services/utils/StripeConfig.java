package pt.upskill.vias.services.utils;


import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;

@Configuration
public class StripeConfig {


        @Value("${stripe.api.key}")
        private String stripeApiKey;

        public String getStripeApiKey() {
            return stripeApiKey;
        }


}
