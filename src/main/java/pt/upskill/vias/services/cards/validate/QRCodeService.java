package pt.upskill.vias.services.cards.validate;

import com.google.zxing.WriterException;

import java.awt.image.BufferedImage;

public interface QRCodeService {
    BufferedImage generateQRCode(String cardData) throws WriterException;
}
