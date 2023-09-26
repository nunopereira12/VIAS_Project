package pt.upskill.vias.services.routes;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.sql.Time;
import java.util.Date;
import java.util.List;

public interface RoutesRequestService {



    String createPostURL(String origin, String destination, boolean depart, Date date);
    JSONObject getJSONResponse(String url) throws IOException;
    Date joinDateTime(Date date, Time time);
    List<Leg> getLegList(String origin, String destination, boolean depart, Date date) throws IOException;

}
