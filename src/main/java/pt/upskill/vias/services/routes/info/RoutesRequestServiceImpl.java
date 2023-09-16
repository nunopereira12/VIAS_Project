package pt.upskill.vias.services.routes.info;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

@Service
public class RoutesRequestServiceImpl implements RoutesRequestService {

    @Autowired
    LegInfoService legInfoService;
    @Autowired
    StepInfoService stepInfoService;

    @Override
    public String createPostURL(String origin, String destination) {
        String apiKey = "AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs";
        String noSpacesOrigin = origin.replaceAll(" ", "+");
        String noSpacesDestination = destination.replaceAll(" ", "+");
        return "https://maps.googleapis.com/maps/api/directions/json?origin=" + noSpacesOrigin + "&destination=" + noSpacesDestination + "&key=" + apiKey + "&mode=transit&language=pt-PT&alternatives=true";
    }

    @Override
    public JSONObject getJSONResponse(String apiurl) throws IOException {
        URL url = new URL(apiurl);
        Scanner scanner = new Scanner(url.openStream());

        String response = "";
        while (scanner.hasNextLine()) {
            response += scanner.nextLine();
        }
        return new JSONObject(response);
    }

    @Override
    public List<Leg> legList(JSONObject response) {
        List<Leg> legList = new ArrayList<>();

        JSONArray routes = response.getJSONArray("routes");
        for(int i = 0; i < routes.length(); i++) {
            JSONObject jsonLeg = routes.getJSONObject(i).getJSONObject("legs");
            Leg leg = legInfoService.buildLeg(jsonLeg);
            JSONArray steps = jsonLeg.getJSONArray("steps");

            for(int j = 0; i< steps.length(); j++) {
                JSONObject jsonStep = steps.getJSONObject(j);
                Step step = stepInfoService.buildStep(jsonStep);
                leg.addStep(step);
            }

            legList.add(leg);
        }
        return legList;
    }


}
