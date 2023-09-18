package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;

import java.util.List;

public interface JSONConversionService {

    public JSONObject stringToObject(String obj_string);

    public Leg addSteps(Leg leg);
}
