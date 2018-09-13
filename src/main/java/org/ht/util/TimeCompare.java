package org.ht.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class TimeCompare {
	
	public int Compare(String DATE1, String DATE2) {

		   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	        try {
	            Date dt1 = df.parse(DATE1);
	            Date dt2 = df.parse(DATE2);
	            if (dt1.getTime() < dt2.getTime()) {
	            	System.out.println("dt1   =  "+dt1.getTime());
	            	System.out.println("dt2   =  "+dt2.getTime());
	                return 1;
	            } else if (dt1.getTime() > dt2.getTime()) {
	                //System.out.println("dt1鍦╠t2鍚�);
	                return -1;
	            } else {
	                return 0;
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	        return 0;
	}
	
	public static void main(String[] args) {

		   SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm");
	        try {
	            Date dt1 = df.parse(new Date().toLocaleString());
	            Date dt2 = df.parse("2017-01-12 00:00:00");
	            System.out.println("dt1   =  "+dt1.getTime());
            	System.out.println("dt2   =  "+dt2.getTime());
	            if (dt1.getTime() < dt2.getTime()) {
	            	  System.out.println("鐜板湪鏃堕棿姣旈」鐩埌鏈熸椂闂存棭");
	            } else if (dt1.getTime() > dt2.getTime()) {
	            	  System.out.println("鐜板湪鏃堕棿姣旈」鐩埌鏈熸椂闂存櫄");
	            } else {
	            	
	            }
	        } catch (Exception exception) {
	            exception.printStackTrace();
	        }
	}
}
