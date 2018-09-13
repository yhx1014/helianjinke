package org.ht.util;

import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;

import org.ht.pojo.Log;
import org.junit.Test;

/**
 * 
 * 这个类是把前台传递过来的参数封装成Map,给xml调用
 * 
 * @author Administrator
 *
 */
public class BeanUtils {
	public static Map toMap(Object obj) {
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

	@Test
	public static void main(String[] args) {
		Log log = new Log();
		log.setLaccount("111");

		Map map = BeanUtils.toMap(log);
		System.out.println(map.get("laccount"));
	}

}
