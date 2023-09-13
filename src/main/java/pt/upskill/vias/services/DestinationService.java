package pt.upskill.vias.services;

import org.json.JSONObject;

import java.io.IOException;


public interface DestinationService {

    public String createPostURL(String origin, String destination);
    public JSONObject getJSONResponse(String url) throws IOException;


    public String tripValue(JSONObject obj);
    public String tripDuration(JSONObject obj);
    public String tripDistance(JSONObject obj);
    public String tripArrivalTime(JSONObject obj);
    public String tripDepartureTime(JSONObject obj);



}
