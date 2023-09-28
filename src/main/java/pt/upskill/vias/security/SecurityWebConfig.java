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
                .antMatchers("/diagrams","/schedules","/settings", "/help").permitAll()
                .antMatchers("/contacts", "/send_message", "/contact_success").permitAll()
                .antMatchers("/home", "/perform_travel", "/suggestions", "/travel_details", "/").permitAll()
                .antMatchers("/simulate_trip", "/checkout_navegante", "/checkout_vias_card", "/webhooks/stripe/events", "webhooks/**").hasRole("USER")
                .antMatchers("/id_pica", "/validate", "/card_scan").hasRole("PICA")
                .antMatchers("/payment_success").hasRole("USER")
                .antMatchers("/profile","/edit_profile", "/update_user", "/profile_change_password").authenticated()
                .antMatchers("/vias_league", "/history").hasRole("USER")
                .antMatchers("/wallet","/add_navegante", "/show_ticket","/generateQRCode/{cardData}").hasRole("USER")
                .antMatchers("/uploads/*", "/upload").authenticated()

                .antMatchers("/error_page").permitAll() //devias devias
                .antMatchers("/template").permitAll()

                .antMatchers("/images/**", "/css/**","/js/**","/sounds/**").permitAll()
                .antMatchers("**").denyAll()

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
