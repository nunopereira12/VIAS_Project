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
                .defaultSuccessUrl("/wallet")

        .and()
            .csrf()
                .disable()
            .authorizeRequests()
                .antMatchers("/login").permitAll()
                .antMatchers("/signup").permitAll()
                .antMatchers("/welcome").permitAll()
                .antMatchers("/home").permitAll()
                .antMatchers("/passwordrecovery").permitAll()
                .antMatchers("/diagrams").permitAll()
                .antMatchers("/wallet").permitAll()
                .antMatchers("/signup_action").permitAll()
                .antMatchers("/vias_league").permitAll()
                .antMatchers("/admin").permitAll()
                .antMatchers("/validate").permitAll()
                .antMatchers("/id_pica").permitAll()
                .antMatchers("/template").permitAll()
                .antMatchers("/tarefas").hasRole("ADMIN")
                .antMatchers("/images/**", "/css/**","/js/**").permitAll()
                .antMatchers("**").denyAll()
        .and()
            .logout()
                .logoutSuccessUrl("/")
                .logoutUrl("/logout");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder manager) {
        manager.authenticationProvider(userAuthenticationProvider);
    }
}
