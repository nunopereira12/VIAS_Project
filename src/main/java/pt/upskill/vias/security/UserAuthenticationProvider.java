package pt.upskill.vias.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.stereotype.Component;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.services.AuthService;

import java.util.ArrayList;
import java.util.List;

@Component
public class UserAuthenticationProvider implements AuthenticationProvider {
    @Autowired
    AuthService authService;

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        User user = authService.validateLogin((String)authentication.getPrincipal(), (String)authentication.getCredentials());
        if(user != null) {
            List<GrantedAuthority> permissions = new ArrayList<>();
            permissions.add((GrantedAuthority) () -> "ROLE_ADMIN");
            permissions.add((GrantedAuthority) () -> "ROLE_USER");
            return new UsernamePasswordAuthenticationToken(
                    user.getUsername(),
                    user.getPassword(),
                    permissions
                );
        }
        return null;
    }

    @Override
    public boolean supports(Class<?> aClass) {
        return aClass.equals(UsernamePasswordAuthenticationToken.class);
    }
}
