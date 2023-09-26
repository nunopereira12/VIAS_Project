package pt.upskill.vias.exceptions;

public class UsernameAndPasswordException extends ValidationException {
    public UsernameAndPasswordException(String message) {
        super("username_password_unavailable", message);
    }
}
