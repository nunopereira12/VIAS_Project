package pt.upskill.vias.services.routes.info;

import org.json.JSONObject;

public interface LineInfoService {

    public String icon(JSONObject obj);
    public String color(JSONObject obj);
    public String text_color(JSONObject obj);
    public String short_name(JSONObject obj);
    public String name(JSONObject obj);
}
