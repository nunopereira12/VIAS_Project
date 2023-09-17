package pt.upskill.vias.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import pt.upskill.vias.entities.User;
import pt.upskill.vias.repositories.UserRepository;

import java.io.File;
import java.io.IOException;

@Service
public class FileUploadServiceImpl implements FileUploadService{

    @Value("${upload.dir}")
    private String uploadDir;

    @Autowired
    private UserRepository userRepository;

    @Override
    public String uploadProfilePicture(MultipartFile file, User user) {
        String currentWorkingDirectory = System.getProperty("user.dir");
        if (file.isEmpty()) {
            return "Please select a file to upload.";
        }

        try {
            String originalFilename = file.getOriginalFilename();
            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf(".")); // Get the original file extension
            String uploadDir = currentWorkingDirectory + File.separator + "src/main/uploads";
            String fileName = user.getId() + fileExtension; // Append the original file extension to the filename
            File dest = new File(uploadDir + File.separator + fileName);

            if (user.getProfilePicture() != null) {
                File oldFile = new File(uploadDir + File.separator + user.getProfilePicture());
                if (oldFile.exists()) {
                    oldFile.delete();
                }
            }

            file.transferTo(dest);
            user.setProfilePicture(fileName);
            userRepository.save(user);
            return "redirect:/profile";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/profile";
        }
    }
}
