package pt.upskill.vias.services.routes;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.util.List;

public interface RoutesRequestService {



    String createPostURL(String origin, String destination);
    JSONObject getJSONResponse(String url) throws IOException;
    List<Leg> getLegList(String origin, String destination) throws IOException;

}
