package pt.upskill.vias.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
                    .successHandler(new AuthenticationSuccessHandler() {
                        @Override
                        public void onAuthenticationSuccess(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Authentication authentication) throws IOException {
                            httpServletResponse.sendRedirect("/home");
                        }
                    })
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
                    .antMatchers("/webhooks/stripe/events", "webhooks/**").permitAll()
                    .antMatchers("/simulate_trip", "/checkout_navegante", "/checkout_vias_card").hasRole("USER")
                    .antMatchers("/id_pica", "/validate", "/card_scan").hasRole("PICA")
                    .antMatchers("/payment_success").hasRole("USER")
                    .antMatchers("/profile","/edit_profile", "/update_user", "/profile_change_password").authenticated()
                    .antMatchers("/vias_league", "/history").hasRole("USER")
                    .antMatchers("/wallet","/add_navegante", "/show_ticket","/generateQRCode/{cardData}").hasRole("USER")
                    .antMatchers("/uploads/*", "/upload").authenticated()

                    .antMatchers("/error_page").permitAll()
                    .antMatchers("/reset").permitAll()
                    .antMatchers("/template").hasRole("ADMIN")

                    .antMatchers("/images/**", "/css/**","/js/**","/sounds/**").permitAll()
                    .antMatchers("**").denyAll()
                    .and()
                .exceptionHandling()
                    .accessDeniedPage("/error_page")
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
