package org.ht.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.junit.Test;

import sun.misc.BASE64Decoder;

public class Base64Utils {

	public static String getMD5(String pwd) throws NoSuchAlgorithmException {

		MessageDigest instance = MessageDigest.getInstance("md5");
		byte[] bb = instance.digest(pwd.getBytes());
		StringBuilder ss = new StringBuilder();
		for (byte b : bb) {
			if (Integer.toHexString(0xFF & b).length() == 1) {
				ss.append("0");
			}
			ss.append(Integer.toHexString(0xFF & b));
		}
		String p = ss.toString().toUpperCase();
		System.out.println(p);
		return p;

	}

	public static String getBASE64(byte[] b) {
		String s = null;
		if (b != null) {
			s = new sun.misc.BASE64Encoder().encode(b);
		}
		return s;

	}

	public static byte[] getFromBASE64(String s) {
		byte[] b = null;
		if (s != null) {
			BASE64Decoder decoder = new BASE64Decoder();
			try {
				b = decoder.decodeBuffer(s);
				return b;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return b;
	}

	@Test
	public void test() throws NoSuchAlgorithmException {
		String string = getMD5("31231231As");

		String q = string.replaceAll("[a-zA-Z]", "");
		System.out.println(string);
		System.out.println(q);
	}
}
