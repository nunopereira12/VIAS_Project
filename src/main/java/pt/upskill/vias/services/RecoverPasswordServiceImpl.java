package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.repositories.UserRepository;

import java.security.SecureRandom;

@Service
public class RecoverPasswordServiceImpl implements RecoverPasswordService {

    @Autowired
    UserRepository userRepository;
    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int TOKEN_LENGTH = 24;


        @Override
    public String generateToken() {
            StringBuilder token = new StringBuilder(TOKEN_LENGTH);
            SecureRandom sr = new SecureRandom();

            for(int i = 0; i<TOKEN_LENGTH; i++) {
                int randomIndex = sr.nextInt(CHARACTERS.length());
                char randomChar = CHARACTERS.charAt(randomIndex);
                token.append(randomChar);
            }

        return token.toString();
    }

    @Override
    public String getRecoveryLink() {
        return "/RecoverPassword/" + generateToken();
    }



    @Override
    public void sendEmail() {

    }
}
