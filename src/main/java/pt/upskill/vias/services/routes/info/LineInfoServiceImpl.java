package pt.upskill.vias.services.routes.info;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;
import pt.upskill.vias.models.routes.Line;

@Service
public class LineInfoServiceImpl implements LineInfoService {
    @Override
    public String color(JSONObject line) {
        try {
            return line.getString("color");
        } catch (JSONException e) {
            return "#000000";
        }
    }

    @Override
    public String text_color(JSONObject line) {
        try {
            return line.getString("text_color");
        } catch (JSONException e) {
            return "#FFFFFF";
        }
    }

    @Override
    public String short_name(JSONObject line) {
        return line.getString("short_name");
    }

    @Override
    public String name(JSONObject line) {
        return line.getString("name");
    }

    public Line buildLine(JSONObject transit_details) {
        Line line;

        JSONObject jsonLine = transit_details.getJSONObject("line");
        try {
            String short_name = short_name(jsonLine);
            line = new Line(color(jsonLine), text_color(jsonLine), short_name);
        } catch (JSONException e) {
            line = new Line(color(jsonLine), text_color(jsonLine), name(jsonLine));
        }

        return line;
    }
}
