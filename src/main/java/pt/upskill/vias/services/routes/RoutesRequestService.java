package pt.upskill.vias.services.routes;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.util.List;

public interface RoutesRequestService {



    public String createPostURL(String origin, String destination);
    public JSONObject getJSONResponse(String url) throws IOException;
    public List<Leg> getLegList(String origin, String destination) throws IOException;

    public void saveLegs(List<Leg> legs);
}
