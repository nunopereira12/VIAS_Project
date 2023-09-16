package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;
import pt.upskill.vias.models.routes.Line;

public interface LineInfoService {

    public String color(JSONObject obj);
    public String text_color(JSONObject obj);
    public String short_name(JSONObject obj);
    public String name(JSONObject obj);
    public Line buildLine(JSONObject transit_details);
}
