package pt.upskill.vias.services.routes.info;

import org.json.JSONArray;
import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.util.List;


public interface LegInfoService {

    String departureTime(JSONObject obj);
    String arrivalTime(JSONObject obj);
    String distance(JSONObject obj);
    String duration(JSONObject obj);
    String start_address(JSONObject obj);
    String end_address(JSONObject obj);
    String overview_polyline(JSONObject jsonRoute);
    String fare(JSONArray steps);
    Leg buildLeg(JSONObject jsonLeg, JSONObject jsonRoute);




}
