package pt.upskill.vias.services.utils;

import java.text.ParseException;
import java.util.Date;

public interface CalendarService {

    String getCalendar();

    Date parseDate(String date) throws ParseException;

    Date parseDatetime(String datetime) throws ParseException;

    String dateToString(Date date);

    String getNextMonth();

}
