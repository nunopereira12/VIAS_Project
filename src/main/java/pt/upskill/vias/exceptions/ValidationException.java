package pt.upskill.vias.exceptions;

public class ValidationException extends Exception {

    String field;

    public ValidationException() {
    }

    public ValidationException(String field, String message) {
        super(message);
        this.field = field;
    }

    public String getField() {
        return field;
    }

}
