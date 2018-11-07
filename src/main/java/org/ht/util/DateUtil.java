package org.ht.util;

import java.text.SimpleDateFormat;
import java.time.format.DateTimeParseException;
import java.util.Date;

public class DateUtil {
    /**
     * 将日期格式化xxxx.xx.xx格式
     *
     * @param date
     * @return
     */
    public static String formatToString(Date date) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
            return formatter.format(date).replaceAll("-", ".");
        } catch (DateTimeParseException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static String formateDatetosecond(Date date) {
        try {
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return formatter.format(date).replaceAll("-", ".");
        } catch (DateTimeParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
