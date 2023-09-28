package pt.upskill.vias.services.utils;

import java.sql.Time;
import java.text.ParseException;
import java.util.Date;

public interface CalendarService {

    String getCalendar();

    Date parseDate(String date) throws ParseException;

    String dateToString(Date date);

    String getNextMonth();

    String dayFirstDate(String date);

    Date mergeTimeDate(String date, String time);


}
