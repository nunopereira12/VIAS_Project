package pt.upskill.vias.services.routes;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.services.routes.info.LegInfoService;
import pt.upskill.vias.services.routes.info.LineInfoService;
import pt.upskill.vias.services.routes.info.StepInfoService;

import java.util.ArrayList;
import java.util.List;

@Service
public class RoutesServiceImpl implements RoutesService {

    @Autowired
    LegInfoService legInfoService;
    @Autowired
    StepInfoService stepInfoService;
    @Autowired
    LineInfoService lineInfoService;
    @Override
    public List<String> tripSteps(JSONObject obj) {
        List<String> instructionsList = new ArrayList<>();
        try {
            JSONArray routes = obj.getJSONArray("routes");
            JSONArray legs = routes.getJSONObject(0).getJSONArray("legs");
            for (int i = 0; i < legs.length(); i++) {
                JSONObject leg = legs.getJSONObject(i);
                JSONArray steps = leg.getJSONArray("steps");
                for (int j = 0; j < steps.length(); j++) {
                    JSONObject step = steps.getJSONObject(j);
                    String travelMode = step.getString("travel_mode");
                    String instructions;

                    if (travelMode.equals("TRANSIT") && step.has("transit")) {
                        JSONObject transit = step.getJSONObject("transit");
                        JSONObject line = transit.getJSONObject("line");
                        String lineName = line.getString("name");
                        String vehicleType = line.getJSONObject("vehicle").getString("type");
                        String headsign = transit.getString("headsign");
                        String departureTime = transit.getJSONObject("departure_time").getString("text");
                        String agencyName = line.getJSONArray("agencies").getJSONObject(0).getString("name");

                        instructions = "Apanhar " + lineName + " (" + vehicleType + ")";
                        instructions += " - " + headsign;
                        instructions += " - Hora de Partida: " + departureTime;
                        instructions += " - Operadora: " + agencyName;
                    } else {
                        instructions = step.getString("html_instructions").replaceAll("\\<.*?\\>", ""); // Remove HTML tags
                    }

                    String distance = step.getJSONObject("distance").getString("text");
                    String duration = step.getJSONObject("duration").getString("text");

                    // Build the instruction string
                    String instructionString = instructions + "\nDistância: " + distance + ", Tempo Estimado: " + duration;
                    instructionsList.add(instructionString);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for(String s : instructionsList) {
            System.out.println(s);
        }
        return instructionsList;
    }


}
