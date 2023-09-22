package pt.upskill.vias.services.profile;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;

public interface FileUploadService {

    ModelAndView uploadProfilePicture(MultipartFile file, User user);

}
