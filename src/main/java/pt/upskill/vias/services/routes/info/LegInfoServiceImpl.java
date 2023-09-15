package pt.upskill.vias.services.routes.info;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;


@Service
public class LegInfoServiceImpl implements LegInfoService {


     @Override
    public String duration(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject durationJSON = legs.getJSONObject("duration");
        return durationJSON.getString("text");
    }

    @Override
    public String distance(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject distanceJSON = legs.getJSONObject("distance");
        return distanceJSON.getString("text");
    }

    @Override
    public String arrivalTime(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject arrivalTimeJSON = legs.getJSONObject("arrival_time");
        return arrivalTimeJSON.getString("text");
    }

    @Override
    public String departureTime(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject departureTimeJSON = legs.getJSONObject("departure_time");
        return departureTimeJSON.getString("text");
    }

    @Override
    public String fare() {
        return null;
    }

}



