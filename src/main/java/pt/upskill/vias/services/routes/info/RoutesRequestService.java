package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.util.List;

public interface RoutesRequestService {



    public String createPostURL(String origin, String destination);
    public JSONObject getJSONResponse(String url) throws IOException;

    public List<Leg>
    legList(String origin, String destination) throws IOException;
}
