package pt.upskill.vias.services;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.cards.Navegante;
import pt.upskill.vias.entities.cards.ViasCard;

import java.awt.image.BufferedImage;

@Service
public class QRCodeServiceImpl implements QRCodeService {
    @Override
    public BufferedImage generateQRCode(String cardData) throws WriterException {
        int width = 300;
        int height = 300;
        BitMatrix bitMatrix = new QRCodeWriter().encode(cardData, BarcodeFormat.QR_CODE, width, height);
        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }


    /*public BufferedImage generateQRCodeViasCard(ViasCard viasCard) throws WriterException, JsonProcessingException {

        String cardData = convertViasCardToJson(viasCard);

        int width = 300;
        int height = 300;
        BitMatrix bitMatrix = new QRCodeWriter().encode(cardData, BarcodeFormat.QR_CODE, width, height);

        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }

    public BufferedImage generateQRCodeNavegante(Navegante navegante) throws WriterException, JsonProcessingException {

        String cardData = convertNaveganteToJson(navegante);

        int width = 300;
        int height = 300;
        BitMatrix bitMatrix = new QRCodeWriter().encode(cardData, BarcodeFormat.QR_CODE, width, height);

        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }

    public String convertViasCardToJson(ViasCard viasCard) {
        JSONObject jsonObject = new JSONObject();

        jsonObject.put("card_number", viasCard.getCard_number());
        jsonObject.put("balance", viasCard.getBalance());
        jsonObject.put("times_used", viasCard.getTimes_used());
        jsonObject.put("user_id", viasCard.getUser().getId());

        return jsonObject.toString();
    }

    public String convertNaveganteToJson(Navegante navegante) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("card_number", navegante.getCard_number());
        jsonObject.put("name", navegante.getName());
        jsonObject.put("expiration_date", navegante.getExpiration_date().getTime());
        jsonObject.put("valid", navegante.isValid());
        jsonObject.put("valid_next_month", navegante.isValid_next_month());
        jsonObject.put("times_used", navegante.getTimes_used());
        jsonObject.put("user_id", navegante.getUser().getId());

        return jsonObject.toString();
    }*/

}
