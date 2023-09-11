package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.Token;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.TokenRepository;

import java.security.SecureRandom;
import java.util.Date;

@Service
public class RecoverPasswordServiceImpl implements RecoverPasswordService {


    @Autowired
    TokenRepository tokenRepository;


    private static final String CHARACTERS = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    private static final int TOKEN_LENGTH = 24;


        @Override
            public String generateTokenID() {
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
    public Token generateToken(User user) {
        Token token = new Token();
        token.setUser(user);
        token.setTokenID(generateTokenID());
        token.setTimestamp(new Date());
        tokenRepository.save(token);
        return token;

    }

    @Override
    public Token getToken(String tokenID) {
        return tokenRepository.findByTokenID(tokenID);
    }

    @Override
    public void setTokenUsed(Token token) {
        token.setUsed(true);
        tokenRepository.save(token);
    }


}
