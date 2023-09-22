package pt.upskill.vias.services.cards.validate;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import org.springframework.stereotype.Service;

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
}
