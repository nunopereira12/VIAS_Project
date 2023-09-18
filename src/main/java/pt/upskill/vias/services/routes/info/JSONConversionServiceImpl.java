package pt.upskill.vias.services.routes.info;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Leg;
import pt.upskill.vias.models.routes.Step;

import java.util.ArrayList;
import java.util.List;

@Service
public class JSONConversionServiceImpl implements JSONConversionService {

    @Autowired
    StepInfoService stepInfoService;

    @Override
    public JSONObject stringToObject(String obj_string) {
        return (JSONObject) JSONObject.stringToValue(obj_string);
    }

    @Override
    public List<Step> addSteps(Leg leg) {
        List<Step> steps = new ArrayList<>();

        String json_steps = leg.getJson_steps();
        JSONArray array = new JSONArray(json_steps);

        for(int i = 0; i< array.length(); i++) {
            JSONObject json_step = (JSONObject) array.get(i);
            Step step = stepInfoService.buildStep(json_step);
            steps.add(step);
        }

        return steps;
    }

}
