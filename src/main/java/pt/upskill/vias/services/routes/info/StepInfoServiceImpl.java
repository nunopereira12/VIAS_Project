package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Step;

@Service
public class StepInfoServiceImpl implements StepInfoService {

    @Autowired
    LineInfoService lineInfoService;

    @Override
    public String distance(JSONObject jsonStep) {
        return jsonStep.getJSONObject("distance").getString("text");
    }

    @Override
    public String duration(JSONObject jsonStep) {
        return jsonStep.getJSONObject("duration").getString("text");
    }

    @Override
    public String polyline(JSONObject jsonStep) {
        return jsonStep.getJSONObject("polyline").getString("points");
    }

    @Override
    public String html_instructions(JSONObject jsonStep) {
        return jsonStep.getString("html_instructions");
    }

    @Override
    public String travel_mode(JSONObject jsonStep) {
        return jsonStep.getString("travel_mode");
    }

    @Override
    public String icon(JSONObject transit_details) {
        return transit_details.getJSONObject("line").getJSONObject("vehicle").getString("icon");
    }

    @Override
    public String departure_stop(JSONObject transit_details) {
        return transit_details.getJSONObject("departure_stop").getString("name");
    }

    @Override
    public String departure_time(JSONObject transit_details) {
        return transit_details.getJSONObject("departure_time").getString("text");
    }

    @Override
    public String arrival_stop(JSONObject transit_details) {
        return transit_details.getJSONObject("arrival_stop").getString("name");
    }

    @Override
    public String arrival_time(JSONObject transit_details) {
        return transit_details.getJSONObject("arrival_time").getString("text");
    }

    @Override
    public String headsign(JSONObject transit_details) {
        return transit_details.getString("headsign");
    }

    @Override
    public int num_stops(JSONObject transit_details) {
        return transit_details.getInt("num_stops");
    }

    @Override
    public Step buildStep(JSONObject jsonStep) {
        String mode = travel_mode(jsonStep);
        Step step;

        if (mode.equals("WALKING")) {
            step = new Step(distance(jsonStep), duration(jsonStep), polyline(jsonStep), html_instructions(jsonStep), mode, "http://maps.gstatic.com/mapfiles/transit/iw2/svg/walk.svg");

        } else if (mode.equals("TRANSIT")) {
            JSONObject transit_details = jsonStep.getJSONObject("transit_details");
            step = new Step(distance(jsonStep), duration(jsonStep), polyline(jsonStep), html_instructions(jsonStep), mode,icon(transit_details), departure_stop(transit_details), departure_time(transit_details), arrival_stop(transit_details), arrival_time(transit_details), headsign(transit_details), num_stops(transit_details), lineInfoService.buildLine(transit_details));

        } else {
            step = new Step();

        }
        return step;
    }
}