package pt.upskill.vias.exceptions;

public class UnavailableEmailException extends ValidationException {

    public UnavailableEmailException(String message) {
        super("email_unavailable", message);
    }
}
