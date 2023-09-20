package pt.upskill.vias.services;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.awt.image.BufferedImage;

@Service
public class QRCodeServiceImpl implements QRCodeService{
    @Override
    public BufferedImage generateQRCode(String cardData) throws WriterException {
        int width = 300;
        int height = 300;
        BitMatrix bitMatrix = new QRCodeWriter().encode(cardData, BarcodeFormat.QR_CODE, width, height);
        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }


    /*public BufferedImage generateQRCode(Card card) throws WriterException, JsonProcessingException {

        String cardData = convertUserCardToJson(userCard);


        int width = 300;
        int height = 300;
        BitMatrix bitMatrix = new QRCodeWriter().encode(cardData, BarcodeFormat.QR_CODE, width, height);

        return MatrixToImageWriter.toBufferedImage(bitMatrix);
    }

    public String convertUserCardToJson(ViasCard userCard) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("money", userCard.getMoney());
        jsonObject.put("expirationDate", userCard.getExpirationDate().toString());

        return jsonObject.toString();
    }

    public String convertUserSpecialCardToJson(Navegante userSpecialCard) {
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("specialField", userSpecialCard.getSpecialField());
        jsonObject.put("expirationDate", userSpecialCard.getExpirationDate().toString());

        return jsonObject.toString();
    }*/

}
