package pt.upskill.vias;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import pt.upskill.vias.services.RecoverPasswordService;
import pt.upskill.vias.services.RecoverPasswordServiceImpl;

@SpringBootApplication
public class ExerciciosApplication {

	public static void main(String[] args) {
		SpringApplication.run(ExerciciosApplication.class, args);
	}

}
