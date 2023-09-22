package pt.upskill.vias.services.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import pt.upskill.vias.entities.user.Token;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.UserRepository;

import javax.mail.internet.MimeMessage;

@Service
public class EmailServiceImpl implements EmailService{

    @Autowired
    JavaMailSender javaMailSender;
    @Autowired
    AuthService authService;
    @Autowired
    UserRepository userRepository;

    public void sendEmail(String to, String subject, String htmlBody) {
        MimeMessage message = javaMailSender.createMimeMessage();
        MimeMessageHelper helper;

        try {
            helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setSubject(subject);
            helper.setText(htmlBody, true);

            javaMailSender.send(message);
        } catch (Exception e) {
            e.printStackTrace();

        }
    }

    @Override
    public void sendAccountVerificationEmail(String email) {
        Token token = authService.generateToken(userRepository.getUserByEmail(email));

        String emailContent = "<html><body>" +
                "<p>Para ativar a sua conta, por favor, siga o seguinte link:</p>" +
                "<a href='http://localhost:8080/activation_success/" + token.getTokenId() + "'>Ativar conta</a>" +
                "</body></html>";

        sendEmail(email, "Ativação da conta", emailContent);
    }

    public void sendPasswordRecoveryEmail(User user) {
        Token token = authService.generateToken(user);

        String emailContent = "<html><body>" +
                "<p>Para repor a sua palavra-chave, por favor, siga o seguinte link:</p>" +
                "<a href='http://localhost:8080/change_password/" + token.getTokenId() + "'>Recuperação de Password</a>" +
                "</body></html>";

        sendEmail(user.getEmail(), "Recuperação de Password", emailContent);
    }


}
