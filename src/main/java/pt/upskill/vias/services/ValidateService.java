package pt.upskill.vias.services;

public interface ValidateService {


    boolean isNavegante(String qrcode);

    long parseCardNumber(String qrcode);

    boolean validateViasCard(long card_number);

    boolean validateNavegante(long card_number);

    boolean isValid(String qrcode);
}
