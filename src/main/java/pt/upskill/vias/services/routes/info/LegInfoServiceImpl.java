package pt.upskill.vias.services.routes.info;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Leg;

import java.util.ArrayList;
import java.util.List;


@Service
public class LegInfoServiceImpl implements LegInfoService {

    @Override
    public String duration(JSONObject jsonLeg) {
        String duration = jsonLeg.getJSONObject("duration").getString("text");
        if (duration.contains("s")) {
            duration = duration.replace("s","");
        }
        if (duration.contains("hora")){
            duration = duration.replace("hora","h");
        }
        if(duration.contains("min")){
            duration = duration.replace("min","m");
        }


        return duration;
    }

    @Override
    public String distance(JSONObject jsonLeg) {
        return jsonLeg.getJSONObject("distance").getString("text");
    }

    @Override
    public String arrivalTime(JSONObject jsonLeg) {
        return jsonLeg.getJSONObject("arrival_time").getString("text");
    }

    @Override
    public String departureTime(JSONObject jsonLeg) {
        return jsonLeg.getJSONObject("departure_time").getString("text");
    }
    @Override
    public String start_address(JSONObject jsonLeg) {
        return jsonLeg.getString("start_address");
    }
    @Override
    public String end_address(JSONObject jsonLeg) {
        return jsonLeg.getString("end_address");
    }

    @Override
    public String fare(JSONArray steps) {
        int ticketNumber = 0;

        for(int i = 0; i < steps.length(); i++) {
            String mode = steps.getJSONObject(i).getString("travel_mode");
            if(mode.equals("TRANSIT")) {
                ticketNumber++;
            }
        }

        double fare = ticketNumber * 1.5;

        return String.valueOf(fare);
    }


    @Override
    public Leg buildLeg(JSONObject jsonLeg, int id) {
        JSONArray steps = jsonLeg.getJSONArray("steps");
        Leg leg = new Leg(id, departureTime(jsonLeg), arrivalTime(jsonLeg), distance(jsonLeg), duration(jsonLeg), start_address(jsonLeg), end_address(jsonLeg),  fare(steps));
        return leg;
    }

}



