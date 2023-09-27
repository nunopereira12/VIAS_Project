package pt.upskill.vias.services.routes;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;
import pt.upskill.vias.repositories.LegRepository;
import pt.upskill.vias.services.routes.info.LegInfoService;
import pt.upskill.vias.services.routes.info.StepInfoService;
import pt.upskill.vias.services.utils.CalendarService;

import java.io.IOException;
import java.net.URL;
import java.sql.Time;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Scanner;

@Service
public class RoutesRequestServiceImpl implements RoutesRequestService {

    @Autowired
    LegInfoService legInfoService;
    @Autowired
    StepInfoService stepInfoService;
    @Autowired
    LegRepository legRepository;
    @Autowired
    CalendarService calendarService;

    @Override
    public String createPostURL(String origin, String destination, boolean depart, String date) throws ParseException {
        String specificTimeRequest = getDepartureOrArrival(depart, date);
        String apiKey = "AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs";
        String noSpacesOrigin = origin.replaceAll(" ", "+");
        String noSpacesDestination = destination.replaceAll(" ", "+");

        String url = "https://maps.googleapis.com/maps/api/directions/json?origin=" + noSpacesOrigin + "&destination=" + noSpacesDestination + "&key=" + apiKey + "&mode=transit&language=pt-PT&alternatives=true" + specificTimeRequest;
        return url;

    }

    @Override
    public String getDepartureOrArrival(boolean depart, String date) throws ParseException {
        String specificTimeRequest = "";
        String no_comma_date = date.replaceAll(",", "");

        if (!no_comma_date.equals("")) {
            Date new_date = calendarService.parseDatetime(no_comma_date);
            if (depart) {
                specificTimeRequest = specificTimeRequest.concat("&departure_time=" + new_date.getTime() / 1000);
            } else {
                specificTimeRequest = specificTimeRequest.concat("&arrival_time=" + new_date.getTime() / 1000);
            }
        }

        return specificTimeRequest;
    }


    @Override
    public JSONObject getJSONResponse(String apiurl) throws IOException {
        URL url = new URL(apiurl);
        Scanner scanner = new Scanner(url.openStream());

        String response = "";
        while (scanner.hasNextLine()) {
            response += scanner.nextLine();
        }

        return new JSONObject(response);
    }


    @Override
    public List<Leg> getLegList(String origin, String destination, boolean depart, String date) throws IOException, ParseException {


        JSONObject response = getJSONResponse(createPostURL(origin, destination, depart, date));
        List<Leg> legList = new ArrayList<>();

        JSONArray routes = response.getJSONArray("routes");
        for (int i = 0; i < routes.length(); i++) {
            JSONObject jsonRoute = routes.getJSONObject(i);
            JSONObject jsonLeg = jsonRoute.getJSONArray("legs").getJSONObject(0);
            Leg leg = legInfoService.buildLeg(jsonLeg, jsonRoute);
            JSONArray steps = jsonLeg.getJSONArray("steps");

            String json_steps = steps.toString();
            leg.setJson_steps(json_steps);

            for (int j = 0; j < steps.length(); j++) {
                JSONObject jsonStep = steps.getJSONObject(j);
                Step step = stepInfoService.buildStep(jsonStep);
                leg.addStep(step);
            }

            legList.add(leg);
        }
        return legList;
    }

    @Override
    public Date joinDateTime(Date date, Time time) {
        date.setTime(date.getTime() + time.getTime());

        if (date.before(new Date())) {
            date = new Date();
        }

        return date;
    }


}
