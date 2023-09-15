package pt.upskill.vias.services;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;


@Service
public class DestinationServiceImpl implements DestinationService {


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

       
    @Override
    public String tripValue(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        if (routes.has("fare")) {
            JSONObject fare = routes.getJSONObject("fare");
            return fare.getString("text");
        } else {
            return "No fare value";
        }

    }

    @Override
    public String tripDuration(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject durationJSON = legs.getJSONObject("duration");
        return durationJSON.getString("text");
    }

    @Override
    public String tripDistance(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject distanceJSON = legs.getJSONObject("distance");
        return distanceJSON.getString("text");
    }

    @Override
    public String tripArrivalTime(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject arrivalTimeJSON = legs.getJSONObject("arrival_time");
        return arrivalTimeJSON.getString("text");
    }

    @Override
    public String tripDepartureTime(JSONObject obj) {
        JSONObject routes = obj.getJSONArray("routes").getJSONObject(0);
        JSONObject legs = routes.getJSONArray("legs").getJSONObject(0);
        JSONObject departureTimeJSON = legs.getJSONObject("departure_time");
        return departureTimeJSON.getString("text");
    }

    @Override
    public  List<String> tripSteps(JSONObject obj) {
        List<String> instructionsList = new ArrayList<>();
        try {
            JSONArray routes = obj.getJSONArray("routes");
            JSONArray legs = routes.getJSONObject(0).getJSONArray("legs");
            for (int i = 0; i < legs.length(); i++) {
                JSONObject leg = legs.getJSONObject(i);
                JSONArray steps = leg.getJSONArray("steps");
                for (int j = 0; j < steps.length(); j++) {
                    JSONObject step = steps.getJSONObject(j);
                    String travelMode = step.getString("travel_mode");
                    String instructions;

                    if (travelMode.equals("TRANSIT") && step.has("transit")) {
                        JSONObject transit = step.getJSONObject("transit");
                        JSONObject line = transit.getJSONObject("line");
                        String lineName = line.getString("name");
                        String vehicleType = line.getJSONObject("vehicle").getString("type");
                        String headsign = transit.getString("headsign");
                        String departureTime = transit.getJSONObject("departure_time").getString("text");
                        String agencyName = line.getJSONArray("agencies").getJSONObject(0).getString("name");

                        instructions = "Apanhar " + lineName + " (" + vehicleType + ")";
                        instructions += " - " + headsign;
                        instructions += " - Hora de Partida: " + departureTime;
                        instructions += " - Operadora: " + agencyName;
                    } else {
                        instructions = step.getString("html_instructions").replaceAll("\\<.*?\\>", ""); // Remove HTML tags
                    }

                    String distance = step.getJSONObject("distance").getString("text");
                    String duration = step.getJSONObject("duration").getString("text");

                    // Build the instruction string
                    String instructionString = instructions + "\nDistância: " + distance + ", Tempo Estimado: " + duration;
                    instructionsList.add(instructionString);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        for(String s : instructionsList) {
            System.out.println(s);
        }
        return instructionsList;
    }

}



