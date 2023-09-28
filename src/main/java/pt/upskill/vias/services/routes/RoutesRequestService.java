package pt.upskill.vias.services.routes;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface RoutesRequestService {



    String createPostURL(String origin, String destination, boolean depart, Date date) throws ParseException;
    String createNoDatePostURL(String origin, String destination);
    String getDepartureOrArrival(boolean depart, Date date) throws ParseException;
    JSONObject getJSONResponse(String url) throws IOException;
    List<Leg> getLegList(String origin, String destination, boolean depart, Date date) throws IOException, ParseException;
    List<Leg> getNoDateLegList(String origin, String destination) throws IOException;

    List<Leg> buildLegList(JSONObject response) throws IOException;

}
