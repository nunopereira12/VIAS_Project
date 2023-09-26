package pt.upskill.vias.exceptions;

public class EmailAndPasswordException extends ValidationException{
    public EmailAndPasswordException(String message) {
        super("email_password_unavailable", message);
    }
}
