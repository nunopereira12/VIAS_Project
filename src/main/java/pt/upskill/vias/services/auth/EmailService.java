package pt.upskill.vias.services.auth;

import pt.upskill.vias.entities.user.User;

public interface EmailService {

    void sendEmail(String to, String subject, String htmlBody);
    void sendAccountVerificationEmail(String email);
    void sendPasswordRecoveryEmail(User user);
}
