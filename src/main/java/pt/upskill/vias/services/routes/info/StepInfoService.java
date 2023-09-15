package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Line;
import pt.upskill.vias.models.routes.Step;

import java.io.IOException;

public interface StepInfoService {

    public String distance(JSONObject obj);
    public String duration(JSONObject obj);
    public String polyline(JSONObject obj);
    public String html_instructions(JSONObject obj);
    public String travel_mode(JSONObject obj);
    public String departure_stop(JSONObject obj);
    public String departure_time(JSONObject obj);
    public String arrival_stop(JSONObject obj);
    public String arrival_time(JSONObject obj);
    public String headsign(JSONObject obj);
    public String num_stops(JSONObject obj);
    public Step buildStep(JSONObject obj);


}
