package pt.upskill.vias.services;

import java.text.ParseException;
import java.util.Date;

public interface CalendarService {

    String getCalendar();
    Date parseDate(String date) throws ParseException;

     String getNextMonth();

}
