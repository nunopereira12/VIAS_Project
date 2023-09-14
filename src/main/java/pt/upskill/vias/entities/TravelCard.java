package pt.upskill.vias.entities;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;
@Entity
public class TravelCard {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private long cardNumber;
    private String type;
    private Date expirationDate;

    @ManyToOne
    @JoinColumn(name = "user_id")
    private User user;

    public TravelCard(long cardNumber, String type, Date expirationDate) {
        this.cardNumber = cardNumber;
        this.type = type;
        this.expirationDate = expirationDate;
    }

    public TravelCard(){}

    public long getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(long cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getExpirationDate() {
        return expirationDate;
    }

    public void setExpirationDate(Date expirationDate) {
        this.expirationDate = expirationDate;
    }

    public String formatDateToDDMMYY(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(date);
    }
}
