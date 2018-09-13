package org.ht.util;

import java.util.Calendar;
import java.util.Date;

public class Test {
	public static void main(String[] args) {
		Date date = new Date(System.currentTimeMillis() + (1000 * 60 * 60 * 24 * 30));
		Calendar calendar = Calendar.getInstance();// 时间转换
		for (int i = 0; i < 12; i++) {
			calendar.setTime(date);
			calendar.add(Calendar.SECOND,  60 * 60 * 24 * 30);
			date = calendar.getTime();
			System.out.println(date.toLocaleString());

		}
		
	}

}
