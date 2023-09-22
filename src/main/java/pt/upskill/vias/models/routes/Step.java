package pt.upskill.vias.models.routes;

public class Step {

    private String distance;
    private int distanceValue;
    private String duration;
    private int durationValue;
    private String polyline;
    private String html_instructions;
    private String travel_mode;
    private double points;
    private String icon;
    private String departure_stop;
    private String departure_time;
    private String arrival_stop;
    private String arrival_time;
    private String headsign;
    private int num_stops;
    private Line line;

    public Step(){}

    public Step(String distance, String duration, String polyline, String html_instructions, String travel_mode, String icon) {
        this.distance = distance;
        this.duration = duration;
        this.polyline = polyline;
        this.html_instructions = html_instructions;
        this.travel_mode = travel_mode;
        this.icon = icon;
    }

    public Step(String distance, String duration, String polyline, String html_instructions, String travel_mode, String icon, String departure_stop, String departure_time, String arrival_stop, String arrival_time, String headsign, int num_stops, Line line) {
        this.distance = distance;
        this.duration = duration;
        this.polyline = polyline;
        this.html_instructions = html_instructions;
        this.travel_mode = travel_mode;
        this.icon = icon;
        this.departure_stop = departure_stop;
        this.departure_time = departure_time;
        this.arrival_stop = arrival_stop;
        this.arrival_time = arrival_time;
        this.headsign = headsign;
        this.num_stops = num_stops;
        this.line = line;
    }

    public String getDistance() {
        return distance;
    }

    public void setDistance(String distance) {
        this.distance = distance;
    }

    public int getDistanceValue() {
        return distanceValue;
    }

    public void setDistanceValue(int distanceValue) {
        this.distanceValue = distanceValue;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public int getDurationValue() {
        return durationValue;
    }

    public void setDurationValue(int durationValue) {
        this.durationValue = durationValue;
    }

    public String getPolyline() {
        return polyline;
    }

    public void setPolyline(String polyline) {
        this.polyline = polyline;
    }

    public String getHtml_instructions() {
        return html_instructions;
    }

    public void setHtml_instructions(String html_instructions) {
        this.html_instructions = html_instructions;
    }

    public String getTravel_mode() {
        return travel_mode;
    }

    public void setTravel_mode(String travel_mode) {
        this.travel_mode = travel_mode;
    }

    public double getPoints() {
        return points;
    }

    public void setPoints(double points) {
        this.points = points;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getDeparture_stop() {
        return departure_stop;
    }

    public void setDeparture_stop(String departure_stop) {
        this.departure_stop = departure_stop;
    }

    public String getDeparture_time() {
        return departure_time;
    }

    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
    }

    public String getArrival_stop() {
        return arrival_stop;
    }

    public void setArrival_stop(String arrival_stop) {
        this.arrival_stop = arrival_stop;
    }

    public String getArrival_time() {
        return arrival_time;
    }

    public void setArrival_time(String arrival_time) {
        this.arrival_time = arrival_time;
    }

    public String getHeadsign() {
        return headsign;
    }

    public void setHeadsign(String headsign) {
        this.headsign = headsign;
    }

    public int getNum_stops() {
        return num_stops;
    }

    public void setNum_stops(int num_stops) {
        this.num_stops = num_stops;
    }

    public Line getLine() {
        return line;
    }

    public void setLine(Line line) {
        this.line = line;
    }
}
