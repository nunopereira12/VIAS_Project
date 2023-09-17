package pt.upskill.vias.controllers;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;

@Controller
public class FileUploadController {
    @Value("${upload.dir}")
    private String uploadDir;

    /*@PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        try {
            // Get the file's original name
            String originalFileName = file.getOriginalFilename();

            // Construct the file path where you want to save it
            String filePath = uploadDir + originalFileName;

            // Create the file on the server
            File destination = new File(filePath);
            file.transferTo(destination);

            // File uploaded successfully
            return "redirect:/profile?success";
        } catch (IOException e) {
            // Handle the exception (e.g., show an error message)
            return "redirect:/profile?error";
        }
    }*/

    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file) {
        String currentWorkingDirectory = System.getProperty("user.dir");
        System.out.println("Current Working Directory: " + currentWorkingDirectory);

        if (file.isEmpty()) {
            return "Please select a file to upload.";
        }

        try {
            String originalFilename = file.getOriginalFilename();
            String sanitizedFilename = originalFilename.replaceAll("\\s+", "_");
            String uploadDir = currentWorkingDirectory + File.separator + "src/main/uploads";
            File dest = new File(uploadDir + File.separator + sanitizedFilename);
            file.transferTo(dest);
            return "redirect:/profile";
        } catch (IOException e) {
            e.printStackTrace();
            return "redirect:/profile";
        }
    }
/*
    @PostMapping("/upload")
    public String uploadFile(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        String currentWorkingDirectory = System.getProperty("user.dir");
        System.out.println("Current Working Directory: " + currentWorkingDirectory);

        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("uploadMessage", "Please select a file to upload.");
            return "redirect:/profile"; // Redirect to profile.jsp
        }

        try {
            String originalFilename = file.getOriginalFilename();
            String sanitizedFilename = originalFilename.replaceAll("\\s+", "_");
            String uploadDir = currentWorkingDirectory + File.separator + "src/main/uploads";
            File dest = new File(uploadDir + File.separator + sanitizedFilename);
            file.transferTo(dest);
            redirectAttributes.addFlashAttribute("uploadMessage", "File uploaded successfully!");
            return "redirect:/profile"; // Redirect back to the profile page
        } catch (IOException e) {
            e.printStackTrace();
            redirectAttributes.addFlashAttribute("uploadMessage", "File upload failed: " + e.getMessage());
        }

        return "redirect:/profile"; // Redirect to profile.jsp
    }*/



}
