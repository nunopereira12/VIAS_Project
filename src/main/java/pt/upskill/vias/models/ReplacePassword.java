package pt.upskill.vias.models;

import pt.upskill.vias.entities.Token;

public class ReplacePassword {

    private String password;

    private String confirmPassword;


    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

}



