package pt.upskill.vias.services;

import org.springframework.web.multipart.MultipartFile;
import pt.upskill.vias.entities.User;

public interface FileUploadService {

        String uploadProfilePicture(MultipartFile file, User user);

}
