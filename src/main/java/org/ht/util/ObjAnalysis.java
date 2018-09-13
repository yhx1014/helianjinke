package org.ht.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.ht.pojo.Log;

public class ObjAnalysis {
	public static Map ConvertObjToMap(Object obj) {
		Map<String, Object> reMap = new HashMap<String, Object>();
		if (obj == null)
			return null;
		Field[] fields = obj.getClass().getDeclaredFields();
		try {
			for (int i = 0; i < fields.length; i++) {
				try {
					Field f = obj.getClass().getDeclaredField(fields[i].getName());
					f.setAccessible(true);
					Object o = f.get(obj);
					reMap.put(fields[i].getName(), o);
				} catch (NoSuchFieldException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SecurityException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reMap;
	}

	public static void main(String[] args) {
		Log a = new Log();
		a.setLaccount("123456");
		a.setId(1);
		Map m = ConvertObjToMap(a);
		System.out.println(m);
	}
}
