package pt.upskill.vias.services.routes;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;

import java.io.IOException;
import java.sql.Time;
import java.text.ParseException;
import java.util.Date;
import java.util.List;

public interface RoutesRequestService {



    String createPostURL(String origin, String destination, boolean depart, String date) throws ParseException;
    String getDepartureOrArrival(boolean depart, String date) throws ParseException;
    JSONObject getJSONResponse(String url) throws IOException;
    Date joinDateTime(Date date, Time time);
    List<Leg> getLegList(String origin, String destination, boolean depart, String date) throws IOException, ParseException;

}
