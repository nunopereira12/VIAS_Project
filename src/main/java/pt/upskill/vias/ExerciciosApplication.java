package pt.upskill.vias;

import org.json.JSONObject;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import pt.upskill.vias.services.DestinationServiceImpl;

import java.io.IOException;

@SpringBootApplication
public class ExerciciosApplication {


	public static void main(String[] args) throws IOException {
		SpringApplication.run(ExerciciosApplication.class, args);

	}

}
