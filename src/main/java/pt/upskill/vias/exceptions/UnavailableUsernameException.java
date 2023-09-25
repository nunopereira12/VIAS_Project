package pt.upskill.vias.exceptions;

public class UnavailableUsernameException extends ValidationException {

    public UnavailableUsernameException(String message) {
        super("username_unavailable", message);
    }}
