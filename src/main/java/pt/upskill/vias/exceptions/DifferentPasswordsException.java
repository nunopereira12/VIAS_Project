package pt.upskill.vias.exceptions;

public class DifferentPasswordsException extends ValidationException {

    public DifferentPasswordsException(String message) {
        super("passwords_different", message);
    }
}
