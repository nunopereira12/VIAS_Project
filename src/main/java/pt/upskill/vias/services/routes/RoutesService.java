package pt.upskill.vias.services.routes;

import org.json.JSONObject;
import org.springframework.stereotype.Service;

import java.util.List;

public interface RoutesService {

    public List<String> tripSteps(JSONObject obj);
}
