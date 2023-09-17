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
                .antMatchers("/login", "/signup", "/", "/payments","/settings","/validatetitle", "/perform_travel").permitAll()
                .antMatchers("/signup", "/activation_success", "/register_success", "/activation_success/**", "/uploads/*").permitAll()
                .antMatchers("/welcome").permitAll()
                .antMatchers("/home","/suggestions", "/traveldetails").permitAll()
                .antMatchers("/passwordrecovery").permitAll()
                .antMatchers("/recover_password").permitAll()
                .antMatchers("/passwordrecovery2").permitAll()
                .antMatchers("/passwordrecovery3/*").permitAll()
                .antMatchers("/replace_pw").permitAll()
                .antMatchers("/replace_pw/*").permitAll()
                .antMatchers("/diagrams","/schedules").permitAll()
                .antMatchers("/wallet").hasRole("USER")
                .antMatchers("/signup_action").permitAll()
                .antMatchers("/profile").permitAll()
                .antMatchers("/edit_profile").permitAll()
                .antMatchers("/update_user").permitAll()
                .antMatchers("/ajuda").permitAll()
                .antMatchers("/titles").permitAll()
                .antMatchers("/vias_league").permitAll()
                .antMatchers("/admin").permitAll()
                .antMatchers("/validate").hasRole("PICA")
                .antMatchers("/id_pica").hasRole("PICA")
                .antMatchers("/template").permitAll()
                .antMatchers("/contactos").permitAll()
                .antMatchers("/contact_success").permitAll()
                .antMatchers("/send_message").permitAll()
                .antMatchers("/upload").permitAll()
                .antMatchers("/tarefas").hasRole("ADMIN")
                .antMatchers("/images/**", "/css/**","/js/**").permitAll()
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
