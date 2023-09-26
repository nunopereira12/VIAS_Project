package pt.upskill.vias.exceptions;

public class UsernameAndEmailException extends ValidationException{
    public UsernameAndEmailException(String message) {
        super("username_email_unavailable", message);
    }
}
