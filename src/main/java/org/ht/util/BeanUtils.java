package org.ht.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
import org.ht.pojo.Log;
import org.junit.Test;

public class BeanUtils {
	public static Map<String, Object> toMap(Object obj) {
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
					e.printStackTrace();
				} catch (IllegalArgumentException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				}
			}
		} catch (SecurityException e) {
			e.printStackTrace();
		}
		return reMap;
	}

	@Test
	public static void main(String[] args) {
		Log log = new Log();
		log.setLaccount("111");

		Map<?, ?> map = BeanUtils.toMap(log);
		System.out.println(map.get("laccount"));
	}

}
