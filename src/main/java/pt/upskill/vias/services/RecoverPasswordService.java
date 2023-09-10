package pt.upskill.vias.services;

import pt.upskill.vias.entities.Token;
import pt.upskill.vias.entities.User;

public interface RecoverPasswordService {

    String generateTokenID();

    Token generateToken(User user);

    Token getToken(String tokenID);

}

