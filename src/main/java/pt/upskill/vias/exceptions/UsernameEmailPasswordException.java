package pt.upskill.vias.exceptions;

public class UsernameEmailPasswordException extends ValidationException{
    public UsernameEmailPasswordException(String message) {
        super("username_email_password_unavailable", message);
    }
}
