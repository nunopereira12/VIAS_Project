package pt.upskill.vias.models.routes;

public class Line {

    private String color;
    private String text_color;
    private String name;

    public Line() {}

    public Line(String color, String text_color, String name) {
        this.color = color;
        this.text_color = text_color;
        this.name = name;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getText_color() {
        return text_color;
    }

    public void setText_color(String text_color) {
        this.text_color = text_color;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
