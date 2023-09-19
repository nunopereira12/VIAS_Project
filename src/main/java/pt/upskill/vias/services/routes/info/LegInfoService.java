package pt.upskill.vias.services.routes.info;

import org.json.JSONArray;
import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.util.List;


public interface LegInfoService {

     public String departureTime(JSONObject obj);
    public String arrivalTime(JSONObject obj);
    public String distance(JSONObject obj);
    public String duration(JSONObject obj);
    public String start_address(JSONObject obj);
    public String end_address(JSONObject obj);
    public String overview_polyline(JSONObject jsonRoute);
    public String fare(JSONArray steps);
    public Leg buildLeg(JSONObject jsonLeg, JSONObject jsonRoute);




}
