package pt.upskill.vias.services.viasleague;


import org.springframework.stereotype.Service;
import pt.upskill.vias.services.CalendarService;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Locale;

@Service
public class CalendarServiceImpl implements CalendarService {
    @Override
    public String getCalendar() {
        Date currentDate = new Date();


        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);


        Locale locale = new Locale("pt", "PT");
        SimpleDateFormat sdf = new SimpleDateFormat("MMM/yyyy", locale);


        String formattedDate = sdf.format(currentDate);
        formattedDate = formattedDate.substring(0, 1).toUpperCase() + formattedDate.substring(1);

        return formattedDate;
    }

    @Override
    public Date parseDate(String date) throws ParseException {
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        return formatter.parse(date);
    }
}
