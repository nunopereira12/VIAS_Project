package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Line;
import pt.upskill.vias.models.routes.Step;

import java.io.IOException;

public interface StepInfoService {

    public String distance(JSONObject jsonStep);
    public String duration(JSONObject jsonStep);
    public String polyline(JSONObject jsonStep);
    public String html_instructions(JSONObject jsonStep);
    public String travel_mode(JSONObject jsonStep);
    public String icon(JSONObject transit_details);
    public String departure_stop(JSONObject transit_details);
    public String departure_time(JSONObject transit_details);
    public String arrival_stop(JSONObject transit_details);
    public String arrival_time(JSONObject transit_details);
    public String headsign(JSONObject transit_details);
    public int num_stops(JSONObject transit_details);
    public Step buildStep(JSONObject jsonStep);


}
