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
                .antMatchers("/login", "/signup", "/").permitAll()
                .antMatchers("/signup").permitAll()
                .antMatchers("/welcome").permitAll()
                .antMatchers("/home").permitAll()
                .antMatchers("/passwordrecovery").permitAll()
                .antMatchers("/recover_password").permitAll()
                .antMatchers("/passwordrecovery2").permitAll()
                .antMatchers("/passwordrecovery3/*").permitAll()
                .antMatchers("/replace_pw").permitAll()
                .antMatchers("/replace_pw/*").permitAll()
                .antMatchers("/diagrams").permitAll()
                .antMatchers("/wallet").hasRole("USER")
                .antMatchers("/signup_action").permitAll()
                .antMatchers("/profile").permitAll()
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
                .logoutSuccessUrl("/login")
                .logoutUrl("/logout");
    }

    @Override
    protected void configure(AuthenticationManagerBuilder manager) {
        manager.authenticationProvider(userAuthenticationProvider);
    }
}
