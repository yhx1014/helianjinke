package org.ht.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public abstract class ZqUtil {
	
	public static Date strchangedate(String date) {
		try {
			if (date.length() < 12) {
				date = date + " 00:00:00";
			}
			SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			return sim.parse(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
}
