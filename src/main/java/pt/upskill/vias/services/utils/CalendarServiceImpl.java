package pt.upskill.vias.services.utils;


import org.springframework.stereotype.Service;

import java.sql.Time;
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

    @Override
    public String dayFirstDate(String date) {
        String[] dateArray = date.split("-");
        String year = dateArray[0];
        dateArray[0] = dateArray[2];
        dateArray[2] = year;
        return dateArray[0]+"-"+dateArray[1]+"-"+dateArray[2];
    }

    @Override
    public Date mergeTimeDate(String date, String time) {

        String no_comma_date = date.replaceAll(",","");
        String no_comma_time = time.replaceAll(",","");
        String[] date_array = no_comma_date.split("-");
        String[] time_array = no_comma_time.split(":");
        int year = Integer.parseInt(date_array[0]);
        int month = Integer.parseInt(date_array[1]);
        int day = Integer.parseInt(date_array[2]);
        int hours = Integer.parseInt(time_array[0]);
        int minutes = Integer.parseInt(time_array[1]);

        Calendar calendar = Calendar.getInstance();
        calendar.set(Calendar.YEAR, year);
        calendar.set(Calendar.MONTH, month - 1);
        calendar.set(Calendar.DAY_OF_MONTH, day);
        calendar.set(Calendar.HOUR_OF_DAY, hours);
        calendar.set(Calendar.MINUTE, minutes);

        return calendar.getTime();
    }

}
