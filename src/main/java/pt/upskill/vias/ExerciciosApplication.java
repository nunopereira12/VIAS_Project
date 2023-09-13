package pt.upskill.vias;

import org.json.JSONObject;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import pt.upskill.vias.services.DestinationServiceImpl;

import java.io.IOException;

@SpringBootApplication
public class ExerciciosApplication {

	static DestinationServiceImpl d = new DestinationServiceImpl();

	public static void main(String[] args) throws IOException {

		String obj = d.createPostURL("Lisboa", "Porto");
		JSONObject obj2 = d.getJSONResponse(obj);


		SpringApplication.run(ExerciciosApplication.class, args);

	}

}
