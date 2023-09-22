package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;

import java.util.List;

public interface JSONConversionService {

    Leg addSteps(Leg leg);
    void addStepsLegList(List<Leg> legs);
}
