package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;

import java.io.IOException;

public interface RoutesRequestService {

    public String createPostURL(String origin, String destination);
    public JSONObject getJSONResponse(String url) throws IOException;
}
