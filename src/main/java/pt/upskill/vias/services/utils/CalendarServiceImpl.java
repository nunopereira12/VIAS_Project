package pt.upskill.vias.services.utils;


import org.springframework.stereotype.Service;

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

    @Override
    public Date parseDatetime(String datetime) throws ParseException {
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
            return format.parse(datetime);
    }


    public String dateToString(Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(date);
    }

    @Override
    public String getNextMonth() {
        Date currentDate = new Date();

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(currentDate);

        calendar.add(Calendar.MONTH, 1);

        Locale locale = new Locale("pt", "PT");
        SimpleDateFormat sdf = new SimpleDateFormat("MMM/yyyy", locale);
        String formattedDate = sdf.format(calendar.getTime());

        formattedDate = formattedDate.substring(0, 1).toUpperCase() + formattedDate.substring(1);

        return formattedDate;
    }

}
