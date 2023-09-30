package pt.upskill.vias.services.profile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.entities.user.User;
import pt.upskill.vias.repositories.UserRepository;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class FileUploadServiceImpl implements FileUploadService {

    @Value("${upload.dir}")
    private String uploadDir;

    @Autowired
    private UserRepository userRepository;

    @Override
    public ModelAndView uploadProfilePicture(MultipartFile file, User user) {
        try {
            String current_working_directory = System.getProperty("user.dir");
            String original_file_name = file.getOriginalFilename();
            String file_extension = original_file_name.substring(original_file_name.lastIndexOf(".")); // Get the original file extension
            String upload_directory = current_working_directory + File.separator + "src/main/uploads";
            String new_file_name = user.getId() + file_extension; // Append the original file extension to the filename
            File destination = new File(upload_directory + File.separator + new_file_name);


            File old_file = new File(upload_directory + File.separator + user.getProfile_picture());
            if (old_file.exists() && !user.getProfile_picture().startsWith("default")) {
                old_file.delete();
            }

            file.transferTo(destination);

            user.setProfile_picture(new_file_name);

            userRepository.save(user);
            return new ModelAndView("redirect:/profile");
        } catch (IOException e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/profile");
        }
    }


    public String getRandomProfileImage() {
        Random random = new Random();
        int randomIndex = random.nextInt(29)+1;
        String image = "default_";

        return image + randomIndex + ".png";
    }

}
