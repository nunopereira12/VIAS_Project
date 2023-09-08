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
                .defaultSuccessUrl("/")
        .and()
            .csrf()
                .disable()
            .authorizeRequests()
                .antMatchers("/login").anonymous()
                .antMatchers("/signup").anonymous()
                .antMatchers("/welcome").anonymous()
                .antMatchers("/diagrams").anonymous()
                .antMatchers("/wallet").anonymous()
                .antMatchers("/signup_action").anonymous()
                .antMatchers("/vias_league").anonymous()
                .antMatchers("/admin").anonymous()
                .antMatchers("/validate").anonymous()
                .antMatchers("/template").anonymous()
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
