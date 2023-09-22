package pt.upskill.vias.services.utils;

import java.text.ParseException;
import java.util.Date;

public interface CalendarService {

    String getCalendar();

    Date parseDate(String date) throws ParseException;

    String dateToString(Date date);

    String getNextMonth();

}
