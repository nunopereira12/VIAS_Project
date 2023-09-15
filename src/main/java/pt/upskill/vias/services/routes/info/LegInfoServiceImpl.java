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
    public String duration(JSONObject leg) {
        return leg.getJSONObject("duration").getString("text");
    }

    @Override
    public String distance(JSONObject leg) {
        return leg.getJSONObject("distance").getString("text");
    }

    @Override
    public String arrivalTime(JSONObject leg) {
        return leg.getJSONObject("arrival_time").getString("text");
    }

    @Override
    public String departureTime(JSONObject leg) {
        return leg.getJSONObject("departure_time").getString("text");
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
    public Leg buildLeg(JSONObject jsonLeg) {
        JSONArray steps = jsonLeg.getJSONArray("steps");
        Leg leg = new Leg(departureTime(jsonLeg), arrivalTime(jsonLeg), distance(jsonLeg), duration(jsonLeg), fare(steps));
        return leg;
    }

}



