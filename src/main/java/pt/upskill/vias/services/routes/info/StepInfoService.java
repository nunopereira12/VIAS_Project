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
    public String departure_stop(JSONObject jsonStep);
    public String departure_time(JSONObject jsonStep);
    public String arrival_stop(JSONObject jsonStep);
    public String arrival_time(JSONObject jsonStep);
    public String headsign(JSONObject jsonStep);
    public String num_stops(JSONObject jsonStep);
    public Step buildStep(JSONObject jsonStep);


}
