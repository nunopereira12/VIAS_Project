package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URL;
import java.util.Scanner;

@Service
public class RoutesRequestServiceImpl implements RoutesRequestService {


    @Override
    public String createPostURL(String origin, String destination) {
        String apiKey = "AIzaSyDDHXeHO_gegeY8AJ_QRvjVv2D_KTQ82Bs";
        String noSpacesOrigin = origin.replaceAll(" ", "+");
        String noSpacesDestination = destination.replaceAll(" ", "+");
        return "https://maps.googleapis.com/maps/api/directions/json?origin=" + noSpacesOrigin + "&destination=" + noSpacesDestination + "&key=" + apiKey + "&mode=transit&language=pt-PT";
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
}
