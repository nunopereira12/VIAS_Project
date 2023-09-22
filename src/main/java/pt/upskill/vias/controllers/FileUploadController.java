package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import pt.upskill.vias.repositories.UserRepository;
import pt.upskill.vias.services.profile.FileUploadService;
import java.security.Principal;

@Controller
public class FileUploadController {


    @Autowired
    UserRepository userRepository;

    @Autowired
    FileUploadService fileUploadService;

    @PostMapping("/upload")
    public ModelAndView uploadFile(@RequestParam("file") MultipartFile file, Principal principal) {
        return  fileUploadService.uploadProfilePicture(file, userRepository.getUserByUsername(principal.getName()));
    }



}
