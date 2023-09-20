package pt.upskill.vias.services;

import com.google.zxing.WriterException;

import java.awt.image.BufferedImage;

public interface QRCodeService {
    public BufferedImage generateQRCode(String cardData) throws WriterException;
}
