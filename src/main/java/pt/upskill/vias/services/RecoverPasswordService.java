package pt.upskill.vias.services;

public interface RecoverPasswordService {

    String generateToken();
    String getRecoveryLink();
    void sendEmail();
}
