package pt.upskill.vias.services;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URL;
import java.util.Scanner;

@Service
public class DestinationServiceImpl implements DestinationService {


    @Override
    public String createPostURL(String origin, String destination) {
        return "https://maps.googleapis.com/maps/api/directions/json?origin="+origin+"&destination="+destination+"&key=AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs&mode=transit&language=pt";
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
    public String tripValue(JSONObject obj) {
        return null;
    }

    @Override
    public String tripDuration(JSONObject obj) {
        return null;
    }

    @Override
    public String tripDistance(JSONObject obj) {
        return null;
    }

    @Override
    public String tripArrivalTime(JSONObject obj) {
        return null;
    }

    @Override
    public String tripDepartureTime(JSONObject obj) {
        return null;
    }


}
