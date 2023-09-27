package pt.upskill.vias.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityWebConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    UserAuthenticationProvider userAuthenticationProvider;

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http
                
            .formLogin()
                .loginPage("/login")
                .loginProcessingUrl("/perform_login")
                .defaultSuccessUrl("/home")

        .and()
            .csrf()
                .disable()
            .authorizeRequests()
                .antMatchers("/admin").permitAll()
                .antMatchers("/login", "/signup", "/signup_action", "/register_success").permitAll()
                .antMatchers("/activation", "/activation/**","activation_success", "/activation_fail").permitAll()
                .antMatchers("/recover_password", "/recovery_request","/recovery_email_sent","/change_password","/change_password/*", "/set_password").permitAll()
                .antMatchers("/diagrams","/schedules").permitAll()
                .antMatchers("/contacts", "/send_message", "/contact_success").permitAll()
                .antMatchers("/welcome","/home", "/perform_travel", "/suggestions", "/travel_details", "/simulate_trip", "/",
                "/checkout_navegante", "/checkout_vias_card", "/webhooks/stripe/events", "webhooks/**").permitAll()
                .antMatchers("/id_pica", "/validate", "/card_scan").permitAll()
                .antMatchers("/settings", "/help").permitAll()
                .antMatchers("/payments_vias_card","/payment_success", "/payments").permitAll()
                .antMatchers("/profile","/edit_profile", "/update_user", "/history", "/profile_change_password").permitAll()
                .antMatchers("/show_ticket").permitAll()
                .antMatchers("/vias_league").permitAll()
                .antMatchers("/wallet","/add_navegante", "/generateQRCode/{cardData}").permitAll()
                .antMatchers("/uploads/*", "/upload").permitAll()

                .antMatchers("/images/**", "/css/**","/js/**","/sounds/**").permitAll()
                .antMatchers("**").denyAll()

                .antMatchers("/template").permitAll()


        .and()
            .logout()
                .logoutSuccessUrl("/login")
                .logoutUrl("/logout");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder manager) {
        manager.authenticationProvider(userAuthenticationProvider);
    }
}
