package pt.upskill.vias.services.auth;

import pt.upskill.vias.entities.User;

public interface EmailService {

    public void sendEmail(String to, String subject, String htmlBody);

    void sendAccountVerificationEmail(String email);
    void sendPasswordRecoveryEmail(User user);
}
